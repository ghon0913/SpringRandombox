package com.dto;

public class AnswerDTO {

	private String userId;
	private String sellerId;
	private int boardNum;
	private String answer;
	
	public AnswerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AnswerDTO(String userId, String sellerId, int boardNum, String answer) {
		super();
		this.userId = userId;
		this.sellerId = sellerId;
		this.boardNum = boardNum;
		this.answer = answer;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
}
