package com.dto;

import java.util.List;

public class GoodsPageDTO {
	
	private List<GoodsDTO> glist;
	private int curPage;
	private int totalPage;
	private static int perPage = 3;
	private int perBlock = 3;
	private static String searchName = null;
	private static String searchValue = null;
	private String userId;
	public GoodsPageDTO(List<GoodsDTO> glist, int curPage, int totalPage, int perBlock, String userId) {
		super();
		this.glist = glist;
		this.curPage = curPage;
		this.totalPage = totalPage;
		this.perBlock = perBlock;
		this.userId = userId;
	}
	public GoodsPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public List<GoodsDTO> getGlist() {
		return glist;
	}
	public void setGlist(List<GoodsDTO> glist) {
		this.glist = glist;
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
		GoodsPageDTO.perPage = perPage;
	}
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}
	public static String getSearchName() {
		return searchName;
	}
	public static void setSearchName(String searchName) {
		GoodsPageDTO.searchName = searchName;
	}
	public static String getSearchValue() {
		return searchValue;
	}
	public static void setSearchValue(String searchValue) {
		GoodsPageDTO.searchValue = searchValue;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "GoodsPageDTO [glist=" + glist + ", curPage=" + curPage + ", totalPage=" + totalPage + ", perBlock="
				+ perBlock + ", userId=" + userId + "]";
	}

	
	
}
