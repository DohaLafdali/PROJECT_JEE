
package Controller;

import com.google.gson.Gson;

import Models.Chat;
import jakarta.websocket.EncodeException;
import jakarta.websocket.Encoder;
import jakarta.websocket.EndpointConfig;


public class MessageModelEncoder implements Encoder.Text<Chat>{
    
    Gson gson = new Gson();

    @Override
    public String encode(Chat message) throws EncodeException {
        return gson.toJson(message);
    }

    @Override
    public void init(EndpointConfig config) {
        }

    @Override
    public void destroy() {
        }
    
}
