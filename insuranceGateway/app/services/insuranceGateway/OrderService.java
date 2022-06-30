package services.insuranceGateway;

import models.InsuranceOrder;
import models.InsuranceOrder.ProcessStatus;
import models.RequestSource;
import org.apache.commons.lang.StringUtils;
import play.Play;
import play.db.jpa.JPA;
import services.insuranceGateway.common.ApplicationConstrains;
import services.insuranceGateway.common.QueryResult;

import javax.persistence.Query;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderService {
    private static final Map<String, RequestSource> sourceMap = new HashMap<>();

    static {
        sourceMap.put("pingan", RequestSource.PINGAN);
        sourceMap.put("taiping", RequestSource.TAIPING);
        sourceMap.put("renbao", RequestSource.RENBAO);
        sourceMap.put("zhlh", RequestSource.ZHLH);
        sourceMap.put("ygbx", RequestSource.YGBX);
        sourceMap.put("sqbx", RequestSource.SQBX);
    }

    public static final OrderService INSTANCE = new OrderService();

    private static final Integer MAX_SIZE = Integer.parseInt(Play.configuration.getProperty("req.orders.maxSize", "10"));

    public void saveTask(RequestSource from, String body) {
    	if(body == null){
    		return;
    	}
        InsuranceOrder orders = new InsuranceOrder();
        orders.processStatus = ProcessStatus.QUEUED;
        orders.json = body;
        orders.requestSource = from;
        orders.createBy = ApplicationConstrains.CYY_AGENCY_NAME;
        orders.updateBy = ApplicationConstrains.CYY_AGENCY_NAME;
        orders.createDate = Calendar.getInstance().getTime();
        orders.updateDate = orders.createDate;
        orders.save();

    }

    public List<InsuranceOrder> fetchUnprocessOrders() {
        Query query = JPA.em().createQuery("FROM " + InsuranceOrder.class.getName() + " WHERE processStatus = :processStatus ORDER BY id")
                .setParameter("processStatus", ProcessStatus.QUEUED);
        return query.setMaxResults(MAX_SIZE).getResultList();
    }

    public void updateOrderStatus(Long orderId, ProcessStatus status) {
        JPA.em().createQuery("UPDATE " + InsuranceOrder.class.getName() + " SET processStatus = :status, updateDate = now() WHERE id = :id")
                .setParameter("id", orderId)
                .setParameter("status", status)
                .executeUpdate();
    }

    public static RequestSource requestSource(String from) {
        return StringUtils.isEmpty(from) ? null : sourceMap.get(from);
    }

    public QueryResult<InsuranceOrder> findOrdersByStatus(RequestSource requestSource, ProcessStatus processStatus, Integer pageNo) {
        StringBuilder sql = new StringBuilder("FROM " + InsuranceOrder.class.getName() + " WHERE processStatus = :processStatus");
        Map<String, Object> params = new HashMap<String, Object>();
        if (requestSource != null) {
            sql.append(" AND requestSource = :requestSource");
            params.put("requestSource", requestSource);
        }

        Query query = JPA.em().createQuery("SELECT COUNT(*) " + sql.toString())
                .setParameter("processStatus", processStatus != null ? processStatus : ProcessStatus.QUEUED);
        for (String key : params.keySet()) {
            query.setParameter(key, params.get(key));
        }

        QueryResult<InsuranceOrder> result = new QueryResult<InsuranceOrder>();
        result.pageNo = pageNo;
        result.totalItemsCount = ((Number) query.getSingleResult()).longValue();
        result.computePages();

        query = JPA.em().createQuery(sql.toString())
                .setParameter("processStatus", processStatus != null ? processStatus : ProcessStatus.QUEUED);
        for (String key : params.keySet()) {
            query.setParameter(key, params.get(key));
        }
        result.items = query.getResultList();

        return result;
    }
}
