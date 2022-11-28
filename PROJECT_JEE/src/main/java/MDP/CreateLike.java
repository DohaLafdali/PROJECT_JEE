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
 * Servlet implementation class CreateLike
 */
@WebServlet("/CreateLike")
public class CreateLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Like like = new Like();   
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
		HttpSession session=request.getSession();
		//Integer idcategorie=(Integer) session.getAttribute("idcategorie");
		Integer iduser=(Integer) session.getAttribute("iduser");
		System.out.print("idpost=====>"+i);
		System.out.print("iduser=====>"+iduser);
		
		like.setPost(i);
		like.setUser(iduser);
		LikeDaoImpl likeDaoImpl = new LikeDaoImpl();
		if(likeDaoImpl.UtilisateurUnique(i,iduser)<1) {
		likeDaoImpl.add(like);
		System.out.print("good!");
		//response.sendRedirect("template.jsp");
    	 RequestDispatcher dispatcher = request.getRequestDispatcher("template.jsp");
         dispatcher.forward(request, response);
		}
		else {
			System.out.print("gher mara whda a shrif !!");
	     	 RequestDispatcher dispatcher = request.getRequestDispatcher("template.jsp");
	            dispatcher.forward(request, response);
		}
	}

}
