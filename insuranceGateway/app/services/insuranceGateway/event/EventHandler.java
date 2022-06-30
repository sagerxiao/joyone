package services.insuranceGateway.event;

import models.InsuranceOrder;

public interface EventHandler {
	 void process(InsuranceOrder notify);
}
