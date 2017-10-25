<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



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
	<table align="center">
		<c:if test="${login.ox=='N'}">
			<tr>
				<td style="padding: 2px;"><button id="userinfo1"
						class="btn btn-info btn-block" aria-pressed="true">회원정보</button></td>
				<td style="padding: 2px;"><button id="orderinfo"
						class="btn btn-info btn-block" aria-pressed="true">주문내역</button></td>
				<td style="padding: 2px;"><button id="myboard"
						class="btn btn-info btn-block" aria-pressed="true">내가쓴글</button></td>
			</tr>
		</c:if>


		<c:if test="${login.ox=='Y'}">
			<tr>
				<td style="padding: 2px;"><button id="userinfo2"
						class="btn btn-info btn-block" aria-pressed="true">회원정보</button></td>
				<td style="padding: 2px;"><button id="orderinfo"
						class="btn btn-info btn-block" aria-pressed="true">매출정보</button></td>
				<td style="padding: 2px;"><button id="goodsinfo"
						class="btn btn-info btn-block" aria-pressed="true">상품목록</button></td>
			</tr>
		</c:if>

		<c:if test="${login.ox=='Z'}">
			<tr>
				<td style="padding: 2px;"><button id="salesStatus"
						class="btn btn-info btn-block" aria-pressed="true">매출현황</button></td>
				<td style="padding: 2px;"><button id="userInfo"
						class="btn btn-info btn-block" aria-pressed="true">회원관리</button></td>
				<td style="padding: 2px;"><button id="goodsinfo1"
						class="btn btn-info btn-block" aria-pressed="true">상품관리</button></td>
			</tr>
		</c:if>
	</table>
	<hr />

	<c:if test="${!empty requestScope.page}">
		<jsp:include page="${page}" />
	</c:if>

</body>
</html>
<c:if test="${!empty requestScope.userInfoUpdate}">
	<script>
		alert('${requestScope.userInfoUpdate}');
	</script>
</c:if>

<c:if test="${!empty requestScope.goodsdelete}">
	<script>
		alert('${requestScope.goodsdelete}');
	</script>
</c:if>

<c:if test="${!empty requestScope.goodsdelete}">
	<script>
		alert('${requestScope.goodsdelete}');
	</script>
</c:if>
<c:if test="${!empty requestScope.goodsupdate}">
	<script>
		alert('${requestScope.goodsupdate}');
	</script>
</c:if>




<script>
	$(document).ready(function() {
		$("#userinfo1").on("click", function() {
			//console.log(">>>>>>>>>>",'${login}');
			location.href = "userInfo";
		})
		$("#userinfo2").on("click", function() {
			//console.log(">>>>>>>>>>",'${login}');
			location.href = "userInfo";
		})
		$("#orderinfo").on("click", function() {
			//console.log(">>>>>>>>>>",'${login}');
			location.href = "orderinfo";
		})
		$("#myboard").on("click", function() {
			location.href = "boardlist";
		})
		$("#sellinfo").on("click", function() {
			location.href = "sellinfo";
		})
		$("#goodsinfo").on("click", function() {
			location.href = "goodsinfo";
		})
		$("#goodsinfo1").on("click", function() {
			location.href = "goodsinfo";
		})

	});
</script>
