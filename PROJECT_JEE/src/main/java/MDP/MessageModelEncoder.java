
package MDP;

import com.google.gson.Gson;



import jakarta.websocket.EncodeException;
import jakarta.websocket.Encoder;
import jakarta.websocket.EndpointConfig;


public class MessageModelEncoder implements Encoder.Text<Chat>{
    
    Gson gson = new Gson();

    @Override
    public String encode(Chat message) throws EncodeException {
    	System.out.println( gson.toJson(message));
        return gson.toJson(message);
    }

    @Override
    public void init(EndpointConfig config) {
        }

    @Override
    public void destroy() {
        }
    
}
