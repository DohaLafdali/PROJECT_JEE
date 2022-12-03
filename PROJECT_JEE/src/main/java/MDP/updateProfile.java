package MDP;

import jakarta.servlet.http.HttpServlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class updateProfile
 */
@WebServlet("/updateProfile")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)
public class updateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProfile() {
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
		doGet(request, response);
		Integer id=Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String profile = request.getParameter("profile");
		//out.print(username);	   
		
		

		 // Input stream of the upload file
       //InputStream inputStream;
       Part filePart= request.getPart("photo");

	
           // Prints out some information
           // for debugging
           System.out.println(
               filePart.getName());
           System.out.println(
               filePart.getSize());
           System.out.println(
               filePart.getContentType());
 
           // Obtains input stream of the upload file
           InputStream inputStream
               = filePart.getInputStream();
      
           System.out.println("input: "+
           		inputStream );
		//System.out.println("photo"+photo);

       //Start
       String imageFileName=filePart.getSubmittedFileName();  // get selected image file name
		String uploadPath="C:/Users/simens/git/PROJECT_JEE/PROJECT_JEE/src/main/webapp/images/posts/"+imageFileName;  // upload path where we have to upload our actual image		
		try
		{
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=filePart.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
       
       //End
		
		
		
	    Utilisateur user = new Utilisateur();
	    user.setId(id);
	    user.setEmail(email);
	    user.setUsername(username);
	    user.setImage_profil(imageFileName);
	    user.setPassword(password);
	    UtilisateurDaoImpl userdao = new UtilisateurDaoImpl();
	    userdao.update(user);
	    
	    response.sendRedirect("profile.jsp?id="+id);
	}

}
