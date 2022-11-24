package MDP;

import jakarta.servlet.http.HttpServlet;


import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class CreatePost
 */
@WebServlet("/CreatePost")
public class CreatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PostDaoImpl postdao=new PostDaoImpl();
    Post post=new Post();
    DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String text= request.getParameter("post");
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		HttpSession session=request.getSession();
		Integer idcategorie=(Integer) session.getAttribute("idcategorie");
		Integer iduser=(Integer) session.getAttribute("iduser");
		System.out.println("categorie "+idcategorie);
		System.out.println("user "+iduser);
		post.setId_categorie(idcategorie);
		post.setText(text);
		post.setPhoto("cc");
	//	post.setTime_post(date);
		post.setUser(iduser);
		System.out.println(idcategorie);
		post.setTime_post(timestamp);
		System.out.println(post);
		postdao.add(post);
		//response.sendRedirect("template.jsp");
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
