package com.dto;

public class MemberDTO {

	private String userid;
	private String username;
	private String passwd;
	private String email;
	private String phone;
	private String gender;
	private String birthday;
	private String post1;
	private String post2;
	private String addr1;
	private String addr2;
	private String ox;
	private String sessionId;
	private String sessionLimit;
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", username=" + username + ", passwd=" + passwd + ", email=" + email
				+ ", phone=" + phone + ", gender=" + gender + ", birthday=" + birthday + ", post1=" + post1 + ", post2="
				+ post2 + ", addr1=" + addr1 + ", addr2=" + addr2 + ", ox=" + ox + ", sessionId=" + sessionId
				+ ", sessionLimit=" + sessionLimit + "]";
	}
	public MemberDTO(String userid, String username, String passwd, String email, String phone, String gender,
			String birthday, String post1, String post2, String addr1, String addr2, String ox, String sessionId,
			String sessionLimit) {
		super();
		this.userid = userid;
		this.username = username;
		this.passwd = passwd;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.birthday = birthday;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.ox = ox;
		this.sessionId = sessionId;
		this.sessionLimit = sessionLimit;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPost1() {
		return post1;
	}
	public void setPost1(String post1) {
		this.post1 = post1;
	}
	public String getPost2() {
		return post2;
	}
	public void setPost2(String post2) {
		this.post2 = post2;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getOx() {
		return ox;
	}
	public void setOx(String ox) {
		this.ox = ox;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getSessionLimit() {
		return sessionLimit;
	}
	public void setSessionLimit(String sessionLimit) {
		this.sessionLimit = sessionLimit;
	}
	
	
}
