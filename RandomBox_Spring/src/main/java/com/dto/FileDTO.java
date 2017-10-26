package com.dto;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileDTO {
	
	private String gCategory;
	private String gName;
	private int gPrice;
	private int gAmount;
	private CommonsMultipartFile gImage;
	private CommonsMultipartFile gContentImage;
	
	public FileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getgCategory() {
		return gCategory;
	}

	public void setgCategory(String gCategory) {
		this.gCategory = gCategory;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public int getgPrice() {
		return gPrice;
	}

	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}

	public int getgAmount() {
		return gAmount;
	}

	public void setgAmount(int gAmount) {
		this.gAmount = gAmount;
	}

	public CommonsMultipartFile getgImage() {
		return gImage;
	}

	public void setgImage(CommonsMultipartFile gImage) {
		this.gImage = gImage;
	}

	public CommonsMultipartFile getgContentImage() {
		return gContentImage;
	}

	public void setgContentImage(CommonsMultipartFile gContentImage) {
		this.gContentImage = gContentImage;
	}

}
