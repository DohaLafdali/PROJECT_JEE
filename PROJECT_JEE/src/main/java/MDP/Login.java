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
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
	  private void authenticate(HttpServletRequest request, HttpServletResponse response)
			    throws Exception {
	        String email = request.getParameter("email");
	        String password = request.getParameter("pass");
	        System.out.println("from line 57: "+email+" "+ password);
	        
	        if (compte.validate(email, password)) {
	        	
	            RequestDispatcher dispatcher = request.getRequestDispatcher("template.html");
	            dispatcher.forward(request, response);
	        } else {
	        	
	            throw new Exception("Login not successful..");
	        }
	    }
}
