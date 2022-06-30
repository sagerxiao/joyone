package models;

import com.google.gson.annotations.Expose;
import play.db.jpa.GenericModel;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import java.util.Calendar;
import java.util.Date;

@MappedSuperclass
public class DomainObject extends GenericModel {

    @Column(name = "created_dt")
    @Expose
    public Date createDate;

    @Column(name = "created_by")
    @Expose
    public String createBy;

    /**
     * keep below fields (updatable = true, insertable = true) for using the
     * current time
     */

    @Column(name = "modified_dt", updatable = true, insertable = true)
    @Expose
    public Date updateDate;

    @Column(name = "modified_by", updatable = true, insertable = true)
    @Expose
    public String updateBy;

    @PrePersist
    public void prePersist() {
        if (createDate == null) {
            createDate = Calendar.getInstance().getTime();
        }
        updateDate = Calendar.getInstance().getTime();
    }

    @PreUpdate
    public void preUpdate() {
        updateDate = Calendar.getInstance().getTime();
    }

}
