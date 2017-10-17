package com.dto;

import java.util.List;

public class OrderInfoPageDTO {

	private List<OrderInfoDTO> olist;
	private int curPage;
	private int totalPage;
	private static int perPage = 3;
	private int perBlock = 3;
	private String startdate;
	private String finaldate;
	private String userId;
	public List<OrderInfoDTO> getOlist() {
		return olist;
	}
	public void setOlist(List<OrderInfoDTO> olist) {
		this.olist = olist;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public static int getPerPage() {
		return perPage;
	}
	public static void setPerPage(int perPage) {
		OrderInfoPageDTO.perPage = perPage;
	}
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getFinaldate() {
		return finaldate;
	}
	public void setFinaldate(String finaldate) {
		this.finaldate = finaldate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "OrderInfoPageDTO [olist=" + olist + ", curPage=" + curPage + ", totalPage=" + totalPage + ", perBlock="
				+ perBlock + ", startdate=" + startdate + ", finaldate=" + finaldate + ", userId=" + userId + "]";
	}
	public OrderInfoPageDTO(List<OrderInfoDTO> olist, int curPage, int totalPage, int perBlock, String startdate,
			String finaldate, String userId) {
		super();
		this.olist = olist;
		this.curPage = curPage;
		this.totalPage = totalPage;
		this.perBlock = perBlock;
		this.startdate = startdate;
		this.finaldate = finaldate;
		this.userId = userId;
	}
	public OrderInfoPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
