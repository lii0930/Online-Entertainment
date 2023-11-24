//package Servlet;
//
//import java.io.IOException;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//
//import javax.persistence.EntityManager;
//import javax.persistence.TypedQuery;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import DAO.FavoriteDAO;
//import DAO.UserDAO;
//import DAO.VideoDAO;
//import entity.Favorite;
//import entity.User;
//import entity.Video;
//import utils.JpaUtil;
//
///**
// * Servlet implementation class LikeServlet
// */
//@WebServlet({ "/LikeServlet" })
//public class LikeServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	UserDAO dao = new UserDAO();
//	User user = new User();
//	Favorite fv = new Favorite();
//	static FavoriteDAO fvdao = new FavoriteDAO();
//	VideoDAO vdao = new VideoDAO();
//	int yeuthich = 0;
//	static VideoDAO vd = new VideoDAO();
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("utf-8");
//		resp.setCharacterEncoding("utf-8");
//		String uri = req.getRequestURI();
//		this.Like(req, resp);
//		if (uri.contains("sign-in")) {
//			this.doSignIn(req, resp);
//		} else if (uri.contains("sign-out")) {
//			req.getSession().removeAttribute("user");
//			this.Data(req, resp);
//			req.getRequestDispatcher("/index.jsp").forward(req, resp);
//		} else if (uri.contains("index")) {
//			this.Data(req, resp);
//			req.getRequestDispatcher("/index.jsp").forward(req, resp);
//		} else if (uri.contains("like")) {
//			this.Data(req, resp);
//			User user = (User) req.getSession().getAttribute("user");
//			System.out.println(user);
//			String id = req.getParameter("id");
//			Video vd = vdao.findById(id);
//			System.out.println(vd);
//			System.out.println(user);
//			Date currentDate = new Date();
//			fv.setUser(user);
//			fv.setVideo(vd);
//			fv.setLikeDate(currentDate);
//			try {
//				fvdao.create(fv);
//				System.out.println("THÊM THÀNH CÔNG >>>>" + fv);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		} else if (uri.contains("unlike")) {
//			this.Data(req, resp);
//			EntityManager em = JpaUtil.getEntityManager();
//			User user = (User) req.getSession().getAttribute("user");
//			System.out.println(user);
//			String vd = req.getParameter("id");
//			System.out.println(vd);
//			TypedQuery<Video> query = em.createNamedQuery("Favorite.Delete", Video.class);
//			query.setParameter("id", user.getId());
//			query.setParameter("vdid", vd);
//			req.getRequestDispatcher("/index.jsp").forward(req, resp);
//		} else {
//			this.Data(req, resp);
//			req.getRequestDispatcher("/index.jsp").forward(req, resp);
//		}
//	}
//
//	public static void Data(HttpServletRequest req, HttpServletResponse resp) {
//		User user = (User) req.getSession().getAttribute("user");
//		System.out.println(user);
//		List<Video> list = vd.selectAll();
//		req.setAttribute("vd", list);
//		List<Favorite> like = fvdao.findAll();
//		req.setAttribute("like", like);
//	}
//
//	public void Like(HttpServletRequest req, HttpServletResponse resp) {
//		EntityManager em = JpaUtil.getEntityManager();
//		User user = (User) req.getSession().getAttribute("user");
//		if (user != null) {
//			String video = req.getParameter("videoid");
//			try {
//				TypedQuery<Video> query = em.createNamedQuery("Favorite.findByVideo", Video.class);
//				query.setParameter("id", user.getId());
//				query.setParameter("video", video);
//				List<Video> ds = query.getResultList();
//				System.out.println(ds);
//				if (ds != null) {
//					yeuthich = 1;
//					req.setAttribute("yeuthich", yeuthich);
//					req.getRequestDispatcher("/index.jsp").forward(req, resp);
//				} else {
//					yeuthich = 2;
//					req.setAttribute("yeuthich", yeuthich);
//					req.getRequestDispatcher("/index.jsp").forward(req, resp);
//				}
//
//			} catch (Exception e) {
//				// TODO: handle exception
//				e.printStackTrace();
//			}
//		}
//	}
//
//	private void doSignIn(HttpServletRequest req, HttpServletResponse resp) {
//		String method = req.getMethod();
//		if (method.equalsIgnoreCase("POST")) {
//			String email = req.getParameter("id");
//			String pass = req.getParameter("password");
//			try {
//				User user = dao.findOne(email, pass);
//				System.out.println("User: " + user);
//				if (user != null) {
//					req.getSession().setAttribute("user", user);
//					this.Data(req, resp);
//					req.getRequestDispatcher("/index.jsp").forward(req, resp);
//				} else {
//					req.setAttribute("msg", "Sai tên đăng nhập hoặc mật khẩu!");
//					req.getRequestDispatcher("/login.jsp").forward(req, resp);
//				}
//			} catch (Exception e) {
//				// TODO: handle exception
//				e.printStackTrace();
//			}
//
//		}
//		req.setAttribute("form", user);
//	}
//}