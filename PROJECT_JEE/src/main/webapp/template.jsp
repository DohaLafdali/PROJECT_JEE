<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
    <%@page import="java.sql.Timestamp"%>
    <%@page import="java.util.Date"%>
    <%@page import="java.text.SimpleDateFormat"%>
      <%@page import="java.util.ArrayList"%>
   <%@ page import="MDP.Utilisateur" %>
   <%@ page import="MDP.Post"%>
   <%@ page import="MDP.Like"%>
   <%@ page import="MDP.LikeDaoImpl"%>
   <%@ page import="MDP.Commentaire"%>
   <%@ page import="MDP.PostDaoImpl" %>
   <%@ page import="MDP.UtilisateurDaoImpl" %>
   <%@ page import="MDP.CommentaireDaoImpl" %>
      <%@ page import="MDP.ChatWebsocketEndpoint" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.sql.Blob" %>
   <%@ page import="MDP.CreateLike" %>

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
	<nav>
	


		<div class="nav-left">
			<img src="./images/logo.png" alt="Logo">
		</div>

		<div class="nav-middle">
			<a href="#" class="active"> <i class="fa fa-home"></i>
			
			</a>
		</div>
		<div id="notify">
		<%
		UtilisateurDaoImpl user=new UtilisateurDaoImpl();
		Integer id_user=(Integer) session.getAttribute("iduser");
		Set<Integer> mySet = new HashSet<Integer>(ChatWebsocketEndpoint.id_from);
	  	// public final Boolean etat=false;
  	    // Créer une Nouvelle ArrayList à partir de Set
  	    List<Integer> array_L2 = new ArrayList<Integer>(mySet);
  	    %>
		
		</div>
			<% if(id_user != null){
		%>	
		<div class="nav-right">
			<span class="profile"></span> 
			<button onclick="myFunction()"><i class="fa fa-bell"></i></button>

		<div id="snackbar">
		<%
		if(ChatWebsocketEndpoint.id == id_user){
			for(int l=0;l<array_L2.size();l++){
			out.println("vous avez un message de "+user.getOneO(array_L2.get(l)).getUsername());
			
		}}
		%>
		
		
		</div>
			
			<a href="#"> </a> 
		<a href="Login?logout=true"><i class="fa fa-sign-out-alt"></i>
			</a>
		
		</div>
		<% }	
			%>
	</nav>


	<div class="container"  id="blur">
		<div class="left-panel">
			<ul>
				<% if(id_user != null){ %>
				<li><span class="profile"></span>
					<a href="profile.jsp?id=<%=id_user%>"><% out.println(user.getOneO(id_user).getUsername()); %> </a></li>
				<%} %>
				<li><i class="fa fa-user-friends"></i>
					<p>Friends</p></li>
				<li><i class="fa fa-play-circle"></i>
					<p>meet</p></li>
				<li><i class="fa fa-bookmark"></i>
					<p>Bookmark</p></li>
				<li><a href="discussion.jsp"><i class="fab fa-facebook-messenger"></i>
					<p>Inbox</p></a></li>
				<li><i class="fas fa-calendar-week"></i>
					<p>Events</p></li>
				
			</ul>

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
           
           String disabled="";
           if(id_user != null){ 
        	  
        %>
          
			<div class="post create">
			<form action="./CreatePost" method="post" enctype="multipart/form-data">
				<div class="post-top">
					<div class="dp">
						<img src="./images/girl.jpg" alt="">
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
   			
   		<h3>		Join us and help others.
   					They need you. </h3>
   					
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
						<img src="./images/girl.jpg" alt="">
					</div>
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
					
					    <form action="./CreateLike"  >
						<span onclick="like(<%=i %>);">
						
						<button type="submit" value="n" <%=disabled %>><i  class="<%=CreateLike.heart%>" aria-hidden="true" id="likes<%=i %>" style="color:red;" ></i>  Like</button></span>

						
						<input type="text" name="help" value="<%=posts.get(i).getId()%>" hidden>
						<input type="text" name="page" value="template" hidden>
						</form>
						
					</div>
					<div onclick="togg(<%= i %>);" class="action" >
						<i class="far fa-comment"></i> <span>Comment</span>
					</div>
					
					<div class="action">
						<i class="fa fa-share"></i> <span>Share</span>
					</div>
					
					

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
					<h5><%out.println(commentaireDaoImpl.getUsers(posts.get(i).getId(),cmnts.get(j).getUser())); %></h5><br>
					<p>
					<% 
					
					out.println(cmnts.get(j).getText()); %>
				<%
				if((Integer)session.getAttribute("iduser") != null){
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

function myFunction() {
	  var x = document.getElementById("snackbar");
	  x.className = "show";
	  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	}
</script>
</body>

</html>