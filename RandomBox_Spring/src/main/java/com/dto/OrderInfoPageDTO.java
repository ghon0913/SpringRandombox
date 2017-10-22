package com.dto;

import java.util.List;

public class OrderInfoPageDTO {

	private List<OrderInfoDTO> olist; //전체리스트
	private int curPage; //현재페이지
	private int totalPage; //총 페이지개수
	private static int perPage = 3; 
	private int perBlock = 3; //페이지당 보여줄 페이지개수
	private static String startdate = null; //조회 시작날짜
	private static String finaldate = null; //조회 끝날짜
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
	public static String getStartdate() {
		return startdate;
	}
	public static void setStartdate(String startdate) {
		OrderInfoPageDTO.startdate = startdate;
	}
	public static String getFinaldate() {
		return finaldate;
	}
	public static void setFinaldate(String finaldate) {
		OrderInfoPageDTO.finaldate = finaldate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public OrderInfoPageDTO(List<OrderInfoDTO> olist, int curPage, int totalPage, int perBlock, String userId) {
		super();
		this.olist = olist;
		this.curPage = curPage;
		this.totalPage = totalPage;
		this.perBlock = perBlock;
		this.userId = userId;
	}
	public OrderInfoPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "OrderInfoPageDTO [olist=" + olist + ", curPage=" + curPage + ", totalPage=" + totalPage + ", perBlock="
				+ perBlock + ", userId=" + userId + "]";
	}

	
	
	
}
