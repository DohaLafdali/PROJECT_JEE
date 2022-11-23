<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
				<div class="story" checked>
			    
				<img src="./images/sang.jpg" alt="sang" id="img0" class="image">
				</div>
				<div class="story">
				<img src="./images/savoir.jpg" alt="savoir" id="img1" class="image"> 
				</div>

				<div class="story">
				<img src="./images/nouriture.jpg" alt="nouriture" id="img2" class="image">
				</div>

				<div class="story">
				<img src="./images/autree.jpg" alt="autre" id="img3" class="image"> 
				</div>
			</div>

			<div class="post create">
				<div class="post-top">
					<div class="dp">
						<img src="./images/girl.jpg" alt="">
					</div>
					<input type="text" placeholder="What's on your mind, Aashish ?" />
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

			<div class="post">
				<div class="post-top">
					<div class="dp">
						<img src="./images/girl.jpg" alt="">
					</div>
					<div class="post-info">
						<p class="name">Anuska Sharma</p>
						<span class="time">12 hrs ago</span>
					</div>
					<i class="fas fa-ellipsis-h"></i>
				</div>

				<div class="post-content">
					Roses are red <br> Violets are blue <br> I'm ugly & you
					are too√∞¬ü¬ò¬è
				</div>

				<div class="post-bottom">
					<div class="action">
						<i class="far fa-heart"  id="l1"></i> <span class="like" id="like1">Like</span>
					</div>
					<div class="action">
						<i class="far fa-comment" ></i> <span>Comment</span>
					</div>
					<div class="action">
						<i class="fa fa-share"></i> <span>Share</span>
					</div>
				</div>
			</div>

			<div class="post">
				<div class="post-top">
					<div class="dp">
						<img src="./images/dp.jpg" alt="">
					</div>
					<div class="post-info">
						<p class="name">Ramesh GC</p>
						<span class="time">2 days ago</span>
					</div>
					<i class="fas fa-ellipsis-h"></i>
				</div>

				<div class="post-content">
					Mountains are so cool <img src="images/mountains.jpg" />
				</div>

				<div class="post-bottom">
					<div class="action">
						<i class="far fa-heart" id="l2"></i> <span class="like" id="like2">Like</span>
					</div>
					<div class="action">
						<i class="far fa-comment"></i> <span>Comment</span>
					</div>
					<div class="action">
						<i class="fa fa-share"></i> <span>Share</span>
					</div>
				</div>
			</div>

			<div class="post">
				<div class="post-top">
					<div class="dp">
						<img src="./images/boy.jpg" alt="">
					</div>
					<div class="post-info">
						<p class="name">Priyank Saksena</p>
						<span class="time">1 week ago</span>
					</div>
					<i class="fas fa-ellipsis-h"></i>
				</div>
				<div class="post-content">
					Happy birthday dear <img src="./images/girl_with_light.jpg"
						alt="Mountains">
				</div>
				<div class="post-bottom">
					<div class="action">
						<i class="far fa-thumbs-up"></i> <span>Like</span>
					</div>
					<div class="action">
						<i class="far fa-comment"></i> <span>Comment</span>
					</div>
					<div class="action">
						<i class="fa fa-share"></i> <span>Share</span>
					</div>
				</div>
			</div>

			<div class="post">
				<div class="post-top">
					<div class="dp">
						<img src="./images/model.jpg" alt="">
					</div>
					<div class="post-info">
						<p class="name">Pragati Adhikari</p>
						<span class="time">5 mins ago</span>
					</div>
					<i class="fas fa-ellipsis-h"></i>
				</div>
				<div class="post-content">
					Hey, everybody! My new shoes are here <img src="./images/shoes.jpg"
						alt="Shoes">
				</div>
				<div class="post-bottom">
					<div class="action">
						<i class="far fa-thumbs-up"></i> <span>Like</span>
					</div>
					<div class="action">
						<i class="far fa-comment"></i> <span>Comment</span>
					</div>
					<div class="action">
						<i class="fa fa-share"></i> <span>Share</span>
					</div>
				</div>
			</div>

		</div>

	</div>
	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', () => {
		†††††
		†††††
		††††const images = document.querySelectorAll('.image');
		†††††
		††††images.forEach(image => (
		††††††††image.addEventListener('click', function(event) {
		†††††††††
		††††††††††††const clickedImage = this;
		†††††††††††††
		††††††††††††console.log(this.id);
		const elt1=document.getElementById("img0").style.border="none";
		const elt2=document.getElementById("img1").style.border="none";
		const elt3=document.getElementById("img2").style.border="none";
		const elt4=document.getElementById("img3").style.border="none";

		††††††††††††switch (this.id) {
		  case "img0":
			  this.style.border = "5px solid #8AABBE";
			    break;
			  case "img1":
				  this.style.border = "5px solid #8AABBE";
			    break;
			  case "img2":
				  this.style.border = "5px solid #8AABBE";
			    break;
			  case "img3":
				  this.style.border = "5px solid #8AABBE";

				    break;
			  
			}
		††††††††})
		††††))
		});
	
</script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', () => {
	†††††
	†††††
	††††const likes = document.querySelectorAll('.like');
	†††††
	††††likes.forEach(like => (
	††††††††like.addEventListener('click', function(event) {
	†††††††††
	††††††††††††const clickedlike = this;
	††††††††††††console.log(this.id);

	†switch (this.id) {
	  case "like1":
		  document.getElementById("l1").style.color = "red";
		    break;
		  case "like2":
			  document.getElementById("l2").style.color = "red";
	}
	††††††††})
	††††))
	});

</script>
</body>

</html>