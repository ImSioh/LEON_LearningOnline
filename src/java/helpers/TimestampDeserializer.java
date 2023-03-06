package helpers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class TimestampDeserializer implements JsonDeserializer<Timestamp> {

    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

    @Override
    public Timestamp deserialize(JsonElement je, Type type, JsonDeserializationContext jdc) throws JsonParseException {
        try {
            return Timestamp.from(sdf.parse(je.getAsString()).toInstant());
        } catch (Exception e) {
            return null;
        }
    }

    public static void main(String[] args) {
        Gson g = new GsonBuilder().registerTypeAdapter(Timestamp.class, new TimestampDeserializer()).create();
        System.out.println(g.fromJson("\"2023-03-18T03:28\"", Timestamp.class));
    }

}
