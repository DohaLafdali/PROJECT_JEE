package MDP;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteCommentaire
 */
@WebServlet("/DeleteCommentaire")
public class DeleteCommentaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CommentaireDaoImpl commentaire = new CommentaireDaoImpl();
    /**
     * Default constructor. 
     */
    public DeleteCommentaire() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Integer idcommentaire = Integer.parseInt(request.getParameter("idcoment"));
		Integer idu = Integer.parseInt(request.getParameter("idu"));
		Integer idc = Integer.parseInt(request.getParameter("idc"));
		HttpSession session = request.getSession();
		int idsession = (Integer) session.getAttribute("iduser");
		if(idsession==idu) {
			commentaire.delete(idcommentaire);
			System.out.println("ala slamtna");
			
			 response.sendRedirect("profile.jsp?id="+(Integer) session.getAttribute("iduser"));
		}
		if(idsession==idc) {
			commentaire.delete(idcommentaire);
			 response.sendRedirect("profile.jsp?id="+(Integer) session.getAttribute("iduser"));
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
