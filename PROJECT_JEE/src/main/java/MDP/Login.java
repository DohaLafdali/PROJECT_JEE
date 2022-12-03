package MDP;

import java.io.IOException;
import java.util.ArrayList;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtilisateurDaoImpl compte;
	public static Boolean info_wrong=false;

    /**
     * Default constructor. 
     */
    public Login() {
        // TODO Auto-generated constructor stub
    }

    public void init() {
    	compte = new UtilisateurDaoImpl();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 logout(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try {
			 //procedure d'authentification
	            authenticate(request, response);
	           
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	}
	  private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		  String logout=request.getParameter("logout");
		  if(logout.equals("true")) {
			  HttpSession session = request.getSession();
			  System.out.println("session: "+session.getAttribute("iduser"));
				session.invalidate();
				 //System.out.println("session: "+session.getAttribute("iduser"));
				response.sendRedirect("template.jsp");
			    return; 
		  }
		
	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response)
			    throws Exception {
	        String email = request.getParameter("email");
	        String password = request.getParameter("pass");
	       // System.out.println("from line 57: "+email+" "+ password);
	        HttpSession session=request.getSession();
	        
			//session.setAttribute("iduser", id_user);
	        if (compte.validate(email, password)) {
	        	Integer ls =compte.getByEmail(email);
	        	 //System.out.println(UtilisateurDaoImpl.getByEmail(email));
	        	 session.setAttribute("iduser", ls);
	        	 //String n=ls.get(0).getNomAdh()+" "+ls.get(0).getPrenomAdh();
	        	// session.setAttribute("nc", n);
	        	 System.out.println("bcbcbchdh"+session.getAttribute("iduser"));	            
	        	 RequestDispatcher dispatcher = request.getRequestDispatcher("template.jsp");
	            dispatcher.forward(request, response);
	        } else {
	        	info_wrong=true;
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
	            dispatcher.forward(request, response);
	          //  throw new Exception("Login not successful..");
	        }
	    }
}
