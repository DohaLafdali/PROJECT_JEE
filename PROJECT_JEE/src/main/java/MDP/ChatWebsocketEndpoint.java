package MDP;




import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.json.JSONObject;
import org.json.simple.parser.JSONParser;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.EncodeException;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;


@ServerEndpoint(value = "/chat", decoders = MessageModelDecoder.class, encoders = MessageModelEncoder.class)
public class ChatWebsocketEndpoint {
    
    private static Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());
    public static List<Integer> id_from=new ArrayList<>();
    public static Integer id;

    @OnMessage
    public String onMessage(Session session, Chat message) {
        System.out.println( message);
       
        ChatDaoImpl chatdao=new ChatDaoImpl();
        //id_from= 
        PrintWriter out = new PrintWriter(System.out);    
        out.println("<meta http-equiv='refresh' content='3;URL=template.jsp'>"); 
        id_from.add(message.getFrom_user());
        id=message.getTo_user();
        chatdao.add(message);
        for(Session s: sessions) {
            try {
                s.getBasicRemote().sendObject(message);
            } catch (IOException ex) {
                Logger.getLogger(ChatWebsocketEndpoint.class.getName()).log(Level.SEVERE, null, ex);
            } catch (EncodeException ex) {
                Logger.getLogger(ChatWebsocketEndpoint.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
    
    @OnOpen
    public void onOpen(Session session) {
        System.out.println("On open: " + session.getId());
        sessions.add(session);
        
    }
    
    @OnClose
    public void onClose(Session session) {
        System.out.println("On close: " + session.getId());
        sessions.remove(session);
    }
    
}
