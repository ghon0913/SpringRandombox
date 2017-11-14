<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div style="background-color: #0277BD; margin-top: -30px; color: white; padding: 20px 200px; align: right; margin-bottom: 20px;">
	<h5 style="display:inline;">|&nbsp;&nbsp;&nbsp;<b>결제 완료 >> 랜덤상품 확인</b>&nbsp;&nbsp;&nbsp;|</h5>
	<p id ="goShopping" style="display:inline; padding: 8px 15px; border: solid 1px white; font-size: 13px; margin-top: -6px;" class="pull-right">
		랜덤박스 쇼핑 바로가기
	</p>
</div>
<div class="container">
	<div>
		<div align="center" class="alert alert-success">
		    <strong>[ 주문완료 ]</strong>&nbsp;&nbsp;${orderDTO.userId} 님의 주문이 안전하게 처리되었습니다.<br>
		    	주문정보는 마이페이지에서도 확인 하실 수 있습니다. 감사합니다.
		</div>
		<table class="table" style="font-size: 12px;">		
			<tr>
				<td ><b>[ 상품 및 배송정보 ]</b></td>
			</tr>
			<tr>
				<td style="padding-left: 15%;">
					<table class="table" class="table" style="width: 80%">
						<tr>
							<td width="100"><strong>주문 상품</strong></td>
							<td width="250" colspan="2"><strong>랜덤배정상품</strong></td>
							<td  width="100"><strong>상품구매가</strong></td>
						</tr>
						<c:set var="totalPrice" value="0"></c:set>
						<c:forEach var="oList" items="${orderList }" varStatus="status" >
						<tr>
							<td align="center">
								<img src="../images/goods/${oList.gImage }" border="0" align="center"
										width="80" />
							</td>
							<td colspan="2">
								<span class="a_default">${oList.gName}</span>
							</td>
							<td align="center">
								<span>${oList.gPrice}</span>원
								<c:set var="totalPrice" value="${totalPrice + oList.gPrice}"></c:set>
							</td>
						</tr>
						</c:forEach>
						<tr>
							<td  align="right"  colspan="3"><b>총 결제 금액 :</b></td>
							<td  align='right' style="padding-right: 20px;"><b>${totalPrice} 원</b></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 15%;">
					<table class="table" class="table" style="width: 80%">
						<tr>
							<td width="150"> 받으시는 분</td>
							<td  > ${orderList[0].orderName}</td>
						</tr>
						<tr>
							<td  > 주소</td>
							<td  > (${orderList[0].post1}-${orderList[0].post2})<br>
								${orderList[0].addr1} ${orderList[0].addr2}
							</td>
						</tr>
						
						<tr>
							<td  > 휴대전화</td>
							<td  > ${orderList[0].phone}</td>
						</tr>
					</table>
			</tr>
			<tr>
				<td ><b>[ 결제정보 ]</b></td>
			</tr>
			<tr>
				<td style="padding-left: 15%;">
					<table class="table" class="table" style="width: 80%; align-content: center;">
						<tr>
							<td  width="150" ><b>총 결제금액</b></td>
							<td><b>${totalPrice}</b> &nbsp;원</td>
						</tr>
						<tr>
							<td  width="150" > 결제수단</td>
							<td><span>${orderList[0].payMethod}</span></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td  align="center">
					<button class="btn btn-outline-secondary" id="goOrderInfo">주문조회 페이지로 이동</button>
				</td>
			</tr>
		</table>
    </div>
    </div>
    <script>

	/* 쇼핑 바로가기 */
	$("#goShopping").on("click", function() {
		$(location).attr("href", "goodsList");
	});
	
	/* 주문조회 페이지로 이동 */
	$("#goOrderInfo").on("click", function() {
		$(location).attr("href", "orderinfo");
	});
</script>