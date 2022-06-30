package services.insuranceGateway.event;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import models.InsuranceOrder;
import models.InsuranceOrder.ProcessStatus;
import models.ProcessResp;


public class OrderProcessHandlerImpl extends AbstractEventHandler {
    private static Logger logger = LoggerFactory.getLogger(OrderProcessHandlerImpl.class);

    @Override
    protected boolean isInterest(InsuranceOrder order) {
        return ProcessStatus.QUEUED.equals(order.processStatus) ;
    }

    @Override
    protected ProcessResp doProcess(InsuranceOrder order) {
        logger.info("保险网关订单通知 {}", order.id);
        return OrderProcessService.INSTANCE.sendProcess(order);
    }
}
