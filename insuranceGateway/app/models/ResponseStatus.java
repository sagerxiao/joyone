package models;

/**
 * 返回给客户端的状态和描述
 */
public enum ResponseStatus {
    //basic codes definitions
    _200(200L, "请求成功"),
    _404(404L, "请求不到资源"),
    _500(500L, "服务器异常"),

    _900(900L, "参数格式不正确"),

    _2001(2001L, "JSON解析出错");

	
    // 编码
    private Long code;
    // 描述
    private String desc;

    private ResponseStatus(Long code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
