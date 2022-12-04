package Controller;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.util.ArrayList;

import DAO.PostDaoImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class IntermediaireCategorie
 */
@WebServlet("/IntermediaireCategorie")
public class IntermediaireCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostDaoImpl post=new PostDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntermediaireCategorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String categorie=request.getParameter("nom");
		int id_categorie=-1;
		if(categorie.equals("sang")) {id_categorie=1;}
		if(categorie.equals("savoir")) {id_categorie=2;}
		if(categorie.equals("nourriture")) {id_categorie=3;}
		if(categorie.equals("autre")) {id_categorie=4;}
		HttpSession session=request.getSession();
		session.setAttribute("idcategorie", id_categorie);
		//System.out.print("kk "+session.getAttribute("idcategorie"));
		response.sendRedirect("template.jsp");
		////Integer id=(Integer) session.getAttribute("idcategorie");
		//ArrayList<Post> posts = PostDaoImpl.getPosts(id);
		//for(int i=0;i<posts.size();i++){	
			//System.out.println("i: "+i+" :"+posts.get(i).getText());
		//}
		//post.getPosts(id_categorie);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
