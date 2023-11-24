package Servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import DAO.UserDAO;
import DAO.VideoDAO;
import entity.Favorite;
import entity.Report;
import entity.Title;
import entity.User;
import entity.Video;
import utils.JpaUtil;

@WebServlet({"/DashboardServlet/index", "/DashboardServlet/users","/DashboardServlet/reports","/DashboardServlet/add",
	"/DashboardServlet/edit","/DashboardServlet/update","/DashboardServlet/delete", "/DashboardServlet/change",
	"/DashboardServlet/tdnd","/DashboardServlet/xnd","/DashboardServlet/DataServlet"})
@MultipartConfig
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    VideoDAO dao = new VideoDAO();
    UserDAO ndDao=new UserDAO();

    public DashboardServlet() {
        super();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String uri = req.getRequestURI();
        CountLikeByTitle(req, resp);
        if (uri.contains("add")) {
            this.AddVideo(req, resp);
            
        }
        if (uri.contains("edit")) {
        	String method = req.getMethod();
            if (method.equalsIgnoreCase("POST")) {
            String id=req.getParameter("id");
            Video vd=dao.findById(id);
            req.setAttribute("form",vd);
            data(req, resp);
            req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
            }
        }
        if (uri.contains("update")) {
            this.UpdateVideo(req, resp);
            
        }
        if (uri.contains("delete")) {
            this.Delete(req, resp);
            
        }
        if (uri.contains("users")) {
        	data(req, resp);
            req.getRequestDispatcher("/dbusers.jsp").forward(req, resp);
            
        }
        if(uri.contains("DataServlet")) {
        	HttpSession session=req.getSession();
        	List<User>nd=ndDao.selectAll();
            int pageSize = 3; // Số bản ghi trên mỗi trang
            int currentPage = (req.getParameter("page") != null) ? Integer.parseInt(req.getParameter("page")) : 1;
            int startRecord = (currentPage - 1) * pageSize;
            
            List<User> dataList =ndDao.findPage(currentPage - 1, pageSize); // Lấy dữ liệu từ CSDL
            
            int totalRecords = ndDao.getTotalRecords(); // Tổng số bản ghi
            
            int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
            
            req.setAttribute("dataList", dataList);
            req.setAttribute("currentPage", currentPage);
            req.setAttribute("totalPages", totalPages);
            
            session.setAttribute("selected", true);
    		req.setAttribute("nd",nd);
    		req.getRequestDispatcher("/dbusers.jsp").forward(req, resp);
    		this.CountLike(req,resp);
        }
        if (uri.contains("reports")) {
        	data(req, resp);
            req.getRequestDispatcher("/dbreports.jsp").forward(req, resp);
            
        }
        if (uri.contains("change")) {
        	String method = req.getMethod();
            if (method.equalsIgnoreCase("POST")) {
            String id=req.getParameter("id");
           User vd=ndDao.findByID(id);
            req.setAttribute("hehe",vd);
            data(req, resp);
            req.getRequestDispatcher("/dbusers.jsp").forward(req, resp);
            }
        }

        else if(uri.contains("xnd")) {
			String method = req.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				String id=req.getParameter("id");
				ndDao.delete(id);
				this.data(req, resp);
				req.getRequestDispatcher("/dbusers.jsp").forward(req,resp);
			}
		}
        else if(uri.contains("tdnd")) {
        	String method = req.getMethod();
        	if (method.equalsIgnoreCase("POST")) {
        	    try {
        	        User user = new User();
        	        BeanUtils.populate(user, req.getParameterMap());
        	        System.out.println(user);

        	        // Thêm dòng này để kiểm tra lỗi
        	        try {
        	            ndDao.update(user);
        	            req.setAttribute("msg", "Cập nhật thành công");
        	            System.out.println(user);
        	            this.data(req, resp);
        	            req.getRequestDispatcher("/dbusers.jsp").forward(req, resp);
        	        } catch (Exception e) {
        	            e.printStackTrace();
        	            req.setAttribute("msg", "Cập nhật thất bại");
        	        }

        	    } catch (Exception e) {
        	        e.printStackTrace();
        	        req.setAttribute("msg", "Có lỗi xảy ra khi điền dữ liệu vào đối tượng");
        	    }
        	}

		}
        else {
            data(req, resp);
         req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
        }
    }

    public void data(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Video> list = dao.selectAll();
        req.setAttribute("vd", list);
        List<User>nd=ndDao.selectAll();
        int pageSize = 3; // Số bản ghi trên mỗi trang
        int currentPage = (req.getParameter("page") != null) ? Integer.parseInt(req.getParameter("page")) : 1;
        int startRecord = (currentPage - 1) * pageSize;
        
        List<User> dataList =ndDao.findPage(currentPage - 1, pageSize); // Lấy dữ liệu từ CSDL
        
        int totalRecords = ndDao.getTotalRecords(); // Tổng số bản ghi
        
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        
        req.setAttribute("dataList", dataList);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalPages", totalPages);
        
       
		req.setAttribute("nd",nd);
		req.getRequestDispatcher("/dbusers.jsp").forward(req, resp);
		this.CountLike(req,resp);
    }
   public void CountLike(HttpServletRequest req, HttpServletResponse resp) {
	   EntityManager em = JpaUtil.getEntityManager();
		String jpql="SELECT new Report(o.video.title,count(o),max(o.LikeDate),min(o.LikeDate)) FROM Favorite o GROUP BY o.video.title";
		TypedQuery<Report>query=em.createQuery(jpql,Report.class);
		List<Report>ds=query.getResultList();
		req.setAttribute("ds",ds);
   }
   public void CountLikeByTitle(HttpServletRequest req, HttpServletResponse resp) {
	   HttpSession session = req.getSession();
	    EntityManager em = JpaUtil.getEntityManager();
	    String sy = req.getParameter("year");
	    String jpql = "SELECT NEW Title(u.id, u.fullname, u.email, f.LikeDate) " +
	              "FROM Favorite f " +
	              "JOIN f.user u " +
	              "JOIN f.video v " +
	              "WHERE v.title LIKE :title";

		TypedQuery<Title>query=em.createQuery(jpql,Title.class);
	    query.setParameter("title", sy ); // Chú ý thêm % để tìm kiếm các từ chứa trong title
	    
	    List<Title> list = query.getResultList();
	    req.setAttribute("video", list);
	    session.setAttribute("selected", sy);
	}


    private void Update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {

			try {
				User user = new User();
				BeanUtils.populate(user, req.getParameterMap());
				ndDao.update(user);
				req.setAttribute("msg", "Cập nhật thành công");
				System.out.println(user);
				data(req, resp);
				req.getRequestDispatcher("/dbusers.jsp").forward(req, resp);
//					req.setAttribute("form",user);

			} catch (Exception e) {
				req.setAttribute("msg", "Cập nhật thất bại");
			}

		}
	}


    private void AddVideo(HttpServletRequest req, HttpServletResponse resp) {
        String method = req.getMethod();
        if (method.equalsIgnoreCase("POST")) {
            try {
                // Thư mục lưu trữ ảnh
                String uploadPath = getServletContext().getRealPath("/images");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Xử lý tệp ảnh
                Part photoPart = req.getPart("poster");
                String fileName = photoPart.getSubmittedFileName();
                File photoFile = new File(uploadDir, fileName);
                photoPart.write(photoFile.getPath());

                // Populate thông tin từ form
                Video vid = new Video();
                BeanUtils.populate(vid, req.getParameterMap());
                vid.setPoster(fileName);
                if (vid.getId() != null) {
                    dao.create(vid);
                    req.setAttribute("msg", "Thêm video thành công!");
                    this.data(req,resp);
                    req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
                }
                else {
                	req.setAttribute("msg", "Không được bỏ trống Video Id!");
				}
            } catch (Exception e) {
                req.setAttribute("msg", "Tạo video thất bại!");
                e.printStackTrace();
            }
            
        }
    }
    
    private void UpdateVideo(HttpServletRequest req, HttpServletResponse resp) {
        String method = req.getMethod();
        if (method.equalsIgnoreCase("POST")) {
            try {
                // Thư mục lưu trữ ảnh
                String uploadPath = getServletContext().getRealPath("/images");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Xử lý tệp ảnh
                Part photoPart = req.getPart("poster");
                String originalFileName = photoPart.getSubmittedFileName();
                String fileExtension = "";
                int lastDotIndex = originalFileName.lastIndexOf(".");
                if (lastDotIndex != -1) {
                    fileExtension = originalFileName.substring(lastDotIndex);
                }

                String uniqueFileName = UUID.randomUUID().toString() + fileExtension;

                File photoFile = new File(uploadDir, uniqueFileName);
                
                if (photoFile.exists()) {
                    photoFile.delete();
                }
                
                photoPart.write(photoFile.getPath());

                // Populate thông tin từ form
                Video vid = new Video();
                BeanUtils.populate(vid, req.getParameterMap());
                vid.setPoster(uniqueFileName);
                System.out.println(vid);
                if (vid.getId() != null) {
                    dao.update(vid);
                    System.out.println("CẬP NHẬT RỒI NHA");
                    req.setAttribute("msg", "Cập nhật video thành công!");
                } else {
                	System.out.println("CHƯA ĐƯỢC ĐÂU BITCH");
                	
                    req.setAttribute("msg", "Không được bỏ trống Video Id!");
                }

                // Forward the request to the dashboard.jsp page
                this.data(req,resp);
                req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
            } catch (Exception e) {
                req.setAttribute("msg", "Cập nhật video thất bại!");
                e.printStackTrace();
                // Forward the request to the dashboard.jsp page
//                req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
            }
        }
    }
    private void Delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null) {
            dao.delete(id);
            System.out.println("ĐÃ XÓA");
            req.setAttribute("msg", "Xóa thành công");
            this.data(req,resp);
            req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
        } else {
            req.setAttribute("msg", "Không được bỏ trống ID");
        }
        
        
    }



}
