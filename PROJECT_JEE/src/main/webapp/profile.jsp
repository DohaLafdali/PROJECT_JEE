<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile page</title>
<style type="text/css">



</style>
</head>
<body>
<div>
	<img alt="assia" src="">
	
	<h3><% 
	Integer id=Integer.parseInt(request.getParameter("id"));
	
	if(id == session.getAttribute("iduser")){
	UtilisateurDaoImpl userdao=new UtilisateurDaoImpl();
	PostDaoImpl Postdao=new PostDaoImpl();
	  List<Post> posts = Postdao.getPostsUser(id);
	  %>
	  <!-- Had bouton Update fash tcliquer aalih khass ytale3 lik l formulaire  --> 
	  <button>Update</button>
	  <form id="updateform" action="./updateProfile" method="post">
	  <button type="submit" >Edit</button>
	  <input name="username"  type="text" value="<%= userdao.getOneO(id).getUsername() %>"></br>
	  <input name="email" type="text" value="<%= userdao.getOneO(id).getEmail() %>"></br>
	  <input name="password" type="text" value="<%= userdao.getOneO(id).getPassword() %>"></br>
	  <input name="profile" type="text" value="<%= userdao.getOneO(id).getImage_profil() %>"></br>
	  <input name="id" value="<%=id%>" hidden>
	  
	  </form>
	  <%
	  for(int i=0;i<posts.size();i++){
		  //hna kayn text dyal les post 
		  out.println("post : "+i+": "+posts.get(i).getText());
		 //Hna kaygolina achmn category l post 
		  if(posts.get(i).getId_categorie() == 1){
			 out.println("categorie: Sang");
		  }else if(posts.get(i).getId_categorie() == 2){
			  out.println("categorie: Autre");
		  }
		  else if(posts.get(i).getId_categorie() == 3){
			  out.println("categorie: nourriture");
		  }
		  else if(posts.get(i).getId_categorie() == 4){
			  out.println("categorie: savoir");
		  }
	  }
		Utilisateur user=userdao.getOneO(id);
		//hna kay afficher lina smiyt l user
		out.println(user.getUsername());
	}
	else{
		out.println(session.getAttribute("iduser")); %>
	 <button>Message</button> 
		<% 
	}
	%> </h3>
</div>
<script>
	function update(id){
	    
		document.location.href='updateProfile?id='+id;
	}
	

</script>
</body>
</html>