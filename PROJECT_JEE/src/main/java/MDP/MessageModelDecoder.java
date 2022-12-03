package MDP;


import com.google.gson.Gson;


import jakarta.websocket.DecodeException;
import jakarta.websocket.Decoder;
import jakarta.websocket.EndpointConfig;

public class MessageModelDecoder implements Decoder.Text<Chat> {
    
    Gson gson = new Gson();

    @Override
    public Chat decode(String s) throws DecodeException {
    	System.out.println("decode: "+gson.fromJson(s, Chat.class));
    	System.out.println(Chat.class);
        return gson.fromJson(s, Chat.class);
    }

    @Override
    public boolean willDecode(String s) {
        return s != null;
    }

    @Override
    public void init(EndpointConfig config) {
    }

    @Override
    public void destroy() {
    }

 /*   else {
 	   out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");//redirects after 3 seconds
 	   out.println("<p style='color:red;'>User or password incorrect!</p>");
 	}  */
}
