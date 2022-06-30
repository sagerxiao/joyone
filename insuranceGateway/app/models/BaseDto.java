package models;

import com.google.gson.annotations.Expose;

/**
 * 接口统一返回格式
 */
public class BaseDto<T> {
    public BaseDto() {
    }

    public BaseDto(ResponseStatus status) {
        setStatus(status);
    }

    public BaseDto(Long code, T data, String desc) {
        this.code = code;
        this.data = data;
        this.desc = desc;
    }

    //编码
    @Expose
    private Long code;
    //数据
    @Expose
    private T data;
    //描述
    @Expose
    private String desc;

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public void setStatus(ResponseStatus status) {
        this.code = status.getCode();
        this.desc = status.getDesc();
    }

    public boolean equalsTo(ResponseStatus status) {
        return ((status == null) ? false : status.getCode().equals(this.code));
    }

	@Override
	public String toString() {
		return "BaseDto [code=" + code + ", data=" + data + ", desc=" + desc + "]";
	}
}
