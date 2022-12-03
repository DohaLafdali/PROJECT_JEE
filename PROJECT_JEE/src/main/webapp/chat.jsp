<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="MDP.UtilisateurDaoImpl" %> 
     <%@ page import="MDP.Chat" %> 
     <%@ page import="MDP.ChatDaoImpl" %> 
     <%@ page import="org.json.JSONObject" %>
     <%@ page import="org.json.simple.parser.JSONParser" %>
 <%@page import="java.util.List"%>
     
<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Chat application</h1>
       		 <%! 
 public static Integer getIdTo(int id) {
    	
    	return id;
    }
   // System.out.println("id-from: "+id_from);
 //   session.setAttribute("id_from",id_from); 
   
    %>
        <%
        
        Integer id_to=Integer.parseInt(request.getParameter("id"));
        Integer id_from=(Integer) session.getAttribute("iduser");
        UtilisateurDaoImpl userdao=new UtilisateurDaoImpl();
        out.println(userdao.getOneO(id_to).getUsername());
        out.println(userdao.getOneO(id_from).getUsername());
        
        
        %>
        <h4>TO: <%out.println(userdao.getOneO(id_to).getUsername()); %></h4>
        
        <div id="output">
        <% 
         ChatDaoImpl chatdao = new ChatDaoImpl();
        final List<Chat> chats =  ChatDaoImpl.getChat(id_from ,id_to);
		for(int i=0;i<chats.size();i++){
			//System.out.println(chats.get(i).getContent());
			out.println(chats.get(i).getContent());
			 
		 out.println(userdao.getOneO(chats.get(i).getFrom_user()).getUsername());
		%>	<br><%
		}
		
			%>

		<input type="text" name="id_from" value=<%=id_from %> >
        </div>
        <input id="message_input" name="content" type="text">
        <button onclick="send()">Send message</button>
            
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