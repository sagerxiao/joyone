package services.insuranceGateway.common;

import com.google.gson.annotations.Expose;

import java.util.ArrayList;
import java.util.List;

public class QueryResult<T> {
    @Expose
    public Integer pageNo = 1;

    @Expose
    public Integer pageSize = 20;

    @Expose
    public Integer pageCount = 1;

    @Expose
    public long totalItemsCount;

    @Expose
    public List<T> items = new ArrayList<T>();

    @Expose
    public Object otherInfo;

    @Expose
    public Long version;

    public void computePages() {
        pageNo = pageNo == null || pageNo < 1 ? 1 : pageNo;
        pageCount = (int) ((totalItemsCount - 1) / pageSize) + 1;
        pageCount = pageCount < 1 ? 1 : pageCount;
        if (totalItemsCount < (pageNo - 1) * pageSize) {
            pageNo = 1;
        }
        if (pageNo > pageCount) {
            pageNo = pageCount;
        }
    }
}
