<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/app/home"><img
			src="/app/images/logo.jpg" width="120" height="120" align="left"></a>

		<div align="left">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

				<form class="form-inline my-2 my-lg-0" action="goodsBySearch">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search" aria-label="Search" name="searchBar" size=50>
					<button id="searchBarBtn" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>

				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<c:if test="${empty sessionScope.login}">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link"
							href="/app/loginForm">로그인 <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/app/memberForm">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="/app/loginForm"
							id="cart">장바구니</a></li>
					</ul>
				</c:if>
				<c:if test="${!empty sessionScope.login}">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link" href="/app/logout">로그아웃
						</a></li>
						<c:if test="${sessionScope.login.ox=='Y'}">
							<li class="nav-item"><a class="nav-link" href="/app/loginchk/MyPage">마이페이지</a></li>

							<li class="nav-item"><a class="nav-link"
								href="goodsRegisterForm">상품등록</a></li>
						</c:if>
						<c:if test="${sessionScope.login.ox=='N'}">
							<li class="nav-item"><a class="nav-link" href="/app/loginchk/MyPage">마이페이지</a></li>
							<%-- ${sessionScope.login.username}님 안녕하세요 --%>

							<li class="nav-item"><a class="nav-link" href="/app/loginchk/cartList">장바구니</a></li>
						</c:if>
						<c:if test="${sessionScope.login.ox=='Z'}">
							<li class="nav-item"><a class="nav-link" href="/app/loginchk/admin">관리자페이지</a></li>
							<%-- ${sessionScope.login.username}님 안녕하세요 --%>
						</c:if>
					</ul>
				</c:if>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="/app/reviewList">|</a></li>
					<li class="nav-item"><a class="nav-link" href="/app/inquiryList">Q
							& A</a></li>
					<li class="nav-item"><a class="nav-link" href="/app/reviewList">랜덤박스
							후기</a></li>
				</ul>


			</div>
			<script type="text/javascript">
				$("#cart").on("click", function() {
					alert("로그인이 필요한 메뉴입니다.");
				});
			</script>
		</div>

	</nav>
</div>
