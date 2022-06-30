/*
 *  Copyright © 2017 CheYouYuan. All rights reserved.
 */
package services.insuranceGateway.filters;

import play.mvc.After;
import play.mvc.Controller;

/**
 * @author Frank L.
 */
public class XDRSettings extends Controller {
    @After
    public static void after() {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Headers", "X-Requested-With, Cache-Control, agency-id");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
    }

}
