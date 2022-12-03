<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="MDP.UtilisateurDaoImpl" %> 
     <%@ page import="MDP.Chat" %> 
     <%@ page import="MDP.ChatDaoImpl" %> 
     <%@ page import="org.json.JSONObject" %>
     <%@ page import="org.json.simple.parser.JSONParser" %>
 <%@page import="java.util.List"%>
 
<%@ page import="java.text.SimpleDateFormat" %>
     
<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="chat.css">
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
		<div class="nav-right">
			<span class="profile"></span> <a href="#"> <i class="fa fa-bell"></i>
			</a> 
			<a href="Login?logout=true"><i class="fa fa-sign-out-alt"></i>
			</a>
		</div>
	</nav>
        

        <%
        
        Integer id_to=Integer.parseInt(request.getParameter("id"));
        Integer id_from=(Integer) session.getAttribute("iduser");
        UtilisateurDaoImpl userdao=new UtilisateurDaoImpl();
        
        
        %>
       
        
        
        <div class="container"  id="blur">
		<div class="left-panel">
        <div id="container">
	<aside>
		<blockquote class="sidekick">
 The measure of a life, after all, is not its duration, but its donation.
  </blockquote> 
	</aside>
	<main>
		<header>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_01.jpg" alt="">
			<div>
				<h2>TO: <%out.println(userdao.getOneO(id_to).getUsername()); %></h2>
				<h3><%out.println(userdao.getOneO(id_to).getEmail()); %></h3>
			</div>
		</header>
		<ul id="chat">
		<div id="output">
        <% 
         ChatDaoImpl chatdao = new ChatDaoImpl();
        final List<Chat> chats =  ChatDaoImpl.getChat(id_from ,id_to);
		for(int i=0;i<chats.size();i++){
			//System.out.println(chats.get(i).getContent());
			if(chats.get(i).getTo_user() ==  id_to){%>
			<li class="you">
				<div class="entete">
					<span class="status green"></span>
					<h2><%out.println(userdao.getOneO(chats.get(i).getFrom_user()).getUsername()); %></h2>
					<h3><% String day = (new SimpleDateFormat("EEEE")).format(chats.get(i).getTime_msg().getTime()); // "Tuesday"

					out.println(day+","+chats.get(i).getTime_msg().getHours()+":"+chats.get(i).getTime_msg().getMinutes());
					%>
					</h3>
				</div>
				<div class="triangle"></div>
				<div class="message">
              <% 
				
				out.println(chats.get(i).getContent());
				
			
			
		%>		
				
		</div>
		</li>
		
		
						<% }else{ %>
			<li class="me">
				<div class="entete">
					<h3><% 
					String day = (new SimpleDateFormat("EEEE")).format(chats.get(i).getTime_msg().getTime()); // "Tuesday"

					out.println(day+","+chats.get(i).getTime_msg().getHours()+":"+chats.get(i).getTime_msg().getMinutes());
					
					%></h3>
					
					<h2><% out.println(userdao.getOneO(chats.get(i).getFrom_user()).getUsername());%></h2>
					<span class="status blue"></span>
				</div>
				<div class="triangle"></div>
				<div class="message">
				<% 
					out.println(chats.get(i).getContent());
				 %>
				</div>
			</li>
			<%
						}
		}
		
			%>

		

        </div>	
		</ul>
		<footer>
			<input id="message_input" name="content" type="text">
        <button onclick="send()"><i class="fa fa-light fa-location-arrow"></i></button>
		</footer>
	</main>
</div>
        

        </div>
        
        </div>
        
        
        
        
        
        
        
        
        
        
            
    </body>
    
    <script type="text/javascript">
    var wsURI = "ws://" + document.location.host + document.location.pathname + "/chat";
    var wsURI="ws://localhost:8080/PROJECT_JEE/chat";
    console.log(wsURI);
    var websocket = new WebSocket(wsURI);

    websocket.onmessage = function(evnt) {
        onMessage(evnt);
    };

    websocket.onopen = function()  {
        onOpen();
    };

    function onOpen() {
        console.log("Opened connection: " + wsURI);
    }

    function onClose() {
        console.log("Closed connection: " + wsURI);
    }

    function onMessage(event) {
        console.log(event); 
      
        location.reload();
        //display(event.data);
    }

    function display(dataString) {
        var data = JSON.parse(dataString);
        //document.getElementById("output").reload(true);
        var contentMessage = "<p> :" + data.content + "</p>"; 
        document.getElementById("output").innerHTML += contentMessage;
        //document.getElementById("output").reload(true);
       // location.reload();
   
    }
    function send() {
    	
    	
        var message = document.getElementById("message_input").value;
        
    //    var username = document.getElementById("username_input").value;
        var json = {
            "content": message,
            "from_user": <%=id_from%>,
            "to_user": <%=id_to%>,
            "time_msg": null
           
        };
       
       // console.log(json);
    //   document.getElementById("notify").reload(true);
       location.reload();
        websocket.send(JSON.stringify(json));
    }
   
    
    </script>
</html>