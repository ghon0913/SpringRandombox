<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/app/js/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->

<div class="container">
	<div>
		<form method="post" id="myform" action="userInfoUpdate" modelAttribute="memberinfo">
		<form id="myform" action="userInfoUpdate" modelAttribute="memberinfo">
		<p style="font-size: 12px;"><b>회원 정보 수정 후 [수정하기]버튼을 눌러주세요.</b></p>
				<table name="memberAddForm" class="table" style="font-size: 12px;">
					<tr>
						<td width="300px" style="padding-left: 120px;">아이디</td>
						<td><input class="form-control" type="text" name="userid"
							id="userid" readonly="readonly" value="${mdto.userid}">
						<td width="300px"></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">비밀번호 변경</td>
						<td><input class="form-control" type="password" name="passwd"
							id="passwd" placeholder="password" required></td>
						<td></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">변경 비밀번호 확인</td>
						<td><input class="form-control" type="password"
							name="passwd2" id="passwd2" placeholder="password" required></td>
						<td><span id="passwdCheck" style="font-size: 10px; color: red;"></span></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">이름</td>
						<td><input class="form-control" type="text" name="username"
							id="username" value="${mdto.username}" readonly="readonly"></td>
						<td></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">이메일</td>
						<td id="email_td">
							<input class="form-control" type="text" value="${mdto.email}" id="email" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">성별</td>
						<td>${mdto.gender}</td>
						<td></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">생일</td>
						<td><input class="form-control" type="date" name="birthday"
							id="birthday" required></td>
						<td></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">주소</td>
						<td>
							<!-- 다음주소 시작-->
							<div class="form-inline">
								<input class="form-control" name="post1" id="post1" size="5" readonly="" required>
								&nbsp;-&nbsp;
								<input class="form-control" name="post2" id="post2" size="5" readonly="" required>
								&nbsp;&nbsp;&nbsp;
								<input onclick="openDaumPostcode()" type="button" value="우편번호찾기">
							</div>	
							<br>
							<input class="form-control" name="addr1" id="addr1" size="40" readonly="" placeholder="도로명주소" required><br>
							<input class="form-control" name="addr2" id="addr2" size="40" placeholder="지번주소" required>
							<!-- 다음주소 끝 -->
						</td>
						<td></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">전화번호</td>
						<td>
							<div class="form-inline">								
								<select class="form-control col-lg-3" name="phone1" id="phone1" >
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="017">016</option>
									<option value="017">017</option>
									<option value="017">018</option>
									<option value="017">019</option>
								</select>
								&nbsp;-&nbsp;
								<input class="form-control col-lg-4" type="text" name="phone2" id="phone2" required>
								&nbsp;-&nbsp;
								<input class="form-control col-lg-4" type="text" name="phone3" id="phone3" required>
								<input type="hidden" name="phone" value="" id="hidden_phone">
							</div>
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3" align="center"><input class="btn btn-success"
							type="submit" value="수정하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
<script>
	$(document).ready(function() {

						/* 비밀번호 확인 */
						$("#passwd2").on("keyup", function(event) {

							var passwd = $("#passwd").val();
							var passwd2 = $("#passwd2").val();

							if ($("#passwd2").val().length != 0) {
								if (passwd == passwd2) {
									$("#passwdCheck").text("비밀번호 일치");
								} else {
									$("#passwdCheck").text("비밀번호 불일치");
								}
							} else {
								$("#passwdCheck").text("");
							}

						});
						
						/* 빈칸 없나 확인 */
						$("#myform").on("submit",function(e) {
							
 								if ($("#userid").val().length == 0) {
									alert("입력하신 아이디를 확인해주세요!");
									e.preventDefault();
								} else if ($("#passwd").val().length == 0
										|| $("#passwd2").val().length == 0
										|| $("#passwdCheck").text() == "비밀번호 불일치") {
									alert("입력하신 비밀번호를 확인해주세요!");
									e.preventDefault();
								} else if ($("#username").val().length == 0) {
									alert("입력하신 이름을 확인해주세요!");
									e.preventDefault();
								} else if ($("#email1").val().length == 0
										|| $("#email2").val().length == 0
										|| $("#emailCheck").text() == "이메일 유형 부적합") {
									alert("입력하신 이메일을 확인해주세요!");
									e.preventDefault();
								} else if ($("#birthday").val().length == 0) {
									alert("입력하신 생일을 확인해주세요!");
									e.preventDefault();
								} else if ($("#post1").val().length == 0
										|| $("#addr2").val().length == 0) {
									alert("입력하신 주소를 확인해주세요!");
									e.preventDefault();
								} else if ($("#phone2").val().length < 3
										|| $("#phone2").val().length > 4
										|| $("#phone3").val().length != 4) {
									alert("입력하신 전화번호를 확인해주세요!");
									e.preventDefault();
								}
								
								var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
								var email = $("#email1").val()+"@"+$("#email2").val();
								$("#hidden_phone").val(phone);
								$("#hidden_email").val(email);

							});
					});
</script>

