package com.dto;

public class AdminSalesStatusDTO {
	
	private String orderDay;
	private String sellerid;
	private String gPrice;
	public String getOrderDay() {
		return orderDay;
	}
	public void setOrderDay(String orderDay) {
		this.orderDay = orderDay;
	}
	public String getSellerid() {
		return sellerid;
	}
	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}
	public String getgPrice() {
		return gPrice;
	}
	public void setgPrice(String gPrice) {
		this.gPrice = gPrice;
	}
	@Override
	public String toString() {
		return "AdminSalesStatusDTO [orderDay=" + orderDay + ", sellerid=" + sellerid + ", gPrice=" + gPrice + "]";
	}
	public AdminSalesStatusDTO(String orderDay, String sellerid, String gPrice) {
		super();
		this.orderDay = orderDay;
		this.sellerid = sellerid;
		this.gPrice = gPrice;
	}
	public AdminSalesStatusDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
