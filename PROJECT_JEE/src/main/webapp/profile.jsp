<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 
    <%@page import="java.util.List"%> 
    <%@page import="java.sql.Timestamp"%> 
    <%@page import="java.util.Date"%> 
    <%@page import="java.text.SimpleDateFormat"%> 
      <%@page import="java.util.ArrayList"%> 
   <%@ page import="Models.Utilisateur" %> 
   <%@ page import="Models.Post"%> 
   <%@ page import="Models.Like"%> 
   <%@ page import="DAO.LikeDaoImpl"%> 
   <%@ page import="Models.Commentaire"%> 
   <%@ page import="DAO.PostDaoImpl" %> 
   <%@ page import="DAO.UtilisateurDaoImpl" %> 
   <%@ page import="DAO.CommentaireDaoImpl" %> 
 <%@ page import="Controller.CreateLike" %>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<link rel="shortcut icon" href="./images/logo.png" type="image/x-icon"> 
<link rel="stylesheet" 
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" 
 integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" 
 crossorigin="anonymous" referrerpolicy="no-referrer" /> 
<link rel="stylesheet" href="profile.css"> 
<title>Aatae</title> 


</head> 
<meta charset="ISO-8859-1"> 
<title>Insert title here</title> 
<style>
.mystere {
    background-color: rgba(0, 0, 0, 0.05);
	position: relative;
	border-radius: 10px;
	width:100px;
	-webkit-box-shadow: -2px 0px 11px 5px rgba(183,183,183,0.8); 
    box-shadow: -2px 0px 11px 5px rgba(183,183,183,0.8);
}
 .mystere p {
	font-family: cursive;
	font-style: italic;
	font-weight: bold;
	margin-left:10px;
   
}
</style>
</head> 
<body> 
<nav> 
  <div class="nav-left"> 
   <img src="./images/logo.png" alt="Logo"> 
  </div> 
 
  <div class="nav-middle"> 
   <a href="template.jsp" class="active"> <i class="fa fa-home"></i> 
   </a> 
  </div> 
 
  <div class="nav-right"> 
   <a href="Login?logout=true"><i class="fa fa-sign-out-alt"></i>
   </a> 
  </div> 
 </nav> 
 
 <% int aide=0;
 Integer id=Integer.parseInt(request.getParameter("id"));
 UtilisateurDaoImpl userdao=new UtilisateurDaoImpl();
 Utilisateur user=userdao.getOneO(id);
 %>
 
 <div class="container" id="blur" > 
 <div class="top-profile"> 

    <div class="pro">    

     <div class="pro-img"> 
      
        <%
					String imgProfile=user.getImage_profil();
				%>
				  <img src="./images/posts/<%= imgProfile%>"  >
                             
   
    <% 	
	
	
	System.out.println("user: "+user);
    %>  
		   <h1 style="text-align:center;"><%out.println(user.getUsername()); %></h1> 
		   <p> Le but de la vie est de trouv?? des dons. Le but de la vie est d'en faire don aux autres.<p>
		      
     </div> 
      <div class="edit">
      <%  if(id == session.getAttribute("iduser")){
               %>    
               <button onclick="toggle()"><i class="fas fa-edit"></i>edit profile</button>
              
	 
   <% }else{
	   %>    <button onclick='send(<%=id%>)'><i class="fas fa-comments"></i>Message</button> 
	   <%
   }
        
        %>
      
      </div>
    </div> 
    <div class="test"> 
     
        <div class="middle-panel"> 
           
            <% 
	
          
	//if(id == session.getAttribute("iduser")){
	PostDaoImpl Postdao=new PostDaoImpl();
	LikeDaoImpl like = new LikeDaoImpl();
	CommentaireDaoImpl commentaireDaoImpl = new CommentaireDaoImpl();
	  List<Post> posts = Postdao.getPostsUser(id);
	  int idp;
	  for(int i=0;i<posts.size();i++){
		  final List<Commentaire> cmnts=CommentaireDaoImpl.getCmnt(posts.get(i).getId());
			final List<Like> likes=LikeDaoImpl.getLikes(posts.get(i).getId());
			
		  %> 
		   <div class="post"> 
		  <div class="post-top"> 
                    <div class="dp"> 
           <img src="./images/posts/<%= userdao.getOneO(id).getImage_profil()%>" >
                    </div> 
                    <div class="post-info"> 
                        <p class="name"><% out.println(user.getUsername()); %></p> 
                        <%  SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss"); 
						    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
						   // Date d1 = sdf.parse(timestamp);
						    long difference_in_time =  timestamp.getTime()- posts.get(i).getTime_post().getTime();
						    long difference_in_secondes = (difference_in_time/1000)%60;
						    long difference_in_minutes = (difference_in_time/(1000*60))%60;
						    long difference_in_hours = (difference_in_time/(1000*60*60))%24;
						    long difference_In_Years= (difference_in_time/ (1000l * 60 * 60 * 24 * 365));			  
			            	long difference_In_Days = (difference_in_time / (1000 * 60 * 60 * 24))% 365;
						    System.out.println("time: "+difference_in_hours);
						%>
						<span class="time"><%out.println("il y a "+difference_In_Days +":"+difference_in_hours+":"+difference_in_minutes+":"+difference_in_secondes);%></span>
                  
                    </div> 
                    <%  if(id == session.getAttribute("iduser")){
                    	%> 
                    	<%  aide= posts.get(i).getId(); 
     					System.out.println("test "+aide);
     					%> 
                    	<i class="fa fa-trash" id="<%=aide %>" onclick="deletepost(<%=aide %>)"></i>
     					
                    	
                <%    } %>
                   
                </div> 
 			<div class="post-content">

					<%out.println(posts.get(i).getText());%><br>

		<%
					String imgFileName=posts.get(i).getPhoto_name();
				%>
				  <img src="./images/posts/<%=posts.get(i).getPhoto_name()%>"  style="width:300px;height:250px">

					
			</div>
				<br><a style="text-decoration:none" href="#" onMouseover="javascript:showMystere(<%=i %>)" onMouseout="javascript:hideMystere(<%=i %>)"> il y a <%out.print(like.nombreLikes(posts.get(i).getId())); %>  likes</a>
           
					<!-- test popUP -->
					<div id="mystere<%=i %>" style="display:none" class="mystere">
                      <p> 
                      <%
					    for(int j=0;j<likes.size();j++){
					    	if(likes.get(j).getPost() == posts.get(i).getId()){
					    		 idp=posts.get(i).getId();%>
					    		 <i class="<%=CreateLike.heart%>" aria-hidden="true" style="color:red"></i>
					            <%  out.println(like.getUsers(posts.get(i).getId(),likes.get(j).getUser()));
					               
					               %>
					</br>
					<% }} 
					%></p>
                   </div>
					<!-- test popUP -->
				<div class="post-bottom">
					<div onclick="like(this);" class="action">
					<%int help = posts.get(i).getId();%>			
						<form action="./CreateLike" method="post">
						<span onclick="like(<%=i %>);">
						<i  class="<%=CreateLike.heart%>" aria-hidden="true" id="likes<%=i %>" style="color:red;" ></i>
						<button type="submit" value="n" >Like</button></span>
						
						<input type="text" name="help" value="<%=posts.get(i).getId()%>" hidden>
						<input type="text" name="page" value="profile" hidden>
						</form>
					</div>
					<div onclick="togg(<%= i %>);" class="action" >
						<i class="far fa-comment"></i> <span>Comment</span>
					</div>
					
					<form action="./savePost">
					<div class="action">
						<button type="submit"><i class="fa fa-share"></i></button> <span >sauvegarder</span>
						<input type="text" name="help" value="<%=posts.get(i).getId()%>" hidden>
					</div>
					</form>
					
					
					
				</div>	
				<div class="sendComment">
					<form action="./CreateCommentaire" method="post">
						<div>
							<input id="commentaire_text" name="comment" type="text">
							<input name="idpost" type="text" value="<%=  posts.get(i).getId() %>" hidden>
							<button id="create_comment" type="submit"><i class="fa fa-light fa-location-arrow"></i></button>
							
						</div>
					</form>
					
				</div>
				<div class="afficheComment" id=<%= i %>  style="display: none;">
					 
					<%
					  for(int j=0;j<cmnts.size();j++){
					    	if(cmnts.get(j).getPost() == posts.get(i).getId()){
					    		 idp=posts.get(i).getId();%>
					    		 <div class="uniqueComment">
					    		 <div class="typePro">
					    		 <div class="dp"> 
                             <img src="./images/posts/<%= userdao.getOneO(cmnts.get(j).getUser()).getImage_profil()%>" >
                    </div>
					<h5><%out.println(commentaireDaoImpl.getUsers(posts.get(i).getId(),cmnts.get(j).getUser())); %></h5><br>
					</div>
					<p>
					<% 
					
					out.println(cmnts.get(j).getText()); %>
					<% if(cmnts.get(j).getUser() == (Integer)session.getAttribute("iduser") ||posts.get(i).getUser() == (Integer)session.getAttribute("iduser")){%>
					<i   class="fa fa-trash" width="20px" height="20px" onclick="deleteComnt(<%=cmnts.get(j).getId()%>,<%=posts.get(i).getUser()%>,<%=cmnts.get(j).getUser()%>);"></i>
					<%} %>
					</p></div></br>
					<% }  } 
					%>
				</div>
					
					
					
			</div>
		<%}	
	  //}  
		  
		  
%>		
					
					
				
     
     </div>
 </div> 
  
 </div> 
 </div>
   <div id="popup">
          <a href="#" onclick="toggle()"><span aria-hidden="true" class="close">??</span></a>
         <form id="updateform" action="./updateProfile" method="post"  enctype="multipart/form-data">
         <div class="img">
           <img src="./images/posts/<%= userdao.getOneO(id).getImage_profil()%>" >
         </div>
         <div class="upload_wrapper" style="float: left;" id="up0">
                     <div style="text-align: center;">
                      <i class="fa fa-image"></i>edit photo
                      </div>
                      <input type = "file" name ="photo"  style="width: 100px;height:100px;" class="upload" />
                      </div><br>
	  <input name="username"  type="text" value="<%= userdao.getOneO(id).getUsername() %>"></br>
	  <input name="email" type="text" value="<%= userdao.getOneO(id).getEmail() %>"></br>
	  <input name="password" type="text" value="<%= userdao.getOneO(id).getPassword() %>"></br>
	  <input name="id" value="<%=id%>" type="hidden">
	  <button type="submit" >Edit</button>
	  </form>
    </div>
<script type="text/javascript">
function toggle() {
    var blur=document.getElementById('blur');
    blur.classList.toggle('active');
    var popup = document.getElementById('popup');
    popup.classList.toggle('active');
}
	
document.addEventListener('DOMContentLoaded', () => {
	const likes = document.querySelectorAll('.like');
	likes.forEach(like => (
	like.addEventListener('click', function(event) {
	const clickedlike = this;
	console.log(this.id);
	switch (this.id) {
	  case "like1":
		  document.getElementById("l1").style.color = "red";
		    break;
		  case "like2":
			  document.getElementById("l2").style.color = "red";
	}
	})
	))
	});
	
	function getIdPost(help){
		window.location.href='CreateLike?help='+help;
	}
	function profile(id){
		document.location.href='profile.jsp?id='+id;
		
	}
			
function togg(i){
   uniqueCommentaire=document.getElementById(i);
console.log(uniqueCommentaire)
  if(uniqueCommentaire.style.display != "none"){
	  uniqueCommentaire.style.display = "none";
  } else {
	  uniqueCommentaire.style.display= "block";
  }
};
function deletepost(aide){
	console.log(aide);
document.location.href='DeletePost?aide='+aide;
}
function deleteComnt(idcoment,idu,idc){
	document.location.href='DeleteCommentaire?idcoment='+idcoment+"&idu="+idu+"&idc="+idc;
}
function showMystere(i){
	var objMysere = document.getElementById('mystere'+i);
	if(objMysere){
	objMysere.style.display = 'block';
	}
	}
	function hideMystere(i){
	var objMysere = document.getElementById('mystere'+i);
	if(objMysere){
	objMysere.style.display = 'none';
	}
	}

function send(id){
	document.location.href='chat.jsp?id='+id;
}
</script>
 
</body> 
</html>