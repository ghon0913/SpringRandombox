package com.dto;

import java.util.List;

public class MyPageBoardPageDTO {
	
	private List<BoardDTO> blist;
	private int curPage;
	private int totalPage;
	private static int perPage = 3;
	private int perBlock = 3;
	private String searchName;
	private String searchValue;
	private String userId;
	public List<BoardDTO> getBlist() {
		return blist;
	}
	public void setBlist(List<BoardDTO> blist) {
		this.blist = blist;
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
		MyPageBoardPageDTO.perPage = perPage;
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
	public MyPageBoardPageDTO(List<BoardDTO> blist, int curPage, int totalPage, int perBlock, String searchName,
			String searchValue, String userId) {
		super();
		this.blist = blist;
		this.curPage = curPage;
		this.totalPage = totalPage;
		this.perBlock = perBlock;
		this.searchName = searchName;
		this.searchValue = searchValue;
		this.userId = userId;
	}
	public MyPageBoardPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
