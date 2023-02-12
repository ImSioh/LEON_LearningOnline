package helpers;

import com.google.gson.annotations.Expose;

public class JsonWrapper<T> {

    @Expose
    public String type;
    @Expose
    public T data;

    public JsonWrapper(String type, T data) {
        this.type = type;
        this.data = data;
    }
}
