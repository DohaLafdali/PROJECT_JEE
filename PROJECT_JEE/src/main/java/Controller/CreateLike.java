package Controller;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;

import DAO.LikeDaoImpl;
import Models.Like;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateLike
 */
@WebServlet("/CreateLike")
public class CreateLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Like like = new Like();   
    public static String heart="far fa-heart";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateLike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		int i = Integer.parseInt(request.getParameter("help"));
		String page=request.getParameter("page");
		HttpSession session=request.getSession();
		Integer iduser=(Integer) session.getAttribute("iduser");
		
		like.setPost(i);
		like.setUser(iduser);
		LikeDaoImpl likeDaoImpl = new LikeDaoImpl();
		if(likeDaoImpl.UtilisateurUnique(i,iduser)<1) {
		likeDaoImpl.add(like);
		
         heart="fa fa-heart";
    	
    	if(page.equals("template"))
    		response.sendRedirect("template.jsp");
    	
    	else
    		response.sendRedirect("profile.jsp?id="+(Integer) session.getAttribute("iduser"));
		}
		else {
			likeDaoImpl.deleteLike(i, iduser);
			heart="far fa-heart";
			if(page.equals("profile"))
	    		response.sendRedirect("profile.jsp?id="+(Integer) session.getAttribute("iduser"));
			else
				response.sendRedirect("template.jsp");
	      
			 
		}
	}

}
