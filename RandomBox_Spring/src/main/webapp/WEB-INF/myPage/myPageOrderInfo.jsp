<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">
<form action="">
<table border="1">
	<tr>
		<form action="orderinfopage.do">
		<td colspan="4">기간별조회 <input type="date" name="startdate"> - <input
			type="date" name="finaldate"><input type="submit">
		</td>
		
		</form>
	</tr>
	<tr>

			<td colspan="4">
				<form action="MyPageOrderInfoPageServlet">
					<select name="perpage">
						<!-- change함수주기 -->
						<option value="3">3개씩보기</option>
						<option value="5">5개씩보기</option>
						<option value="7">7개씩보기</option>
					</select> <input type="submit">
				</form>
			</td>

		</tr>
	<tr>
		<td>날짜</td>
		<td>주문번호</td>
		<td>상품정보</td>
		<td>상태</td>
	</tr>
	<c:if test="${empty pagedto.getOlist() }">
		<tr>
			<td colspan="3"> 레코드가 없습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${!empty pagedto.getOlist() }">
	<!-- 기간내 foreach문 주문내역 -->
	
	<c:forEach var="order" items="${pagedto.getOlist() }">
	<tr>
		<input id="gCode" type="hidden" value="${order.gCode }">
		<input id="gName" type="hidden" value="${order.gName }">
		<input id="gPrice" type="hidden" value="${order.gPrice }">
		<td>${order.orderDay }
		<td><a href="orderinforetrieve.do?num=${order.num }" target="blank">${order.num }</a></td>
		<td>
		<img src="images/goods/${order.gImage }" height="100" width="100"> ${order.gName }${order.gPrice }</td>
		<td>배송중/배송완료<br><input class="reviewWrite" type="button" value="후기 작성하기"></td> 
	</tr>
	</c:forEach>
	<tr>
				<td colspan="4" align="center"><jsp:include
						page="myPageOrderInfoPage.jsp" flush="true" /></td>
			</tr>
		</c:if>
</table>
</form>
</div>

<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script>
$(document).ready(function(){

	/* 후기작성하기 */
	$(".reviewWrite").on("click", function(){
		var gCode = $(this).parent().siblings("#gCode").val();
		var gName = $(this).parent().siblings("#gName").val();
		var gPrice = $(this).parent().siblings("#gPrice").val();
		$(location).attr("href", "ReviewFormServlet?gCode="+gCode+"&gName="+gName+"&gPrice="+gPrice);
	});
});
</script>