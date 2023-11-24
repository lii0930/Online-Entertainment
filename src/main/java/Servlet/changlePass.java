package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ExampleServlet")
public class changlePass extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse response)
            throws ServletException, IOException {
    	String email = req.getParameter("id");
		String pass = req.getParameter("password");
		String newpass = req.getParameter("newpassword");
		String renew = req.getParameter("renew");

        // Xử lý logic ở đây với dữ liệu nhận được từ JSP

        // Ví dụ: Kiểm tra thông tin đăng nhập
        if (email != null) {
            // Thành công, chuyển hướng đến trang welcome.jsp
            response.sendRedirect("index.jsp");
        } else {
            // Thất bại, chuyển hướng đến trang error.jsp
            response.sendRedirect("detail.jsp");
        }
    }
}