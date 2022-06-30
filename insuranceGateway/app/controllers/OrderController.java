package controllers;

import models.BaseDto;
import models.InsuranceOrder;
import models.RequestSource;
import models.ResponseStatus;
import play.Logger;
import play.data.validation.Required;
import play.db.jpa.Transactional;
import services.insuranceGateway.OrderService;
import services.insuranceGateway.common.ApplicationConstrains;
import services.insuranceGateway.common.QueryResult;
import services.insuranceGateway.utils.GsonUtils;
import services.insuranceGateway.utils.ParamUtils;

public class OrderController extends BaseController {

    public static void saveTask(String from, @Required String body) {
        BaseDto resp = new BaseDto();
        try {
            Logger.error("[新网关] 收到%s下发订单: %s", from, body);
            RequestSource requestSource = OrderService.requestSource(from);
            if (requestSource == null) {
                error("Invalid argument " + from);
            }

            OrderService.INSTANCE.saveTask(requestSource, body);
            resp.setStatus(ResponseStatus._200);
            if(requestSource == RequestSource.RENBAO){
            	resp.setData(ApplicationConstrains.RENBAO_RETURN_DATA);
            }
            renderJSON(resp);
        } catch (Exception e) {
            Logger.error(e, "保存订单失败");
            resp.setStatus(ResponseStatus._500);
            renderJSON(resp);
        }
    }

    public static void savePinganTask() {
        BaseDto resp = new BaseDto();
        try {
        	String reqBody = ParamUtils.format(request);
            Logger.error("[新网关] 收到%s下发订单: %s", "pingan", reqBody);
            OrderService.INSTANCE.saveTask(RequestSource.PINGAN, reqBody);
            resp.setStatus(ResponseStatus._200);
            renderJSON(resp);
        } catch (Exception e) {
            Logger.error(e, "保存订单失败");
            resp.setStatus(ResponseStatus._500);
            renderJSON(resp);
        }
    }

    @Transactional(readOnly = true)
    public static void listOrdersBy(InsuranceOrder.ProcessStatus processStatus, RequestSource requestSource, Integer pageNo) {
        QueryResult<InsuranceOrder> result = OrderService.INSTANCE.findOrdersByStatus(requestSource, processStatus, pageNo != null ? pageNo : 1);
        renderJSON(GsonUtils.defaultGson().toJson(result));
    }

}
