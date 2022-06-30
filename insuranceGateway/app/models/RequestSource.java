package models;

public enum RequestSource {
	TAIPING("中国太平"),
	RENBAO("中国人保"),
	PINGAN("中国平安"),
	ZHLH("中华联合"),
	YGBX("阳光保险"),
	SQBX("上汽保险");
	
	private String text;
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	RequestSource(String text) {
		this.text = text;
	}

	public static RequestSource getRequestSource(String value) {
		try {
			return valueOf(value);
		} catch (Exception e) {
			return null;
		}
	}
}
