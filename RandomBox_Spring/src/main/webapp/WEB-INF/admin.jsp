<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="jquery-3.2.1.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<jsp:include page="include/top.jsp" flush="true" />


	${login.username} 님 안녕하세요.
	<br />
	<br />
	

		<a id="salesStatus" href="salesStatus.admin">매출현황</a>
		<a id="userInfo" href="userInfoPage.admin">회원관리</a>
		<a id="goodsInfo" href="goodsInfo.admin">상품관리</a>
	<hr />


	<jsp:include page="${page}" />

</body>
</html>

