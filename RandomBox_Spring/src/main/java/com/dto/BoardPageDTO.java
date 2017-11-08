package com.dto;

import java.util.List;

public class BoardPageDTO {

	private List<BoardDTO> list;
	private int curPage;
	private int totalCount;
	private int perPage = 6 ;
	private int perBlock = 5;
	private String searchName;
	private String searchValue;
	
	public BoardPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<BoardDTO> getList() {
		return list;
	}

	public void setList(List<BoardDTO> list) {
		this.list = list;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
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

	@Override
	public String toString() {
		return "BoardPageDTO [list=" + list + ", curPage=" + curPage + ", totalCount=" + totalCount + ", perPage="
				+ perPage + ", perBlock=" + perBlock + ", searchName=" + searchName + ", searchValue=" + searchValue
				+ "]";
	}
	
}
