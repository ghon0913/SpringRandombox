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
						<tr align="center">
							<td width="100"><strong>주문 상품</strong></td>
							<td width="250"><strong>랜덤 배정 상품</strong></td>
							<td  width="100"><strong>판매가</strong></td>
						</tr>
						<tr>
							<td align="center">
								<img src="/upload/${orderDTO.gImage }" border="0" align="center" width="80" />
							</td>
							<td>
								<span>${orderDTO.gName}</span>
							</td>
							<td align="center">
								<span>${orderDTO.gPrice}</span>원
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 15%;">
					<table class="table" style="width: 80%">
						<tr>
							<td width="150"><strong> 받으시는 분</strong></td>
							<td> ${orderDTO.orderName}</td>
						</tr>
						<tr>
							<td><strong> 주소</strong></td>
							<td> (${orderDTO.post1}-${orderDTO.post2})<br>
								${orderDTO.addr1} ${orderDTO.addr2}
							</td>
						</tr>
						
						<tr>
							<td> <strong>휴대전화</strong></td>
							<td> ${orderDTO.phone}</td>
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
							<td width="150"><strong> 결제금액</strong></td>
							<td> <b>${orderDTO.gPrice}</b>&nbsp; 원</td>
						</tr>
						<tr>
							<td  width="150" ><strong> 결제수단</strong></td>
							<td><span>${orderDTO.payMethod}</span></td>
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