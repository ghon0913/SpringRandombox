package com.dto;

public class SalesStatusDTO {
	private String orderDay;
	private int gPrice;
	public SalesStatusDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SalesStatusDTO(String orderDay, int gPrice) {
		super();
		this.orderDay = orderDay;
		this.gPrice = gPrice;
	}
	@Override
	public String toString() {
		return "SalesStatusDTO [orderDay=" + orderDay + ", gPrice=" + gPrice + "]";
	}
	public String getOrderDay() {
		return orderDay;
	}
	public void setOrderDay(String orderDay) {
		this.orderDay = orderDay;
	}
	public int getgPrice() {
		return gPrice;
	}
	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}
	
	
	
}
