package com.dto;

public class GoodsDTO {
	
	private int gPrice;
	private String gCode;
	private String gCategory;
	private String gName;
	private String gImage;
	private String gContentImage;
	private int gAmount;
	private String sellerId;
	public GoodsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoodsDTO(int gPrice, String gCode, String gCategory, String gName, String gImage, String gContentImage,
			int gAmount, String sellerId) {
		super();
		this.gPrice = gPrice;
		this.gCode = gCode;
		this.gCategory = gCategory;
		this.gName = gName;
		this.gImage = gImage;
		this.gContentImage = gContentImage;
		this.gAmount = gAmount;
		this.sellerId = sellerId;
	}

	
	public int getgPrice() {
		return gPrice;
	}
	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}
	public String getgCode() {
		return gCode;
	}
	public void setgCode(String gCode) {
		this.gCode = gCode;
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
	public String getgImage() {
		return gImage;
	}
	public void setgImage(String gImage) {
		this.gImage = gImage;
	}
	public String getgContentImage() {
		return gContentImage;
	}
	public void setgContentImage(String gContentImage) {
		this.gContentImage = gContentImage;
	}
	public int getgAmount() {
		return gAmount;
	}
	public void setgAmount(int gAmount) {
		this.gAmount = gAmount;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	@Override
	public String toString() {
		return "GoodsDTO [gPrice=" + gPrice + ", gCode=" + gCode + ", gCategory=" + gCategory + ", gName=" + gName
				+ ", gImage=" + gImage + ", gContentImage=" + gContentImage + ", gAmount=" + gAmount + ", sellerId="
				+ sellerId + "]";
	}
	
	
	

}
