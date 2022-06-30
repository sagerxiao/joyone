package models;


public class PingAnRescueResp<T> {
	public String code;
	public String msg;
	public T data;
	
	public void setStatus(ResponseStatus status) {
		this.code = status.getCode().toString();
		this.msg = status.getDesc();
	}
	
}
