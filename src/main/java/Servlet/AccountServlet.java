package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import java.util.Map.Entry;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import DAO.FavoriteDAO;
import DAO.UserDAO;
import DAO.VideoDAO;
import entity.Favorite;
import entity.Report;
import entity.User;
import entity.Video;
import utils.JpaUtil;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet({"/account/index", "/account/sign-in", "/account/sign-up", "/account/sign-out", "/account/forgot-password",
		"/account/change-password", "/account/edit-profile", "/account/check-mail",
		"/account/like", "/account/un","/account/yeuthich","/account/list","/account/khac","/account/chiase" })
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 UserDAO dao = new UserDAO();
	User user = new User();
	Favorite fv = new Favorite();
	static FavoriteDAO fvdao = new FavoriteDAO();
	VideoDAO vdao=new VideoDAO();
	int random;
	int yeuthich=0;
	static VideoDAO vd = new VideoDAO();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		System.out.println(uri);
//		this.Like(req,resp);
		this.Data(req, resp);
		if (uri.contains("sign-in")) {
			this.doSignIn(req, resp);
		} else if (uri.contains("sign-up")) {
			this.doSignUp(req, resp);
		} else if (uri.contains("edit-profile")) {
			this.doUpdate(req, resp);
		}
		else if (uri.contains("change-password")) {
			this.doChangePassword(req, resp);
		}
		else if (uri.contains("check-mail")) {
			this.doCheckmail(req, resp);
		}
		else if (uri.contains("forgot-password")) {
			this.doForgotPassword(req, resp);
		}
		else if (uri.contains("sign-out")) {
			req.getSession().removeAttribute("user");
			this.Data(req, resp);
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		}
		else if (uri.contains("index")) {
			this.Data(req, resp);
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
		else if (uri.contains("yeuthich")) {
			this.Data(req, resp);
			EntityManager em = JpaUtil.getEntityManager();
			User user = (User) req.getSession().getAttribute("user");
			String jpql="SELECT o.video FROM Favorite o WHERE o.user.id LIKE :id";
			TypedQuery<Video>query=em.createQuery(jpql,Video.class);
			query.setParameter("id", user.getId());
			List<Video>vd = query.getResultList();
			req.setAttribute("favorites", vd);
			req.getRequestDispatcher("/listvideo.jsp").forward(req, resp);
	}
		else if (uri.contains("like")) {
			this.Data(req, resp);
			User user = (User) req.getSession().getAttribute("user");
			System.out.println(user);
			String id= req.getParameter("id");
			Video vd = vdao.findById(id);
			System.out.println(vd);
			Date currentDate = new Date();
			fv.setUser(user);
			fv.setVideo(vd);
			fv.setLikeDate(currentDate);
			try {
				fvdao.create(fv);
				System.out.println("THÊM THÀNH CÔNG >>>>" + fv);
				resp.sendRedirect("index");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else if (uri.contains("un")) {
			this.Data(req, resp);
			try {
				EntityManager em = JpaUtil.getEntityManager();
				User user = (User) req.getSession().getAttribute("user");
				String videoId = req.getParameter("id");
				em.getTransaction().begin();
				String queryString = "DELETE FROM Favorite o WHERE o.user.id = :id AND o.video.id = :vdid";
				Query deleteQuery = em.createQuery(queryString);
				deleteQuery.setParameter("id", user.getId());
				deleteQuery.setParameter("vdid", videoId);

				deleteQuery.executeUpdate();
				em.getTransaction().commit();
			} 
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			resp.sendRedirect("index");
		}
		else if (uri.contains("list")) {
			this.Data(req, resp);
			try {
				EntityManager em = JpaUtil.getEntityManager();
				User user = (User) req.getSession().getAttribute("user");
				String videoId = req.getParameter("id");
				em.getTransaction().begin();
				String queryString = "DELETE FROM Favorite o WHERE o.user.id = :id AND o.video.id = :vdid";
				Query deleteQuery = em.createQuery(queryString);
				deleteQuery.setParameter("id", user.getId());
				deleteQuery.setParameter("vdid", videoId);

				deleteQuery.executeUpdate();
				em.getTransaction().commit();
			} 
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			req.getRequestDispatcher("/listvideo.jsp").forward(req, resp);
		}
		else if (uri.contains("chiase")) {
			this.Share(req, resp);
		}
		else if (uri.contains("khac")) {
			this.Data(req, resp);
			User user = (User) req.getSession().getAttribute("user");
			System.out.println(user);
			String id= req.getParameter("id");
			Video vd = vdao.findById(id);
			System.out.println(vd);
			Date currentDate = new Date();
			fv.setUser(user);
			fv.setVideo(vd);
			fv.setLikeDate(currentDate);
			try {
				fvdao.create(fv);
				System.out.println("THÊM THÀNH CÔNG >>>>" + fv);
				req.getRequestDispatcher("/listvideo.jsp").forward(req, resp);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		else {
			this.Data(req, resp);
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	}
	
	
	
	
	public static void Data(HttpServletRequest req, HttpServletResponse resp) {
		User user = (User) req.getSession().getAttribute("user");
		System.out.println(user);
		List<Video> list = vd.selectAll();
		req.setAttribute("vd", list);
		List<Favorite> like = fvdao.findAll();
		req.setAttribute("like", like);
		
	}
	
	
	
	private void doSignIn(HttpServletRequest req, HttpServletResponse resp) {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String email = req.getParameter("id");
			String pass = req.getParameter("password");
			try {
				User user = dao.findOne(email, pass);
				System.out.println("User: " + user);
				if (user != null) {
					req.getSession().setAttribute("user", user);
					this.Data(req, resp);
					req.getRequestDispatcher("/index.jsp").forward(req, resp);
				} else {
					req.setAttribute("msg", "Sai tên đăng nhập hoặc mật khẩu!");
					req.getRequestDispatcher("/login.jsp").forward(req, resp);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

		}
		req.setAttribute("form", user);
	}

	private void doSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			// TODO: ĐĂNG KÝ
			try {
				BeanUtils.populate(user, req.getParameterMap());
				System.out.println(user);
				user.setAdmin(true);
				dao.create(user);
				System.out.println(user);
				req.setAttribute("msg", "Tạo tài khoản thành công!");
				req.getRequestDispatcher("/login.jsp").forward(req, resp);
			} catch (Exception e) {
				req.setAttribute("msg", "Tạo tài khoản thất bại!");
//				req.getRequestDispatcher("/signup.jsp").forward(req, resp);
				e.printStackTrace();
			}

		}
	}

	private void doUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {

			try {
				User user = (User) req.getSession().getAttribute("user");
				BeanUtils.populate(user, req.getParameterMap());
				dao.update(user);
				req.setAttribute("msg", "Cập nhật thành công");
				System.out.println(user);
				req.getRequestDispatcher("/update.jsp").forward(req, resp);
//					req.setAttribute("form",user);

			} catch (Exception e) {
				req.setAttribute("msg", "Cập nhật thất bại");
			}

		}
	}
	
	private void doChangePassword(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			System.out.println("bbbb");
			String email = req.getParameter("id");
			String pass = req.getParameter("password");
			String newpass = req.getParameter("newpassword");
			String renew = req.getParameter("renew");
//			System.out.println(renew);
//			System.out.println(newpass);
//			System.out.println(pass);
//			System.out.println(email);
			try {
				User user = dao.findOne(email, pass);
				if (user != null) {
					if (newpass.equals(renew)) {
						user.setPassword(newpass);
						dao.update(user);
						req.setAttribute("msg", "Đổi mật khẩu thành công");
						req.getRequestDispatcher("/index.jsp").forward(req, resp);
					} else {

						req.setAttribute("msg", "Xác nhận mật khẩu không khớp");
					}
				} else {
					req.setAttribute("msg", "Sai tên đăng nhập hoặc mật khẩu");
				}
			} catch (Exception e) {
				req.setAttribute("msg", "Đổi mật khẩu thất bại");
				e.printStackTrace();
			}
		}
	}

	public void doCheckmail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String method = req.getMethod();
	    if (method.equalsIgnoreCase("POST")) {
	        req.setCharacterEncoding("utf-8");
	        resp.setCharacterEncoding("utf-8");

	        String toemail = req.getParameter("to");
	        if (toemail == null || toemail.isEmpty()) {
	            req.setAttribute("msg", "Email không được bỏ trống!");
	        } else {
	            final String username = "phuongplups25732@fpt.edu.vn";
	            final String password = "osrdvqdhfbadlcgz";

	            Properties props = new Properties();
	            props.put("mail.smtp.host", "smtp.gmail.com");
	            props.put("mail.smtp.port", "587");
	            props.put("mail.smtp.auth", "true");
	            props.put("mail.smtp.starttls.enable", "true");

	            // Get the Session object.
	            Session s = Session.getInstance(props, new javax.mail.Authenticator() {
	                @Override
	                protected PasswordAuthentication getPasswordAuthentication() {
	                    return new PasswordAuthentication(username, password);
	                }
	            });

	            random = snn();
	            try {
	                User user = dao.findByEmail(toemail);
	                if (user != null) {
	                    Message msg = new MimeMessage(s);
	                    msg.setFrom(new InternetAddress(username));
	                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toemail));
	                    msg.setSubject("QUÊN MẬT KHẨU");
	                    msg.setText("Mã PIN của bạn là: " + random);
	                    Transport.send(msg);
	                    req.setAttribute("msg", "Vui lòng kiểm tra email của bạn để nhận mã PIN!");
	                } else {
	                    req.setAttribute("msg", "Không tìm thấy địa chỉ email trong hệ thống!");
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	                req.setAttribute("msg", "Gửi email thất bại. Vui lòng thử lại sau!");
	            }
	        }
	    }
	    
	    // Chuyển hướng sau khi xử lý yêu cầu
	    req.getRequestDispatcher("/forgetpass.jsp").forward(req, resp);
	}
	
	private void Share(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String method = req.getMethod();
    if (method.equalsIgnoreCase("POST")) {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String toemail = req.getParameter("email");
        String id = req.getParameter("videoId");

        if (toemail == null || toemail.isEmpty()) {
            req.setAttribute("msg", "Email không được bỏ trống!");
        } else {
            final String username = "phuongplups25732@fpt.edu.vn";
            final String password = "osrdvqdhfbadlcgz";

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session s = Session.getInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            try {
                Message msg = new MimeMessage(s);
                msg.setFrom(new InternetAddress(username));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toemail));
                msg.setSubject("CHIA SẺ VIDEO");
                msg.setText("http://localhost:8080/ASM/VideoServlet/detail?id=" + id); // Chỉnh id= thay vì id=?
                Transport.send(msg);

                req.setAttribute("msg", "CHIA SẺ THÀNH CÔNG!");
                System.out.println("CHIA SẺ THÀNH CÔNG");
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("msg", "Gửi email thất bại. Vui lòng thử lại sau!");
            }
        }
    }

    // Chuyển hướng sau khi xử lý
    req.getRequestDispatcher("/index.jsp").forward(req, resp);
}



	private void doForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String method = req.getMethod();
	    if (method.equalsIgnoreCase("POST")) {
	        int pin = Integer.parseInt(req.getParameter("pin"));
	        String pass = req.getParameter("newpassword");
	        String renew = req.getParameter("renew");
	        String mail = req.getParameter("to");

	        try {
	            User user = dao.findByEmail(mail);
	            if (user != null) {
	                if (pin == random) { // Kiểm tra mã PIN nhập vào có khớp với mã PIN ngẫu nhiên không
	                    if (pass.equals(renew)) {
	                        user.setPassword(pass);
	                        dao.update(user);
	                        req.setAttribute("msg", "Đổi mật khẩu thành công");
	                    } else {
	                        req.setAttribute("msg", "Xác nhận mật khẩu không khớp");
	                    }
	                } else {
	                    req.setAttribute("msg", "Sai mã PIN");
	                }
	            } else {
	                req.setAttribute("msg", "Không được bỏ trống email!");
	            }
	        } catch (Exception e) {
	            req.setAttribute("msg", "Cập nhật thất bại");
	        }

	        req.getRequestDispatcher("/forgetpass.jsp").forward(req, resp);
	    }
	}


	public int snn() {
		for (int i = 0; i < 5; i++) {
			random = ThreadLocalRandom.current().nextInt();
			System.out.println(random);
		}
		return random;

	}
}
	



