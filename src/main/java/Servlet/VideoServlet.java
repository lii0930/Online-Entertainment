package Servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.VideoDAO;

import entity.Video;
import utils.JpaUtil;

/**
 * Servlet implementation class VideoServlet
 */
@WebServlet({ "/VideoServlet/index", "/VideoServlet/detail" })
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VideoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = req.getRequestURI();
		VideoDAO dao = new VideoDAO();

		if (uri.contains("detail")) {
			String idpd = req.getParameter("id");
			System.out.println("GET ID FROM VIDEO >>> " + idpd);
			Video vd = dao.findById(idpd);
//			System.out.println("VIDEO ID >> " + vd.getId());
			req.setAttribute("pr", vd);

			EntityManager em = JpaUtil.getEntityManager();
			Query query = em.createNamedQuery("Report.random10");
			List<Video> ds = query.getResultList();
			req.setAttribute("videos", ds);
			

			req.getRequestDispatcher("/detail.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		}

	}

}
