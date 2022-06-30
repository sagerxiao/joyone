package services.insuranceGateway.jobs;

import models.InsuranceOrder;
import play.Logger;
import play.db.jpa.Transactional;
import play.jobs.Job;
import play.jobs.OnApplicationStart;
import services.insuranceGateway.OrderService;
import services.insuranceGateway.utils.ServerUtils;

import java.util.List;
import java.util.concurrent.ForkJoinPool;

/**
 * The job used to process some orders per business requirements.
 */
@OnApplicationStart(async = true)
@Transactional(readOnly = true)
public class ProcessOrderJob extends Job {

    @Override
    public void doJob() throws Exception {
        Boolean validateFlag = ServerUtils.validateIntranetIp();
        if (!validateFlag) {
            Logger.info("This server is not allowed to execute this ProcessOrderJob.");
            return;
        }

        try {
            Logger.info("ProcessOrderJob begin ....");
            Long start = System.currentTimeMillis();
            OrderService orderService = OrderService.INSTANCE;
            List<InsuranceOrder> orders = orderService.fetchUnprocessOrders();
            if (orders == null || orders.size() == 0) {
                return;
            }

            new RecursiveOrderProcessor(orders).invoke();
            Logger.info("ProcessOrderJob done! time consumed: %s", (System.currentTimeMillis() - start));
        } finally {
            in("2s");
        }
    }
}
