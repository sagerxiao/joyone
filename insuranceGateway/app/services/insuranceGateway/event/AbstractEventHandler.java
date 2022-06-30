package services.insuranceGateway.event;

import models.InsuranceOrder;
import models.InsuranceOrder.ProcessStatus;
import models.ProcessResp;
import models.ResponseStatus;
import play.Logger;
import play.db.jpa.JPA;
import services.insuranceGateway.OrderService;

public abstract class AbstractEventHandler implements EventHandler {

    @Override
    public void process(final InsuranceOrder order) {
        try {
            if (!isInterest(order)) {
                return;
            }

            ProcessResp resp = doProcess(order);

            JPA.startTx(JPA.DEFAULT, false);
            //清求成功更新状态
            if (resp == null) {
                Logger.error("No expected response from order #%s", order.id);
            }
            if (resp.result_code != null && ResponseStatus._200.getCode().intValue() == resp.result_code.intValue()) {
                OrderService.INSTANCE.updateOrderStatus(order.id, ProcessStatus.PROCESSED);
            } else if (resp.result_code != null && ResponseStatus._2001.getCode().intValue() == resp.result_code.intValue()) {
                OrderService.INSTANCE.updateOrderStatus(order.id, ProcessStatus.PARSE_ERROR);
            } else {
                OrderService.INSTANCE.updateOrderStatus(order.id, ProcessStatus.RESPONSE_ERROR);
            }

        } catch (Throwable e) {
            Logger.error(e, "Fail to process handler, orderId: %s, json: %s", order.id, order.json);
        } finally {
            JPA.closeTx(JPA.DEFAULT);
        }
    }

    protected Boolean readOnlyTransaction() {
        return false;
    }

    protected abstract boolean isInterest(InsuranceOrder order);

    protected abstract ProcessResp doProcess(InsuranceOrder order);
}
