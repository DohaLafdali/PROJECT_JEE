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
<link rel="stylesheet" href="profile.css">
<title>Aatae</title>
</head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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


	<div class="container"  >
	<div class="top-profile">
    <div class="pro">   
    
    hello
     <div class="pro-img">
      <img src="./images/user.png" alt="Logo">
      <h1>doha lafdali</h1>
      <p>BIO</p>
      <p> je suis doha lafdali </p>
      <p>2001/04/08</p>
     </div>
    </div>
    <div class="test">
    
        <div class="middle-panel">
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
                    Roses are red <br>
                    Violets are blue <br>
                    I'm ugly & you are too😏
                </div>
                
                <div class="post-bottom">
                    <div class="action">
                        <i class="far fa-thumbs-up"></i>
                        <span>Like</span>
                    </div>
                    <div class="action">
                        <i class="far fa-comment"></i>
                        <span>Comment</span>
                    </div>
                    <div class="action">
                        <i class="fa fa-share"></i>
                        <span>Share</span>
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
                    Mountains are so cool
                    <img src="images/mountains.jpg" />
                </div>
                
                <div class="post-bottom">
                    <div class="action">
                        <i class="far fa-thumbs-up"></i>
                        <span>Like</span>
                    </div>
                    <div class="action">
                        <i class="far fa-comment"></i>
                        <span>Comment</span>
                    </div>
                    <div class="action">
                        <i class="fa fa-share"></i>
                        <span>Share</span>
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
                    Happy birthday dear
                    <img src="./images/girl_with_light.jpg" alt="Mountains">
                </div>
                <div class="post-bottom">
                    <div class="action">
                        <i class="far fa-thumbs-up"></i>
                        <span>Like</span>
                    </div>
                    <div class="action">
                        <i class="far fa-comment"></i>
                        <span>Comment</span>
                    </div>
                    <div class="action">
                        <i class="fa fa-share"></i>
                        <span>Share</span>
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
                    Hey, everybody! My new shoes are here
                    <img src="./images/shoes.jpg" alt="Shoes">
                </div>
                <div class="post-bottom">
                    <div class="action">
                        <i class="far fa-thumbs-up"></i>
                        <span>Like</span>
                    </div>
                    <div class="action">
                        <i class="far fa-comment"></i>
                        <span>Comment</span>
                    </div>
                    <div class="action">
                        <i class="fa fa-share"></i>
                        <span>Share</span>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    
    
	</div>
	
	</div>


</body>
</html>