package services.insuranceGateway.utils;

import java.io.IOException;

import org.apache.commons.io.IOUtils;

import com.google.gson.Gson;

import play.Logger;
import play.mvc.Http;

public class ParamUtils {

	
	public static Object format(Http.Request request, Class c) {
		String reqBody = null;
		try {
			reqBody = IOUtils.toString(request.body, "utf-8");
		} catch (IOException e) {
			Logger.error(e, "解析平安道路救援下单请求体异常");
			return null;
		}
		return new Gson().fromJson(reqBody, c);
	}
	
	public static String format(Http.Request request) {
		String reqBody = null;
		try {
			reqBody = IOUtils.toString(request.body, "utf-8");
		} catch (IOException e) {
			Logger.error(e, "解析平安道路救援下单请求体异常");
			return null;
		}
		return reqBody;
	}
}
