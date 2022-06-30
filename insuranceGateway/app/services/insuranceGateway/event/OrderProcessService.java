package services.insuranceGateway.event;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import models.*;
import play.Logger;
import play.Play;
import play.libs.WS;
import play.libs.WS.HttpResponse;
import services.insuranceGateway.utils.GsonUtils;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

public class OrderProcessService {

    public static final OrderProcessService INSTANCE = new OrderProcessService();
    private static final String PROCESS_URL = Play.configuration.getProperty("cws.cluster.addr");

    /**
     * 发送订单结算通知
     *
     * @param notify
     * @return
     */
    public ProcessResp sendProcess(InsuranceOrder order) {
        if (order.requestSource == null) {
            ProcessResp dto = new ProcessResp();
            dto.result_code = ResponseStatus._500.getCode();
            dto.result_msg = ResponseStatus._500.getDesc();
            return dto;
        }

        String api = null;
        if (order.requestSource == RequestSource.PINGAN) {
            api = "/api/pingan/requests";
        } else {
            api = "/outer/" + order.requestSource.name().toLowerCase() + "/request";
        }
        String url = this.PROCESS_URL + api;
        JsonObject obj = null;
        try {
            obj = GsonUtils.parse(order.json);
        } catch (Exception e) {
            Logger.error(e, "请求cws接口转换请求参数出错", e);

            ProcessResp dto = new ProcessResp();
            dto.result_code = ResponseStatus._2001.getCode();
            return dto;
        }
        return post(obj, url, order.requestSource);
    }

    private ProcessResp post(JsonObject reqJson, String requesturl, RequestSource requestSource) {
        try {
            HttpResponse resp = WS.url(requesturl).setHeader("Content-Type", "application/json;charset=utf-8")
                    .setHeader("Accept", "application/json;charset=utf-8").body(reqJson).timeout("20s").post();

            Logger.error("保险订单请求cws处理接口，请求url：%s，请求参数：%s", requesturl, reqJson);
            Logger.info("保险订单请求cws处理接口返回" + resp.success());
            if (resp.success()) {
                Logger.error("保险订单请求cws处理接口，返回值：%s", resp.getString());
                if (requestSource.PINGAN == requestSource) {
                    return pinganResp(resp.getString());
                } else {
                    return outerResp(resp.getString());
                }
            } else {
                Logger.error("保险订单请求cws处理接口异常");
                return null;
            }
        } catch (Exception e) {
            Logger.error(e, "保险订单请求cws处理接口异常,", e);
            return null;
        }
    }

    private ProcessResp pinganResp(String resp) {
        PingAnRescueResp result = new Gson().fromJson(resp, PingAnRescueResp.class);
        ProcessResp dto = new ProcessResp();
        if(StringUtils.isNotBlank(result.code)){
        	dto.result_code = Long.parseLong(result.code);
        }
        dto.result_msg = result.msg;
        return dto;
    }

    private ProcessResp outerResp(String resp) {
        BaseDto result = new Gson().fromJson(resp, BaseDto.class);
        ProcessResp dto = new ProcessResp();
        dto.result_code = result.getCode();
        dto.result_msg = result.getDesc();
        return dto;
    }
}
