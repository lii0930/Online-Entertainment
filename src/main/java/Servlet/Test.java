package Servlet;

import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import entity.User;

/**
 * Servlet implementation class Test
 */

public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO dao = new UserDAO();
	User user = new User();
	int random = 0;
    /**
     * @see HttpServlet#HttpServlet()
     */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
//		if (uri.contains("sign-in")) {
		if (uri.contains("check-mail")) {
			this.doCheckmail(req, resp);
		}
		else if (uri.contains("forgot-password")) {
			this.doForgotPassword(req, resp);
		}
		else {
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		}
	}
	public void doCheckmail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			// TODO: CẬP NHẬT
			req.setCharacterEncoding("utf-8");
			resp.setCharacterEncoding("utf-8");

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
			String toemail = req.getParameter("to");
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
					req.setAttribute("msg", "Vui lòng kiểm tra email của bạn!");
//					req.getRequestDispatcher("/forgetpass.jsp").forward(req,resp);
				} else {
					req.setAttribute("msg", "Không tìm thấy địa chỉ email");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	private void doForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			int pin=Integer.parseInt(req.getParameter("pin"));
			String pass=req.getParameter("newpassword");
			String renew=req.getParameter("renew");
			String mail=req.getParameter("to");
			try {
				User user = dao.findByEmail(mail);
				if (user != null) {
					if(pin==random) {
						if(pass.equals(renew)) {
							user.setPassword(pass);
							dao.update(user);
							req.setAttribute("msg", "Đổi mật khẩu thành công");
//							req.getRequestDispatcher("/forgetpass.jsp").forward(req,resp);
						} else {
							req.setAttribute("msg", "Xác nhận mật khẩu không khớp");
//							req.getRequestDispatcher("/forgetpass.jsp").forward(req,resp);
						}
					}
					else {
						req.setAttribute("msg", "Sai mã PIN");
					}
				}
				else {
					req.setAttribute("msg", "Không được bỏ trống email!");
				}
			} catch (Exception e) {
				req.setAttribute("msg", "Cập nhật thất bại");
			}

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


