package Controller;


import com.google.gson.Gson;

import Models.Chat;
import jakarta.websocket.DecodeException;
import jakarta.websocket.Decoder;
import jakarta.websocket.EndpointConfig;

public class MessageModelDecoder implements Decoder.Text<Chat> {
    
    Gson gson = new Gson();

    @Override
    public Chat decode(String s) throws DecodeException {
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

}
