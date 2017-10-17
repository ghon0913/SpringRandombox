package com.dto;

public class OrderInfoDTO {
	
	private int num;
	private String userId;
	private String orderName;
	private String phone;
	private String eMail;
	private String post1;
	private String post2;
	private String addr1;
	private String addr2;
	private String gCode;
	private String gName;
	private int gPrice;
	private String gImage;
	private String payMethod;
	private String orderDay;
	private String sellerId;
	
	public OrderInfoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderInfoDTO(int num, String userId, String orderName, String phone, String eMail, String post1,
			String post2, String addr1, String addr2, String gCode, String gName, int gPrice, String gImage,
			String payMethod, String orderDay, String sellerId) {
		super();
		this.num = num;
		this.userId = userId;
		this.orderName = orderName;
		this.phone = phone;
		this.eMail = eMail;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.gCode = gCode;
		this.gName = gName;
		this.gPrice = gPrice;
		this.gImage = gImage;
		this.payMethod = payMethod;
		this.orderDay = orderDay;
		this.sellerId = sellerId;
	}
	
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getOrderName() {
		return orderName;
	}
	
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String geteMail() {
		return eMail;
	}
	
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	
	public String getPost1() {
		return post1;
	}
	
	public void setPost1(String post1) {
		this.post1 = post1;
	}
	
	public String getPost2() {
		return post2;
	}
	
	public void setPost2(String post2) {
		this.post2 = post2;
	}
	
	public String getAddr1() {
		return addr1;
	}
	
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	
	public String getAddr2() {
		return addr2;
	}
	
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	
	public String getgCode() {
		return gCode;
	}
	
	public void setgCode(String gCode) {
		this.gCode = gCode;
	}
	
	public String getgName() {
		return gName;
	}
	
	public void setgName(String gName) {
		this.gName = gName;
	}
	
	public int getgPrice() {
		return gPrice;
	}
	
	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}
	
	public String getgImage() {
		return gImage;
	}
	
	public void setgImage(String gImage) {
		this.gImage = gImage;
	}
	
	public String getPayMethod() {
		return payMethod;
	}
	
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	
	public String getOrderDay() {
		return orderDay;
	}
	
	public void setOrderDay(String orderDay) {
		this.orderDay = orderDay;
	}
	
	public String getSellerId() {
		return sellerId;
	}
	
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	
	@Override
	public String toString() {
		return "OrderInfoDTO [num=" + num + ", userId=" + userId + ", orderName=" + orderName + ", phone=" + phone
				+ ", eMail=" + eMail + ", post1=" + post1 + ", post2=" + post2 + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", gCode=" + gCode + ", gName=" + gName + ", gPrice=" + gPrice + ", gImage=" + gImage + ", payMethod="
				+ payMethod + ", orderDay=" + orderDay + ", sellerId=" + sellerId + "]";
	}


}
