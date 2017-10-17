<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script type="text/javascript">
	$(document).ready(function() {//id중복체크하기
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
		$("#myform").on("submit", function(e){
			
			if($("#phoneNumber").val().length==0){
				alert("입력하신 전화번호를 확인해주세요!");
				e.preventDefault();
			}else if($("#passwd").val().length==0 || $("#passwd2").val().length==0 || $("#passwdCheck").text()=="비밀번호 불일치"){
				alert("입력하신 비밀번호를 확인해주세요!");
				e.preventDefault();
			}else if($("#email1").val().length==0 || $("#email2").val().length==0 || $("#emailCheck").text()=="이메일 유형 부적합"){
				alert("입력하신 이메일을 확인해주세요!");
				e.preventDefault();
	 		}else if($("#post1").val().length == 0 || $("#addr2").val().length == 0){
				alert("입력하신 주소를 확인해주세요!");
				e.preventDefault();
			}
		});
		   
		   
	});
</script>

<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->
<div align="center">
	<form id="myform" action="userinfoupdate.do">
		<table border="1">
			<tr colspan="2">
				<td>이름</td>
				<td><input type="text" id="userName" name="userName"
					value="${mdto.username}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="userid" name="userid"
					value="${mdto.userid}" readonly="readonly"></td>
			</tr>
			<!-- name으로 servlet에서 파라미터받아라 -->
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" id="passwd"
					value="${mdto.passwd }"><br /> <input type="password"
					name="passwd2" id="passwd2"><span id="passwdCheck"></span></td>
				<!-- 비밀번호확인j쿼리추가하기 -->
			</tr>
			<tr>
				<td>휴대전화</td>
				<td><input type="text" name="phoneNumber" id="phoneNumber"
					value="${mdto.phone}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<!-- 다음주소 시작--> <input name="post1" id="post1" size="5"
					value="${mdto.post1}" readonly=""> - <input name="post2"
					id="post2" size="5" value="${mdto.post2}" readonly=""> <input
					onclick="openDaumPostcode()" type="button" value="우편번호찾기">
					<br> <input name="addr1" id="addr1" size="40" readonly=""
					placeholder="도로명주소" value="${mdto.addr1}"> <br> <span
					style="line-height: 10%;"><br></span> <input name="addr2"
					id="addr2" size="40" value="${mdto.addr2}" placeholder="지번주소">
					<!-- 다음주소 끝 -->
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit"
					action="userinfoupdate.do" value="수정"></td>
			</tr>
		</table>
	</form>
</div>

