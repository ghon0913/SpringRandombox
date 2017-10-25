<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">
	
		<table border="1">
			
			<tr>
				<td colspan="10" align="center">기간별조회
				 <form action="orderinfodatepage">
				<input type="date" name="startdate">
					- <input type="date" name="finaldate"><input type="submit">
				</form>
				</td>
			</tr>
			
			<tr>

				<td colspan="10">
					<form action="orderinfoperpage">
						<select name="perPage">
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
					<td colspan="5">레코드가 없습니다.</td>
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
						<td><a href="orderretrieve?ordernum=${order.num }"
							target="blank">${order.num }</a></td>
						<td><img src="/app/images/goods/${order.gImage }"
							height="100" width="100"> ${order.gName }${order.gPrice }</td>
						<td>배송중/배송완료<br> <input class="reviewWrite"
							type="button" value="후기 작성하기"></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4" align="center"><jsp:include
							page="myPageOrderInfoPage.jsp" flush="true" /></td>
				</tr>
			</c:if>
		</table>

</div>

<script>
	$(document).ready(
			function() {

				/* 후기작성하기 */
				$(".reviewWrite").on("click",function() {
							var gCode = $(this).parent().siblings("#gCode")
									.val();
							var gPrice = $(this).parent().siblings("#gPrice")
									.val();
							$(location).attr("href",
									"reviewForm?gCode=" + gCode
											+ "&gPrice=" + gPrice);
						});
			});
</script>