package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Entity
@Table(schema = "car_service", name = "insurance_orders")
public class InsuranceOrder extends DomainObject {

    @Id
    @Column(columnDefinition = "BIGINT")
    @SequenceGenerator(name = "insurance_orders_id_seq", sequenceName = "insurance_orders_id_seq")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "insurance_orders_id_seq")
    @Expose
    public Long id;

    @Column(name = "request_source")
    @Enumerated(EnumType.STRING)
    @Expose
    public RequestSource requestSource;
    
    @Column(name = "process_status")
    @Enumerated(EnumType.STRING)
    @Expose
    public ProcessStatus processStatus;
    
    public enum ProcessStatus {

        QUEUED("队列中"), PROCESSED("已完成"), RESPONSE_ERROR("错误"), PARSE_ERROR("解析出错");

        public String name;

        ProcessStatus(String name) {
            this.name = name;
        }
        public static String getName(Object object) {
            if (object == null) {
                return null;
            }
            ProcessStatus de = ProcessStatus.valueOf(object.toString());
            if (de == null) {
                return null;
            }
            return de.name;
        }

    }
    @Column(name = "json")
    @Expose
    public String json;

    @Override
    public int hashCode() {
        return id == null ? super.hashCode() : (InsuranceOrder.class.getName() + id).hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof InsuranceOrder)) {
            return false;
        }
        return hashCode() == obj.hashCode();
    }
}
