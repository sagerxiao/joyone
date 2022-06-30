package controllers;

import play.Play;
import play.libs.IO;
import play.mvc.Controller;

public class Application extends Controller {
    public static void version() {
        renderJSON(IO.readContentAsString(Play.getFile("config.json")));
    }
}
