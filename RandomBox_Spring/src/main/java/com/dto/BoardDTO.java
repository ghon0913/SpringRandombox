package com.dto;

public class BoardDTO {
	
	private int num;
	private String category;
	private String state;
	private String title;
	private String content;
	private String writeDay;
	private String readCnt;
	private String userId;
	private String gCode;
	private String open;
	
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDay() {
		return writeDay;
	}
	public void setWriteDay(String writeDay) {
		this.writeDay = writeDay;
	}
	public String getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(String readCnt) {
		this.readCnt = readCnt;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getgCode() {
		return gCode;
	}
	public void setgCode(String gCode) {
		this.gCode = gCode;
	}
	public BoardDTO(int num, String category, String state, String title, String content, String writeDay,
			String readCnt, String userId, String gCode, String open) {
		super();
		this.num = num;
		this.category = category;
		this.state = state;
		this.title = title;
		this.content = content;
		this.writeDay = writeDay;
		this.readCnt = readCnt;
		this.userId = userId;
		this.gCode = gCode;
		this.open = open;
	}
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", category=" + category + ", state=" + state + ", title=" + title
				+ ", content=" + content + ", writeDay=" + writeDay + ", readCnt=" + readCnt + ", userId=" + userId
				+ ", gCode=" + gCode + ", open=" + open + "]";
	}
}
