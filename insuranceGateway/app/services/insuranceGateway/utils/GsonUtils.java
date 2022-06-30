package services.insuranceGateway.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.internal.bind.DateTypeAdapter;

import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

public class GsonUtils {

    private static Gson pureGson;
    private static Gson gson;
    static JsonParser jsonParser = new JsonParser();

    public static JsonObject parse(InputStream i) throws IOException {
        return jsonParser.parse(IOUtils.toString(i, "utf-8")).getAsJsonObject();
    }

    public static JsonObject parse(String i) throws IOException {
        return jsonParser.parse(i).getAsJsonObject();
    }

    public static Gson pureGson() {
        if (pureGson == null) {
            pureGson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
                    .create();
        }
        return pureGson;
    }

    public static Gson defaultGson() {
        if (gson == null) {
            gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").serializeNulls()
                    .registerTypeAdapter(Date.class, new DateTypeAdapter())
                    .excludeFieldsWithoutExposeAnnotation().create();
        }

        return gson;
    }


    public static Gson pureGsonWithNull() {
        if (pureGson == null) {
            pureGson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
                    .serializeNulls()
                    .create();
        }
        return pureGson;
    }

}
