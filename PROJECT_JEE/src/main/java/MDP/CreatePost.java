 package MDP;


import java.io.FileOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class CreatePost
 */
@WebServlet("/CreatePost")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)  
public class CreatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//public static InputStream fis;
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
	@SuppressWarnings("resource")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub
	//	doGet(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String text= request.getParameter("post");
		String photo= request.getParameter("photo");
		
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
		String uploadPath="C:/Users/Dell/git/PROJECT_JEE/PROJECT_JEE/src/main/webapp/images/posts/"+imageFileName;  // upload path where we have to upload our actual image		
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
         
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		HttpSession session=request.getSession();
		Integer idcategorie=(Integer) session.getAttribute("idcategorie");
		Integer iduser=(Integer) session.getAttribute("iduser");
		System.out.println("categorie "+idcategorie);
		System.out.println("user "+iduser);
		post.setId_categorie(idcategorie);
		post.setText(text);
		post.setPhoto(inputStream);
		post.setPhoto_name(imageFileName);
		System.out.println(post.getPhoto());
	//	post.setTime_post(date);
		post.setUser(iduser);
		System.out.println(idcategorie);
		post.setTime_post(timestamp);
		System.out.println(post);
		postdao.add(post);

		//delete POST
		
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("template.jsp");   
		dispatcher.forward(request, response);

	}

}
