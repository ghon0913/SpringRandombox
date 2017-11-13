<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="container">
	<br>
	<table class="table" style="font-size: 12px;">
			<tr align="center">
				<td width="100px"><b>주문번호</b></td>
				<td width="100px"><b>주문자</b></td>
				<td width="100px"><b>상품코드</b></td>
				<td><b>상품명</b></td>
				<td width="100px"><b>주문 정보</b></td>
				<td width="100px"><b>주문일자</b></td>
				<td width="100px"><b>배송상태</b></td>
			</tr>
		<c:if test="${empty sellInfoDTO.olist }">
			<tr>
				<td colspan="10" align="center">주문 정보가없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${! empty sellInfoDTO.olist }">
			<c:forEach var="order" items="${sellInfoDTO.olist }">
				<tr align="center">
					<td >${order.num }</td>
					<td>${order.orderName }</td>
					<td>${order.gCode }</td>
					<td align="left"><img src="/app/images/goods/${order.gImage }" height="70" width="70">&nbsp;
					${order.gName }</td>
					<td><input class="btn btn-outline-secondary btn-sm" type="button" value="자세히보기"></td>
					<td>${order.orderDay }</td>
					<td><span id="span${order.num }" class="statusSpan">${order.status }</span><br>
						<c:if test="${order.status=='배송준비중'}">
							<input class="btn btn-outline-success btn-sm status" type="button" value="배송처리" id="statusBtn" data-num="${order.num }">
						</c:if>
					</td>
				</tr>

			</c:forEach>

			<tr>
				<td colspan="10" align="center"><jsp:include
						page="myPageGoodsInfoPage.jsp"></jsp:include>
			</tr>
		</c:if>
	</table>
</div>
<script>
$(document).ready(function() {
	
	/* 배송처리 */
	$(".status").on("click", function() {
		
		var num = $(this).attr("data-num");
		$.ajax({
			url : "statusUpdate",
			method : "get",
			dataType : "text",
			data : {
				num : num
			},
			success : function(responseData, status, xhr) {
				$("#span"+num).text("배송 완료");
				$("#statusBtn").remove();
				alert("배송처리가 완료되었습니다.");
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		}); // end ajax

	});
});
</script>
