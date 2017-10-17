<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">
	<div class="loginForm">
		<form name="LoginForm" method="get">
			<div class="box">
				<input type="text" class="iText" name="userid" value="&nbsp;">
				<br> <input type="password" name="passwd" id="" class="iText">
				<br>
				<p>
					<span class="fleft"><input type="checkbox" name="autoLogin"
						id="autoLogin" value="on"><label for=""> 아이디 저장</label></span> <span
						class="fright"><a href="FindUserIdFormServlet">아이디 찾기</a>&nbsp;|&nbsp;<a
						href="FindPasswdFormServlet">비밀번호 찾기</a>&nbsp;|&nbsp;<a
						href="MemberAddFormServlet">회원가입</a></span>
				</p>
			</div>
			<a href="javascript:login(LoginForm)" id="" class="loginBtn">로그인</a>
		</form>
	</div>
</div>
<script>
	function login(f) {
		f.action = "LoginServlet";
		f.submit();
	}
</script>
<style>
.loginForm {
	position: relative;
	width: 435px;
}

.loginForm .box {
	width: 326px
}

.loginForm .box .iText {
	width: 250px;
	margin: 3px 0;
	padding: 10px 12px;
	border: 1px solid #e1e1e1
}

.loginForm .box p {
	margin-top: 1em
}

.loginForm .box p span, .loginForm .box p input {
	height: 18px;
	font-size: 11px;
	color: #737373;
	line-height: 18px;
	vertical-align: middle
}

.loginForm .loginBtn {
	display: block;
	position: absolute;
	top: 0;
	right: 0;
	width: 80px;
	height: 100px;
	padding: 10px;
	border-radius: 5px;
	font-size: 14px;
	font-weight: 700;
	color: #fff;
	line-height: 80px;
	text-align: center;
	text-shadow: 1px 1px 1px #004773;
	background: #333
}
</style>