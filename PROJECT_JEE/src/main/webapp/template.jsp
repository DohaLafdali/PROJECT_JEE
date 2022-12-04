<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
        <%@page import="java.util.Set"%>
            <%@page import="java.util.HashSet"%>
        
    
    <%@page import="java.sql.Timestamp"%>
    <%@page import="java.util.Date"%>
    <%@page import="java.text.SimpleDateFormat"%>
      <%@page import="java.util.ArrayList"%>
   <%@ page import="Models.Utilisateur" %>
   <%@ page import="DAO.ChatDaoImpl" %>
   <%@ page import="Models.Chat" %>
   <%@ page import="Models.Post"%>
   <%@ page import="Models.Like"%>
   <%@ page import="DAO.LikeDaoImpl"%>
   <%@ page import="Models.Commentaire"%>
   <%@ page import="DAO.PostDaoImpl" %>
   <%@ page import="DAO.UtilisateurDaoImpl" %>
   <%@ page import="DAO.CommentaireDaoImpl" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="Controller.CreateLike" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta http-equiv="refresh" content="1000">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="./images/logo.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="style.css">
<title>Aatae</title>
<style type="text/css">

.upload_wrapper {
            position: relative;
            overflow: hidden;
                cursor: pointer;
        }
        .upload_wrapper input.upload {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            padding: 0;
            font-size: 20px;
            cursor: pointer;
            opacity: 0;
            filter: alpha(opacity=0);
        }
        
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

#snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  bottom: 30px;
  font-size: 17px;
}

#snackbar.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;} 
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;} 
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
</style>
</head>

<body>
<%        

Integer id_user=(Integer) session.getAttribute("iduser");
     
 %>
	<nav>
		<div class="nav-left">
			<img src="./images/logo.png" alt="Logo">
		</div>

		<div class="nav-middle">
			<a href="#" class="active"> <i class="fa fa-home"></i>
			
			</a>
		</div>
		<% if(id_user != null){
          UtilisateurDaoImpl user2=new UtilisateurDaoImpl();
     %>
		<div class="nav-right">
			
			<a href="profile.jsp?id=<%=id_user%>">
          <img src="./images/posts/<%=user2.getOneO(id_user).getImage_profil() %>" >
           </a>
		 
			<a href="#"> <i class="fa fa-bell"></i></a> 
			<a href="postsaved.jsp"><i class="fa fa-bookmark"></i></a>
			
			<a href="Login?logout=true"><i class="fa fa-sign-out-alt"></i>
			</a>
		</div>
		<%} %>
	</nav>

	<div class="container"  id="blur">
		<div class="left-panel">
		<%
			if(id_user != null){
	          UtilisateurDaoImpl user2=new UtilisateurDaoImpl();
	     
ChatDaoImpl cm=new ChatDaoImpl();

	final List<Chat> chats = cm.getChatOfUser(id_user);
	//ArrayList <Integer> ls = cm.getDiscussion(id);

	List<Integer> array_L= new ArrayList<Integer>();
	for(int i=0;i<chats.size();i++){
	//out.println(chats.get(i).getContent());
	//out.println(chats.get(i).getTo_user());
	array_L.add(chats.get(i).getTo_user());
	}
	Set<Integer> mySet = new HashSet<Integer>(array_L);
	  // Créer une Nouvelle ArrayList à partir de Set
	List<Integer> array_L2 = new ArrayList<Integer>(mySet);
	
%>


<aside>
<header>
Liste des discussions
</header>
<ul class="nav-sidebar">
<%
        UtilisateurDaoImpl userdao=new UtilisateurDaoImpl();
        for(int j=0;j<array_L2.size();j++){

        Utilisateur user=userdao.getOneO(array_L2.get(j));
        final List<Chat> diss = ChatDaoImpl.getChat(id_user, user.getId());
        if(id_user!=array_L2.get(j)){
         %>
<li onclick="conversation(<%= array_L2.get(j)%>);">

<img src="./images/posts/<%=userdao.getOneO(array_L2.get(j)).getImage_profil() %>" >

<div>
<h2><%out.println(user.getUsername()); %></h2>
<input name="id" type="text" value="<%= array_L2.get(j)%>" hidden>
<h3>
<span class="status green"></span>
En ligne
</h3>
</div>
</li>
<% } }%>
</ul>
</aside>

			<%} %>

		</div>


		<div class="middle-panel">

			<div class="story-section">           

				<div  class="story">
					<img src="./images/sang.jpg" alt="sang" id="img0" class="image">
					<div class="text">
                     <h1>Sang</h1>
                    </div>
				</div>
							
				
      
				<div  class="story">
					<img src="./images/savoir.jpg" alt="savoir" id="img1" class="image"> 
					<div class="text">
                     <h1>Savoir</h1>
                    </div>			
				</div>

				<div  class="story">
					<img src="./images/nouriture.jpg" alt="nouriture" id="img2" class="image">
					<div class="text">
                     <h1>Nourriture</h1>
                    </div>
				</div>

				<div  class="story">
					<img src="./images/autree.jpg" alt="autre" id="img3" class="image"> 
					<div class="text">
                     <h1>Autre</h1>
                    </div>
				</div>
			</div>
			
            <!-- create new post -->
           <% 
           String type_user=request.getParameter("visiteur");
           UtilisateurDaoImpl user=new UtilisateurDaoImpl();
           String disabled="";
           if(id_user != null){ 
        	  
        %>
          
			<div class="post create">
			<form action="./CreatePost" method="post" enctype="multipart/form-data">
				<div class="post-top">
					<div class="dp">
          <img src="./images/posts/<%=user.getOneO(id_user).getImage_profil() %>" >

          					</div>
						
					


					<div class="db">
						<input type="text" name="post" placeholder="What's on your mind, Aashish ?" id="post"/>
						<input type="submit" value="publier" id="public_post">
							</div>			



				</div>
				
				<div class="post-bottom">
					<div class="action">
						<i class="fa fa-video"></i> <span>Live video</span>
					</div>
					<div class="action">
					 <div class="upload_wrapper" style="float: left;" id="up0">
                     <div style="text-align: center;">
                      <i class="fa fa-image"></i> <span>Photo/Video</span>
                      </div>
                      <input type = "file" name ="photo"  style="width: 100px;height:100px;" class="upload" />
                      </div>
					</div>
					<div class="action">
						<i class="fa fa-smile"></i> <span>Feeling/Activity</span>
					</div>
				</div>
				</form>

			</div>
		<% 	 }
           else{ 
        	    disabled="disabled";
           %>
        	   <div class="post create">
   			
   		<h3>		rejoignez nous d'abord pour faire de donation
   					Ils ont besoin de vous. </h3>
   					
   				<button ><a href="formulaireregister.jsp" style='text-decoration: none;color:black;'>creer compte </a> </button>
   				
   			</div>
          <%  }
		%> 
<% 
List<Integer> list = new ArrayList<Integer>();
list.add(2);
list.add(23);
Integer id=(Integer) session.getAttribute("idcategorie");
final String usersnames="";
//d=0;
//System.out.print(id);
	if(id != null){
		LikeDaoImpl like = new LikeDaoImpl();
		CommentaireDaoImpl commentaireDaoImpl = new CommentaireDaoImpl();
  final List<Post> posts = PostDaoImpl.getPosts(id);
 
		for(int i=0;i<posts.size();i++){	
			final List<Commentaire> cmnts=CommentaireDaoImpl.getCmnt(posts.get(i).getId());
			final List<Like> likes=LikeDaoImpl.getLikes(posts.get(i).getId());
			
			System.out.println("red "+cmnts);
			int idp;
			int cmp=0;
			Utilisateur utilisateur =  user.getOneO(posts.get(i).getUser());
		    session.setAttribute("idpost", posts.get(i).getId());
		%>
			<div class="post">
				<div class="post-top">
					<div class="dp">
              <img src="./images/posts/<%= user.getOneO(posts.get(i).getUser()).getImage_profil()%>" >					</div>
					<div class="post-info">
						<p class="name" onclick="profile(<%=posts.get(i).getUser()%>);"><%out.println(utilisateur.getUsername());%></p>
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


				</div>

				<div class="post-content">

					<%out.println(posts.get(i).getText());%><br>

		<%
					String imgFileName=posts.get(i).getPhoto_name();
				%>
				  <img src="./images/posts/<%= imgFileName%>"  style="width:300px;height:250px">
                             

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
					<div  class="action" >
						
					<%int help = posts.get(i).getId();%>
					
					    <form action="./CreateLike" method="post">


						<span onclick="like(<%=i %>);">
						<i class="<%=CreateLike.heart%>" aria-hidden="true" id="likes<%=i %>" style="color:red;" ></i>
						<button type="submit" value="n" <%=disabled %>>Like</button></span>

						
						<input type="text" name="help" value="<%=posts.get(i).getId()%>" hidden>
						<input type="text" name="page" value="template" hidden>
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
			<% if(id_user != null){  %>
				<div class="sendComment">
					<form action="./CreateCommentaire" method="post">
						<div>
							<input id="commentaire_text" name="comment" type="text">
							<input name="idpost" type="text" value="<%=posts.get(i).getId() %>" hidden>
							<button id="create_comment" type="submit"><i class="fa fa-light fa-location-arrow"></i></button>
							
						</div>
					</form>
					
				</div>
			<% } %>
					<div class="afficheComment" id=<%= i %>  style="display: none;">
					
					<%
					  for(int j=0;j<cmnts.size();j++){
					    	if(cmnts.get(j).getPost() == posts.get(i).getId()){
					    		 idp=posts.get(i).getId();%>
					    		 <div class="uniqueComment">
					    		  <div class="typePro">
					    		 <div class="dp"> 
                             <img src="./images/posts/<%= user.getOneO(cmnts.get(j).getUser()).getImage_profil()%>" >
                    </div>
					<h5><%out.println(commentaireDaoImpl.getUsers(posts.get(i).getId(),cmnts.get(j).getUser())); %></h5><br>
					</div>
					<p>
					<% 
					out.println(cmnts.get(j).getText());
						if(id_user != null){
				          UtilisateurDaoImpl user2=new UtilisateurDaoImpl();
					 %>
				<% 
				if(cmnts.get(j).getUser() == (Integer)session.getAttribute("iduser") || posts.get(i).getUser() == (Integer)session.getAttribute("iduser")){%>
					<i   class="fa fa-trash" onclick="deleteComnt(<%=cmnts.get(j).getId()%>,<%=posts.get(i).getUser()%>,<%=cmnts.get(j).getUser()%>);"></i>
					<%}} %>


					</p></div></br>

					<% }  } 
					%>
					</div>
					
			</div>
		<%}	 }  
		  
		  
%>
		</div>
		
	</div>



	


	<script type="text/javascript">
	
	document.addEventListener('DOMContentLoaded', () => {
		const images = document.querySelectorAll('.image');
		images.forEach(image => (
		image.addEventListener('click', function(event) {
		const clickedImage = this;
		console.log(this.id);
		const elt1=document.getElementById("img0").style.border="none";
		const elt2=document.getElementById("img1").style.border="none";
		const elt3=document.getElementById("img2").style.border="none";
		const elt4=document.getElementById("img3").style.border="none";
		switch (this.id) {
		  case "img0":
			  window.location.href='IntermediaireCategorie?nom=sang';
			  document.getElementById("img0").style.border = "5px solid #8AABBE";
			    break;
			  case "img1":
				  this.style.border = "5px solid #8AABBE";
				  window.location.href='IntermediaireCategorie?nom=savoir';
			    break;
			  case "img2":
				  this.style.border = "5px solid #8AABBE";
				  window.location.href='IntermediaireCategorie?nom=nourriture';
			    break;
			  case "img3":
				  this.style.border = "5px solid #8AABBE";
				  window.location.href='IntermediaireCategorie?nom=autre';
				    break;
			  
			}
})
	))
		});
	

	function getIdPost(help){
		window.location.href='CreateLike?help='+help;
	}
	function profile(id){
		console.log(id);
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
	document.location.href='CreatePost?aide='+aide;
}
function deleteComnt(idcoment,idu,idc){
	document.location.href='DeleteCommentaire?idcoment='+idcoment+"&idu="+idu+"&idc="+idc;


function like(i){
	   like=document.getElementById('likes'+i);
	console.log(like)
	if(like.style.color != "black"){
		 like.style.color = "black";
	 } else {
		  like.style.color= "red";
	}
	};


function showMystere(i){
	var objMysere = document.getElementById('mystere'+i);
	console.log(objMysere)
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


}
function conversation(id){
	document.location.href='chat.jsp?id='+id;
	}
</script>
</body>

</html>