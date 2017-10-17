<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>|&nbsp;&nbsp;&nbsp;구매 회원가입&nbsp;&nbsp;&nbsp;|</h3>
			<br>
			<p style="font-size: 12px;">회원 정보를 입력해 주세요. 모두 입력하셔야 가입이 가능합니다.</p>
			<form action="memberAdd" method="post" id="memberAddForm" modelAttribute="memberAddForm">
				<table name="memberAddForm" class="table">
					<tr>
						<td colspan="3" align="center">일반 구매회원&nbsp; <input
							type="radio" name="ox" value="N" checked="checked">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							사업자 판매회원 &nbsp;<input type="radio" name="ox" value="Y">
						</td>
					</tr>
					<tr>
						<td width="180px">아이디</td>
						<td><input class="form-control" type="text" name="userid"
							id="userid" placeholder="userid"> <td width="110px"><span id="idCheck" style="font-size: 10px; color: red;"></span></td></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input class="form-control" type="password" name="passwd"
							id="passwd" placeholder="password"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input class="form-control" type="password"
							name="passwd2" id="passwd2" placeholder="password"></td><td> <span
							id="passwdCheck" style="font-size: 10px; color: red;"></span></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input class="form-control" type="text" name="username"
							id="username" placeholder="username"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td id="email_td"><span class="row"><span class="col-xs-3"><input class="form-control" type="text"
							name="email1" id="email1"></span>&nbsp; @ &nbsp;<span class="col-xs-3"><input class="form-control"
							type="text" name="email2" id="email2"></span></span><br><select
							class="form-control" id="email">
								<option id="etc" value="etc">직접입력하기</option>
								<option value="naver.com">naver</option>
								<option value="daum.net">daum</option>
								<option value="nate.com">nate</option>
								<option value="gmail.com">gmail</option>
								<option value="hotmail.com">hotmail</option>
								<option value="korea.com">korea</option>
						</select></td><td><span id="emailCheck" style="font-size: 10px; color: red;"></span>
						<input type="hidden" name="email" value="" id="hidden_email"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td><input type="radio" name="gender" value="남"
							checked="checked">&nbsp;&nbsp;남&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="radio" name="gender" value="여">&nbsp;&nbsp;여</td>
					</tr>
					<tr>
						<td>생일</td>
						<td><input class="form-control" type="date" name="birthday"
							id="birthday"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<!-- 다음주소 시작--> <span class="row"><span class="col-xs-3"><input
									class="form-control" name="post1" id="post1" size="5"
									readonly=""> </span>&nbsp;-&nbsp;<span class="col-xs-3">
									<input class="form-control" name="post2" id="post2" size="5"
									readonly="">
							</span> <span class="col-xs-3"> &nbsp;&nbsp;&nbsp;<input
									onclick="openDaumPostcode()" type="button" value="우편번호찾기"></span></span><br>
							<input class="form-control" name="addr1" id="addr1" size="40"
							readonly="" placeholder="도로명주소"><br>
						</span> <input class="form-control" name="addr2" id="addr2" size="40"
							placeholder="지번주소"> <!-- 다음주소 끝 -->
						</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><span class="row"><span class="col-xs-2"><select
									class="form-control col-xs-2" name="phone1" id="phone1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="017">016</option>
										<option value="017">017</option>
										<option value="017">018</option>
										<option value="017">019</option>
								</select></span> &nbsp;-&nbsp; <span class="col-xs-2"> <input
									class="form-control" type="text" name="phone2" id="phone2"></span>&nbsp;
								-&nbsp; <span class="col-xs-2"> <input
									class="form-control" type="text" name="phone3"
									id="phone3"></span></span>
									<input type="hidden" name="phone" value="" id="hidden_phone"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input class="btn btn-success"
							type="submit" value="회원가입"> <input
							class="btn btn-default" type="reset" value="다시 작성하기"> <input
							class="btn btn-default" type="button" value="취소" id="cancel"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {

						/* 아이디 중복 검사 */

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

						/* 이메일 중복, 유효성 검사 */
						var ck_email = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
						$("select#email").on("change",function(event) {

									if ($("#email option:selected").attr(
											"value") != 'etc') {

										$("#email2").val(
												$('#email option:selected')
														.attr('value'));
										$("#email2").attr("readonly",
												"readonly");

										if ($("#email1").val() != null) {
											email1 = $("#email1").val();
											email2 = $("#email2").val();
										}
										
									}
								});
						
						/* 빈칸 없나 확인 */
						$("#memberAddForm").on("submit",function(e) {
							
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