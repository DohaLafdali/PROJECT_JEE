<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
      <%@page import="java.util.ArrayList"%>
   <%@ page import="MDP.Utilisateur" %>
   <%@ page import="MDP.Post"%>
   <%@ page import="MDP.Commentaire"%>
   <%@ page import="MDP.PostDaoImpl" %>
   <%@ page import="MDP.UtilisateurDaoImpl" %>
   <%@ page import="MDP.CommentaireDaoImpl" %>
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
<link rel="stylesheet" href="style.css">
<style >

</style>
<title>MediaBook</title>
</head>

<body>
	<nav>
		<div class="nav-left">
			<img src="./images/logo.png" alt="Logo"> <input type="text"
				placeholder="Search Mediabook..">
		</div>

		<div class="nav-middle">
			<a href="#" class="active"> <i class="fa fa-home"></i>
			</a> <a href="#"> <i class="fa fa-user-friends"></i>
			</a> <a href="#"> <i class="fa fa-play-circle"></i>
			</a> <a href="#"> <i class="fa fa-users"></i>
			</a>
		</div>

		<div class="nav-right">
			<span class="profile"></span> <a href="#"> <i class="fa fa-bell"></i>
			</a> <a href="#"> <i class="fas fa-ellipsis-h"></i>
			</a>
		</div>
	</nav>


	<div class="container">
		<div class="left-panel">
			<ul>
				<li><span class="profile"></span>
					<p>Aashish Panthi</p></li>
				<li><i class="fa fa-user-friends"></i>
					<p>Friends</p></li>
				<li><i class="fa fa-play-circle"></i>
					<p>Videos</p></li>
				<li><i class="fa fa-flag"></i>
					<p>Pages</p></li>
				<li><i class="fa fa-users"></i>
					<p>Groups</p></li>
				<li><i class="fa fa-bookmark"></i>
					<p>Bookmark</p></li>
				<li><i class="fab fa-facebook-messenger"></i>
					<p>Inbox</p></li>
				<li><i class="fas fa-calendar-week"></i>
					<p>Events</p></li>
				<li><i class="fa fa-bullhorn"></i>
					<p>Ads</p></li>
				<li><i class="fas fa-hands-helping"></i>
					<p>Offers</p></li>
				<li><i class="fas fa-briefcase"></i>
					<p>Jobs</p></li>
				<li><i class="fa fa-star"></i>
					<p>Favourites</p></li>
			</ul>

			<div class="footer-links">
				<a href="#">Privacy</a> <a href="#">Terms</a> <a href="#">Advance</a>
				<a href="#">More</a>
			</div>
		</div>


		<div class="middle-panel">

			<div class="story-section">
                
				

				<div onclick="sang();" class="story">
					<img src="./images/model.jpg" alt="Anuska's story">
					<div class="dp-container">
						<img src="./images/girl.jpg" alt="">
					</div>
					<input name="categorie" type="submit" value="sang" hidden>
					<p class="name">Anuska Sharma</p>
				</div>
      
				<div onclick="savoir();" name="categorie" class="story">
					<img src="./images/boy.jpg" alt="Story image"> <span
						class="dp-container"> <img src="./images/dp.jpg"
						alt="Profile pic">
					</span> <span class="name">Gaurav Gall</span>
				</div>

				<div onclick="nourriture();" class="story">
					<img src="./images/mountains.jpg" alt="Story image"> <span
						class="dp-container"> <img src="./images/boy.jpg"
						alt="Profile pic">
					</span> <span class="name">Priyank Saksena</span>
				</div>

				<div onclick="autre();" class="story">
					<img src="./images/shoes.jpg" alt="Story image"> <span
						class="dp-container"> <img src="./images/model.jpg"
						alt="Profile pic">
					</span> <span class="name">Pragati Adhikari</span>
				</div>
			</div>
			
            <!-- create new post -->
            
			<div class="post create">
				<div class="post-top">
					<div class="dp">
						<img src="./images/girl.jpg" alt="">
					</div>
					<form action="./CreatePost">
					<input type="text" name="post" placeholder="What's on your mind, Aashish ?" />
					<input type="submit" value="publier">
					</form>
				</div>

				<div class="post-bottom">
					<div class="action">
						<i class="fa fa-video"></i> <span>Live video</span>
					</div>
					<div class="action">
						<i class="fa fa-image"></i> <span>Photo/Video</span>
					</div>
					<div class="action">
						<i class="fa fa-smile"></i> <span>Feeling/Activity</span>
					</div>
				</div>
			</div>
<% 
List<Integer> list = new ArrayList<Integer>();
list.add(2);
list.add(23);
Integer id=(Integer) session.getAttribute("idcategorie");

//d=0;
//System.out.print(id);

	if(id != null){
  final List<Post> posts = PostDaoImpl.getPosts(id);
		for(int i=0;i<posts.size();i++){	
			final List<Commentaire> cmnts=CommentaireDaoImpl.getCmnt(posts.get(i).getId());
			UtilisateurDaoImpl user=new UtilisateurDaoImpl();
			System.out.println("red "+cmnts);
			Utilisateur utilisateur =  user.getOneO(posts.get(i).getUser());
		    session.setAttribute("idpost", posts.get(i).getId());
		  
		 
			//Integer idpost= (Integer) session.getAttribute("idpost");
		    //request.setAttribute("idpost",idpost);
		    
		   
		%>
			<div class="post">
				<div class="post-top">
					<div class="dp">
						<img src="./images/girl.jpg" alt="">
					</div>
					<div class="post-info">
						<p class="name"><%out.println(utilisateur.getUsername());%></p>
						
						<span class="time"><%out.println(posts.get(i).getTime_post());%></span>
					</div>
					<i class="fas fa-ellipsis-h"></i>
				</div>

				<div class="post-content">
					<%out.println(posts.get(i).getText());%>
				</div>
			
				<div class="post-bottom">
					<div onclick="like(this);" class="action">
						<i class="fa fa-heart" aria-hidden="true"></i> <span>Like</span>
					</div>
					<div onclick="create_comment();" class="action">
						<i class="far fa-comment"></i> <span>Comment</span>
					</div>
					
					<div class="action">
						<i class="fa fa-share"></i> <span>Share</span>
					</div>
					
					
				</div>
				<div>
					<div>
					
					<p><%
					  for(int j=0;j<cmnts.size();j++){
					    	if(cmnts.get(j).getPost() == posts.get(i).getId()){
					    	System.out.println("j= "+j+" : commnts "+cmnts.get(j).getText());
					out.println(cmnts.get(j).getText()); %>
					</br>
					<% }  } 
					%></p>
					</div>
				
					<form action="./CreateCommentaire" method="post">
					<div>
					<input id="commentaire_text" name="comment" type="text" value="sang">
					
					<input name="idpost" type="submit" value="<%=posts.get(i).getId() %>" hidden>
					<input id="create_comment" type="submit">
					</div>
					</form>
					
					</div>
					
			</div>
		<%	 }  
		  
		  }
%>
		</div>
		<div class="right-panel">
			<div class="pages-section">
				<h4>Your pages</h4>
				<a class='page' href="#">
					<div class="dp">
						<img src="./images/logo.png" alt="">
					</div>
					<p class="name">Cody</p>
				</a> <a class='page' href="#">
					<div class="dp">
						<img src="./images/dp.jpg" alt="">
					</div>
					<p class="name">Cody Tutorials</p>
				</a>
			</div>

			<div class="friends-section">
				<h4>Friends</h4>
				<a class='friend' href="#">
					<div class="dp">
						<img src="./images/dp.jpg" alt="">
					</div>
					<p class="name">Henry Mosely</p>
				</a> <a class='friend' href="#">
					<div class="dp">
						<img src="./images/shoes.jpg" alt="">
					</div>
					<p class="name">George</p>
				</a> <a class="friend" href="#">
					<div class="dp">
						<img src="./images/boy.jpg" alt="">
					</div>
					<p class="name">Aakash Malhotra</p>
				</a> <a class="friend" href="#">
					<div class="dp">
						<img src="./images/model.jpg" alt="">
					</div>
					<p class="name">Ragini Khanna</p>
				</a> <a class="friend" href="#">
					<div class="dp">
						<img src="./images/boy.jpg" alt="">
					</div>
					<p class="name">Justin Bieber</p>
				</a> <a class="friend" href="#">
					<div class="dp">
						<img src="./images/dp.jpg" alt="">
					</div>
					<p class="name">Ramesh GC</p>
				</a> <a class="friend" href="#">
					<div class="dp">
						<img src="./images/model.jpg" alt="">
					</div>
					<p class="name">Sajita Gurung</p>
				</a>

			</div>
		</div>
	</div>
	<script>
	 function sang(){
		 window.location.href='IntermediaireCategorie?nom=sang';
		 
	 }
	 function savoir(){
		 window.location.href='IntermediaireCategorie?nom=savoir';
		 
	 }
	 function autre(){
		 window.location.href='IntermediaireCategorie?nom=autre';
		 
	 }
	 function nourriture(){
		 window.location.href='IntermediaireCategorie?nom=nourriture';
		 
	 }
	 function like(item){
		 //var icon = anchor.querySelector("i");
		  //icon.classList.toggle('far fa-thumbs-up');
		  //icon.classList.toggle('fa-sharp fa-solid fa-heart');
		//  anchor.querySelector("span").textContent = icon.classList.contains('fa-sharp fa-solid fa-heart') ? "Read more" : "Read less";
		// window.alert('assia');
		// var element = document.getElementById("like_post");
		// document.element.style.color='blue';
		 //item.classList.toggle("far fa-comment");
	 }
	 function create_comment(){
		 var input1 = document.getElementById("commentaire_text");
		 var input2 = document.getElementById("create_comment");
		 //var visible = x.querySelector("input");
		 input1.style.visibility='visible';
		 input2.style.visibility='visible';
	 }
	</script>
</body>

</html>