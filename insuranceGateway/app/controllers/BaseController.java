package controllers;

import com.google.gson.JsonObject;
import play.Logger;
import play.mvc.Catch;
import play.mvc.Controller;
import play.mvc.With;
import services.insuranceGateway.filters.XDRSettings;

@With(XDRSettings.class)
public class BaseController extends Controller {

    @Catch(value = {Exception.class}, priority = 1)
    public static void logThrowable(Exception throwable) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Headers", "X-Requested-With, Cache-Control, agency-id");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        Logger.error(throwable, "EXCEPTION %s", throwable);
        JsonObject js = new JsonObject();
        js.addProperty("error", throwable.getMessage());
        renderJSON(js);
    }
}
