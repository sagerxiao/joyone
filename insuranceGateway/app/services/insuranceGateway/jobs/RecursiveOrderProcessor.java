package services.insuranceGateway.jobs;

import models.InsuranceOrder;
import play.Play;
import services.insuranceGateway.event.OrderProcessHandlerImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.RecursiveAction;

public class RecursiveOrderProcessor extends RecursiveAction {
    private static int THRESHOLD = Integer.parseInt(Play.configuration.getProperty("req.orders.threshold", "2"));

    private List<InsuranceOrder> orders = new ArrayList<InsuranceOrder>();
    private OrderProcessHandlerImpl handler = new OrderProcessHandlerImpl();

    public RecursiveOrderProcessor(List<InsuranceOrder> orders) {
        this.orders.addAll(orders);
    }

    @Override
    protected void compute() {
        if (orders.size() <= THRESHOLD) {
            processOrders(orders);
            return;
        }

        List<InsuranceOrder> orders1 = new ArrayList<InsuranceOrder>();
        for (int i = 0; i < THRESHOLD; i++) {
            orders1.add(orders.get(i));
        }

        List<InsuranceOrder> orders2 = new ArrayList<InsuranceOrder>(orders);
        orders2.removeAll(orders1);

        RecursiveOrderProcessor processor = new RecursiveOrderProcessor(orders2);
        processor.fork();

        processOrders(orders1);
        processor.join();
    }

    private void processOrders(List<InsuranceOrder> orders) {
        for (InsuranceOrder order : orders) {
            handler.process(order);
        }
    }
}
