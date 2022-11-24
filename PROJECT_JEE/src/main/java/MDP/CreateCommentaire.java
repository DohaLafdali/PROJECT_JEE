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
 * Servlet implementation class CreateCommentaire
 */
@WebServlet("/CreateCommentaire")
public class CreateCommentaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CommentaireDaoImpl comment = new  CommentaireDaoImpl(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCommentaire() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(request, response);
		String text = request.getParameter("comment");
		 HttpSession session=request.getSession();
		 System.out.println("idpost: "+request.getParameter("idpost"));
				 session.getAttribute("iduser");
		 

		 Commentaire c = new Commentaire();
			c.setPost(Integer.parseInt(request.getParameter("idpost")));
			c.setText(text);
			c.setUser((Integer) session.getAttribute("iduser"));
			comment.add(c);
			RequestDispatcher dispatcher=request.getRequestDispatcher("template.jsp");   
			dispatcher.forward(request, response);
		// System.out.println(session.getAttribute("idpost"));
		 }
	

}
