package com.dto;

import java.util.List;

public class MyPageBoardPageDTO {
	
	private List<BoardDTO> blist;//목록
	private int curPage; //현재페이지
	private int totalPage; //총페이지개수
	private static int perPage = 3;
	private int perBlock = 3;
	private static String searchName = null; //조회속성명
	private static String searchValue = null;//조회속성값
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
	public static String getSearchName() {
		return searchName;
	}
	public static void setSearchName(String searchName) {
		MyPageBoardPageDTO.searchName = searchName;
	}
	public static String getSearchValue() {
		return searchValue;
	}
	public static void setSearchValue(String searchValue) {
		MyPageBoardPageDTO.searchValue = searchValue;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public MyPageBoardPageDTO(List<BoardDTO> blist, int curPage, int totalPage, int perBlock, String userId) {
		super();
		this.blist = blist;
		this.curPage = curPage;
		this.totalPage = totalPage;
		this.perBlock = perBlock;
		this.userId = userId;
	}
	public MyPageBoardPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MyPageBoardPageDTO [blist=" + blist + ", curPage=" + curPage + ", totalPage=" + totalPage
				+ ", perBlock=" + perBlock + ", userId=" + userId + "]";
	}


	
	
}
