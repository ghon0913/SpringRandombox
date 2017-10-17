package com.dto;

import java.util.List;

public class GoodsPageDTO {
	
	private List<GoodsDTO> glist;
	private int curPage;
	private int totalPage;
	private static int perPage = 3;
	private int perBlock = 3;
	private String searchName;
	private String searchValue;
	private String userId;
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
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
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
				+ perBlock + ", searchName=" + searchName + ", searchValue=" + searchValue + ", userId=" + userId + "]";
	}
	public GoodsPageDTO(List<GoodsDTO> glist, int curPage, int totalPage, int perBlock, String searchName,
			String searchValue, String userId) {
		super();
		this.glist = glist;
		this.curPage = curPage;
		this.totalPage = totalPage;
		this.perBlock = perBlock;
		this.searchName = searchName;
		this.searchValue = searchValue;
		this.userId = userId;
	}
	public GoodsPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	
	
}
