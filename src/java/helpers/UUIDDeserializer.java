package helpers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import java.lang.reflect.Type;
import java.util.UUID;

public class UUIDDeserializer implements JsonDeserializer<UUID> {

    @Override
    public UUID deserialize(JsonElement je, Type type, JsonDeserializationContext jdc) throws JsonParseException {
        try {
            return UUID.fromString(je.getAsString());
        } catch (Exception e) {
            return null;
        }
    }
    
    public static void main(String[] args) {
        Gson g = new GsonBuilder().registerTypeAdapter(UUID.class, new UUIDDeserializer()).create();
        System.out.println(g.fromJson("\"40743047-77b6-4e2c-af53-0487cb818be1\"", UUID.class));
    }
    
}
