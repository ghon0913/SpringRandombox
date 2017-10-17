package com.dto;

import java.util.List;

public class AdminUserInfoPageDTO {
	
	private List<MemberDTO> mlist; //모든 리스트
	private int curPage; //현재페이지
	private int totalPage; //모든페이지
	private static int perCount = 10; //나타낼행개수
	private int perBlock = 5; //나타낼페이지개수
	private String searchName;
	private String searchValue;
	private static String orderStandard = "userid";
	@Override
	public String toString() {
		return "AdminUserInfoPageDTO [mlist=" + mlist + ", curPage=" + curPage + ", totalPage=" + totalPage
				+ ", perBlock=" + perBlock + ", searchName=" + searchName + ", searchValue=" + searchValue + "]";
	}
	public AdminUserInfoPageDTO(List<MemberDTO> mlist, int curPage, int totalPage, int perBlock, String searchName,
			String searchValue) {
		super();
		this.mlist = mlist;
		this.curPage = curPage;
		this.totalPage = totalPage;
		this.perBlock = perBlock;
		this.searchName = searchName;
		this.searchValue = searchValue;
	}
	public AdminUserInfoPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public List<MemberDTO> getMlist() {
		return mlist;
	}
	public void setMlist(List<MemberDTO> mlist) {
		this.mlist = mlist;
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
	public static int getPerCount() {
		return perCount;
	}
	public static void setPerCount(int perCount) {
		AdminUserInfoPageDTO.perCount = perCount;
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
	public static String getOrderStandard() {
		return orderStandard;
	}
	public static void setOrderStandard(String orderStandard) {
		AdminUserInfoPageDTO.orderStandard = orderStandard;
	}

	
	

}
