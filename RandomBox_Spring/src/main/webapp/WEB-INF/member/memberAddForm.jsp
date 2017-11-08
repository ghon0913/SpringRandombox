<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->

<div style="background-color: #0277BD; margin-top: -30px; color: white; padding: 20px 200px; align: right; margin-bottom: 20px;">
	<h5 style="display:inline;">|&nbsp;&nbsp;&nbsp;<b>회원가입</b>&nbsp;&nbsp;&nbsp;|</h5>
</div>
<div class="container">
	<div>
			<p style="font-size: 12px;">회원 정보를 입력해 주세요. 모두 입력하셔야 가입이 가능합니다.</p>
			<form action="memberAdd" method="post" id="memberAddForm" modelAttribute="memberAddForm">
				<table name="memberAddForm" class="table" style="font-size: 12px;">
					<tr>
						<td colspan="3" align="center">일반 구매회원&nbsp; <input
							type="radio" name="ox" value="N" checked="checked">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							사업자 판매회원 &nbsp;<input type="radio" name="ox" value="Y">
						</td>
					</tr>
					<tr>
						<td width="300px" style="padding-left: 120px;">아이디</td>
						<td><input class="form-control" type="text" name="userid"
							id="userid" placeholder="userid" required="required">
						<td width="300px"><span id="idCheck" style="font-size: 10px; color: red;">
						</span></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">비밀번호</td>
						<td><input class="form-control" type="password" name="passwd"
							id="passwd" placeholder="password" required></td>
						<td></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">비밀번호 확인</td>
						<td><input class="form-control" type="password"
							name="passwd2" id="passwd2" placeholder="password" required></td>
						<td><span id="passwdCheck" style="font-size: 10px; color: red;"></span></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">이름</td>
						<td><input class="form-control" type="text" name="username"
							id="username" placeholder="username" required></td>
						<td></td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">이메일</td>
						<td id="email_td">
							<div class="form-inline">
								<input class="form-control" type="text" name="email1" id="email1" required>
								&nbsp; @ &nbsp;
								<input class="form-control" required type="text" name="email2" id="email2">
							</div>
							<br>
							<select class="form-control" id="emailSelect">
								<option id="etc" value="etc">직접입력하기</option>
								<option value="naver.com">naver</option>
								<option value="daum.net">daum</option>
								<option value="nate.com">nate</option>
								<option value="gmail.com">gmail</option>
								<option value="hotmail.com">hotmail</option>
								<option value="korea.com">korea</option>
							</select>
						</td>
						<td>
							<span id="emailCheck" style="font-size: 10px; color: red;"></span>
							<input type="hidden" name="email" value="" id="hidden_email">
						</td>
					</tr>
					<tr>
						<td style="padding-left: 120px;">성별</td>
						<td><input type="radio" name="gender" value="남"
							checked="checked">&nbsp;&nbsp;남&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="radio" name="gender" value="여">&nbsp;&nbsp;여</td>
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
						<td colspan="3" align="center">
							<input class="btn btn-success" type="submit" value="회원가입">
							<input class="btn btn-default" type="reset" value="다시 작성하기">
							<input class="btn btn-default" type="button" value="취소" id="cancel">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function() {

						/* 아이디 중복 검사 */
						$("#userid").on("keyup", function(event) {
							
 							if($("#userid").val().length == 0){
								$("#idCheck").text("");
							}else if ($("#userid").val().length >= 12 || $("#userid").val().length < 3) {
								$("#idCheck").text("3-12자");
							}else{
							
								$.ajax({
									type : "post",
									url : "idCheck",
									data : {
										userid : $("#userid").val()
									},
									dataType : "text",
									success : function(responseData, status, xhr) {
										$("#idCheck").text(responseData);
									},
									error : function(xhr, status, e) {
										console.log(status, e);
									}
								}); // end ajax
							} 
						});
						
						/* 이메일 자동입력 + 유효성 */
						$("#emailSelect").on("change",function(event) {
							
							if ($("#emailSelect option:selected").attr("value") != 'etc') {
								$("#email2").val(
										$('#emailSelect option:selected').attr('value'));
										$("#email2").attr("readonly","readonly");
							}else{
								$("#email2").attr("readonly",false);
								$("#email2").val("");
							}
							
							var email = $("#email1").val()+"@"+$("#email2").val();
							
							if($("#email1").val().length == 0){
								$("#emailCheck").text("이메일 입력 필수");
							}else if($("#email2").val().length == 0){
								$("#emailCheck").text("이메일 입력 필수");
							}else{
								$.ajax({
									type : "post",
									url : "emailCheck",
									data : {
										emailChk : email
									},
									dataType : "text",
									success : function(responseData, status, xhr) {

											$("#emailCheck").text(responseData);
									},
									error : function(xhr, status, e) {
										console.log(status, e);
									}
								}); // end ajax
							}
						});
						
						/* 이메일 유효성 검사 */
						$("#email2").on("keyup", function(event){
							
							var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
							var email = $("#email1").val()+"@"+$("#email2").val();
							
							if($("#email1").val().length == 0){
								$("#emailCheck").text("이메일 입력 필수");
							}else if(!regExp.test(email)){
								$("#emailCheck").text("이메일 유형 부적합");
							}else{
								$.ajax({
									type : "post",
									url : "emailCheck",
									data : {
										emailChk : email
									},
									dataType : "text",
									success : function(responseData, status, xhr) {

											$("#emailCheck").text(responseData);
									},
									error : function(xhr, status, e) {
										console.log(status, e);
									}
								}); // end ajax
							}
						});
						
						$("#email1").on("keyup", function(event){
							
							var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
							var email = $("#email1").val()+"@"+$("#email2").val();
							
							if($("#email1").val().length == 0){
								$("#emailCheck").text("이메일 입력 필수");
							}else{
								$.ajax({
									type : "post",
									url : "emailCheck",
									data : {
										emailChk : email
									},
									dataType : "text",
									success : function(responseData, status, xhr) {

											$("#emailCheck").text(responseData);
									},
									error : function(xhr, status, e) {
										console.log(status, e);
									}
								}); // end ajax
							}
						});

						/* 비밀번호 확인 */
						$("#passwd2").on("keyup", function(event) {

							var passwd = $("#passwd").val();
							var passwd2 = $("#passwd2").val();
							
							if($("#passwd").val().length == 0 || $("#passwd").val().length == 0){
								$("#passwdCheck").text("");
							}else if ($("#passwd").val().length < 3) {
								$("#passwdCheck").text("3자 이상");
							}
							
							if ($("#passwd2").val().length != 0 || $("#passwd").val().length != 0) {
								if (passwd == passwd2) {
									$("#passwdCheck").text("비밀번호 일치");
								} else {
									$("#passwdCheck").text("비밀번호 불일치");
								}
							} else {
								$("#passwdCheck").text("");
							}

						});
						
						$("#passwd").on("keyup", function(event) {

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
						
						/* 유효성 검사*/
						$("#memberAddForm").on("submit",function(e) {

							var email = $("#email1").val()+"@"+$("#email2").val();
							
 								 if ($("#idCheck").text()=="3-12자" || $("#idCheck").text()=="아이디 중복") {
									alert("입력하신 아이디를 다시 확인해주세요!");
									e.preventDefault();
								} else if ($("#passwd").val().length < 3
										|| $("#passwdCheck").text() == "비밀번호 불일치") {
									alert("입력하신 비밀번호가 너무 짧거나\n확인란이 일치하지 않습니다!");
									e.preventDefault();
								} else if ($("#phone2").val().length < 3
										|| $("#phone2").val().length > 4
										|| $("#phone3").val().length != 4) {
									alert("입력하신 전화번호를 확인해주세요!");
									e.preventDefault();
								} else if ($("#passwdCheck").text() == "이메일 입력 필수"
										|| $("#passwdCheck").text() == "이메일 유형 부적합") {
									alert("입력하신 이메일을 확인해주세요!");
									e.preventDefault();
								}
								
								var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
								$("#hidden_phone").val(phone);
								$("#hidden_email").val(email);

							});
					});
</script>
