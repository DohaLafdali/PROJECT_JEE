<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="MDP.ChatDaoImpl" %>
    <%@ page import="MDP.UtilisateurDaoImpl" %>
    <%@ page import="MDP.Utilisateur" %>
    <%@ page import="MDP.Chat" %>
    <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>La liste des discussions</h4>
	<%
	Integer iduser=(Integer) session.getAttribute("iduser");
	
	  final List<Chat> chats = ChatDaoImpl.getChatOfUser(iduser);
	List<Integer> array_L= new ArrayList<Integer>();
	for(int i=0;i<chats.size();i++){
		out.println(chats.get(i).getContent());
		//out.println(chats.get(i).getFrom_user());
		array_L.add(chats.get(i).getTo_user());
	}
	 Set<Integer> mySet = new HashSet<Integer>(array_L);
	 
	    // Créer une Nouvelle ArrayList à partir de Set
	    List<Integer> array_L2 = new ArrayList<Integer>(mySet);
			System.out.println(array_L2);
	%>
	<div>
		<h3>List of users</h3>
		<ul>
		
		
		<%
		UtilisateurDaoImpl userdao=new UtilisateurDaoImpl();
		for(int j=0;j<array_L2.size();j++){
			Utilisateur user=userdao.getOneO(array_L2.get(j));
			final List<Chat> chats = ChatDaoImpl.getChat(iduser, user.getId());
		%>
			
		<li> <% 
		
		out.println(user.getUsername()); 
		for(int k=0;k<chats.size();k++){
			if(chats.get(k).getTo_user() == user.getId()  && chats.get(k).getFrom_user() == user.getId()){
				out.println(chats.get(k).getContent());
			}
		}
		
		
		%>
		
		
		
		</li>
	
			<%	}
		
		%>
		
		
		</ul>
	</div>
</body>
</html>