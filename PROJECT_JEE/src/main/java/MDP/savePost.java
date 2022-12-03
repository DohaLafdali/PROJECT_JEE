package MDP;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class savePost
 */
@WebServlet("/savePost")
public class savePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PostDaoImpl postdao = new PostDaoImpl();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public savePost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int id_post = Integer.parseInt(request.getParameter("help"));
		HttpSession session=request.getSession();
		Integer id=(Integer) session.getAttribute("iduser");
		PostSaved post = new PostSaved();
		post.setId_post(id_post);
		post.setId_user(id);
		postdao.save(post);
		RequestDispatcher dispatcher=request.getRequestDispatcher("template.jsp");   
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
