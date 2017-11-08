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
<div align="center">
			<b>[ 주문완료 ]</b><br><br>
			<b>주문해주셔서 감사합니다.</b><br>
			<b>${orderDTO.userId}</b> 님의 주문이 안전하게 처리되었습니다.
</div><br><br>
<table >
	<tr>
		<td class="td_default"><b>상품 및 배송정보</b>
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>
	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35"> 받으시는 분</td>
					<td class="td_default" height="35"> ${orderDTO.orderName}</td>
				</tr>
				<tr>
					<td class="td_default" height="35"> 주소</td>
					<td class="td_default" height="35"> (${orderDTO.post1}-${orderDTO.post2})<br>
						${orderDTO.addr1} ${orderDTO.addr2}
					</td>
				</tr>
				
				<tr>
					<td class="td_default" height="35"> 휴대전화</td>
					<td class="td_default" height="35"> ${orderDTO.phone}</td>
				</tr>
			</table>
	</tr>
	</td>

	<tr>
		<td height="20">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td width="100" class="td_default" height="35" align="center"><strong>주문 상품</strong></td>
					<td width="250" class="td_default" height="35" align="center"><strong>랜덤 배정 상품</strong></td>
					<td class="td_default" width="100" height="35" align="center"><strong>판매가</strong></td>
				</tr>
				<tr>
					<td height="35" class="td_default" align="center">
						<img src="../images/goods/${orderDTO.gImage }" border="0" align="center"
								width="80" />
					</td>
					<td height="35" class="td_default">
						<span class="a_default">${orderDTO.gName}</span>
					</td>
					<td height="35" class="td_default" align="center">
						<span>${orderDTO.gPrice}</span>원
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default"><b>결제정보</b></td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35"> 결제금액</td>
					<td class="td_default" height="35" align = 'right'> 
					<input type = 'text' id = 'gPrice' value = '${orderDTO.gPrice}' readonly>원
					</td>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35"> 결제수단</td>
					<td class="td_default" height="35" align = 'right'> 
					<span>${orderDTO.payMethod}</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>
	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default" align="center">
			<button class="btn btn-outline-secondary" id="goOrderInfo">주문조회 페이지로 이동</button>
		</td>
	</tr>
	<tr>
		<td height="30">
	</tr>

</table>
    </div></div>
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