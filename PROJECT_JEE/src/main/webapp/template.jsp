<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
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
<title>Aatae</title>
</head>

<body>
	<nav>
		<div class="nav-left">
			<img src="./images/logo.png" alt="Logo">
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


	<div class="container"  id="blur">
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

				<div  class="story">
					<img src="./images/sang.jpg" alt="sang" id="img0" class="image">
				</div>
							
				
      
				<div  class="story">
					<img src="./images/savoir.jpg" alt="savoir" id="img1" class="image"> 			
				</div>

				<div  class="story">
					<img src="./images/nouriture.jpg" alt="nouriture" id="img2" class="image">
				</div>

				<div  class="story">
					<img src="./images/autree.jpg" alt="autre" id="img3" class="image"> 
				</div>
			</div>
			
            <!-- create new post -->
            
			<div class="post create">
				<div class="post-top">
					<div class="dp">
						<img src="./images/girl.jpg" alt="">
					</div>

					<form action="./CreatePost" method="post">
					<input type="text" name="post" placeholder="What's on your mind, Aashish ?" id="post"/>
					<input type="submit" value="publier" id="public_post">
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
			UtilisateurDaoImpl user=new UtilisateurDaoImpl();
			System.out.println("red "+cmnts);
			int idp;
			int cmp=0;
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
					<i class="fas fa-ellipsis-h"></i>
				</div>

				<div class="post-content">
					<%out.println(posts.get(i).getText());%><br>
					<!-- test popUP -->
				<a href="#" onclick="toggle(<%=i%>)"><%out.print(like.nombreLikes(posts.get(i).getId())); %></a>
						
					<!-- test popUP -->
				</div>
			
				<div class="post-bottom">
					<div onclick="like(this);" class="action">
						
					<%int help = posts.get(i).getId();%>
					
					    <form action="./CreateLike" method="post">
						<!-- <input type="submit" value="n"> -->
						<!-- <i class="fa fa-heart" aria-hidden="true"></i> -->
						<span onclick="getIdPost(<%=help%>);">
						<button type="submit" value="n"><i class="fa fa-heart" aria-hidden="true"></i></button>Like</span>
						
						<input type="text" name="help" value="<%=posts.get(i).getId()%>" hidden>
						</form>
						 <a href="CreateLike?help=<%=help %>"></a>
						<% System.out.println("Id post ============>"+help); %>
						
						
					</div>
					<div onclick="togg(<%= i %>);" class="action" >
						<i class="far fa-comment"></i> <span>Comment</span>
					</div>
					
					<div class="action">
						<i class="fa fa-share"></i> <span>Share</span>
					</div>
					
					
					<div id=<%= i %> class="popup">
                    <p><%
					    for(int j=0;j<likes.size();j++){
					    	if(likes.get(j).getPost() == posts.get(i).getId()){
					    		 idp=posts.get(i).getId();
					              out.println(like.getUsers(posts.get(i).getId(),likes.get(j).getUser()));
					               
					               %>
					</br>
					<% }} 
					%></p>
        
        <a href="#" onclick="toggle(<%=i%>)">Close</a>
    </div>
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
					<h5><%out.println(commentaireDaoImpl.getUsers(posts.get(i).getId(),cmnts.get(j).getUser())); %></h5><br>
					<p>
					<% 
				
					out.println(cmnts.get(j).getText()); %>
					<img alt="profile" src="./images/logo.png" width="20px" height="20px" onclick="profile();">
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
	function profile(){
		document.location.href='Profile';
		
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


function toggle(i) {
    var blur=document.getElementById('blur');
    blur.classList.toggle('active');
    var popup = document.getElementById(i);
    popup.classList.toggle('active');
}
</script>
</body>

</html>