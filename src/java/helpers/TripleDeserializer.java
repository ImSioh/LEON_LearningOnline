package helpers;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import org.apache.commons.lang3.tuple.Triple;

public class TripleDeserializer<F, S, T> implements JsonDeserializer<Triple<F, S, T>> {
    @Override
    public Triple<F, S, T> deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
        JsonObject jsonObject = json.getAsJsonObject();
        F first = context.deserialize(jsonObject.get("first"), getTypeArgument(typeOfT, 0));
        S second = context.deserialize(jsonObject.get("second"), getTypeArgument(typeOfT, 1));
        T third = context.deserialize(jsonObject.get("third"), getTypeArgument(typeOfT, 2));
        return Triple.of(first, second, third);
    }

    private Type getTypeArgument(Type type, int index) {
        Type[] typeArguments = ((ParameterizedType) type).getActualTypeArguments();
        return typeArguments[index];
    }
}
