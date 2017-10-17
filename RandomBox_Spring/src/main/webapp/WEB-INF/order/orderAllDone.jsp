<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-11">
<table width="70%" cellspacing="0" cellpadding="0">
	<tr>
		<td height="30">
	</tr>
	<tr>
		<td><b>주문완료</b></td>
	</tr>
	<tr>
		<td height="30">
	</tr>
	<tr>
		<td align="center"><b>주문해주셔서 감사합니다.</b></td>
	</tr>

	<tr>
		<td height="7">
	</tr>
	<tr>
		<td class="td_default" align="center">
		<b>${sessionScope.login.username}</b> 님의 주문이
			안전하게 처리되었습니다.</td>
	</tr>
	<tr>
		<td height="40">
	</tr>

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
					<td class="td_default" height="35"> ${orderList[0].orderName}</td>
				</tr>
				<tr>
					<td class="td_default" height="35"> 주소</td>
					<td class="td_default" height="35"> (${orderList[0].post1}-${orderList[0].post2})<br>
						${orderList[0].addr1} ${orderList[0].addr2}
					</td>
				</tr>
				
				<tr>
					<td class="td_default" height="35"> 휴대전화</td>
					<td class="td_default" height="35"> ${orderList[0].phone}</td>
				</tr>
			</table>
	</tr>
	<tr>
		<td height="20">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td width="100" class="td_default" height="35" align="center"><strong>주문 상품</strong></td>
					<td width="250" class="td_default" height="35" align="center" colspan="2"><strong>상품명</strong></td>
					<td class="td_default" width="100" height="35" align="center"><strong>판매가</strong></td>
				</tr>
				<c:set var="totalPrice" value="0"></c:set>
				<c:forEach var="oList" items="${orderList }" varStatus="status" >
				<tr>
					<td height="35" class="td_default" align="center">
						<img src="images/goods/${oList.gImage }" border="0" align="center"
								width="80" />
					</td>
					<td height="35" class="td_default" colspan="2">
						<span class="a_default">${oList.gName}</span>
					</td>
					<td height="35" class="td_default" align="center">
						<span>${oList.gPrice}</span>원
						<c:set var="totalPrice" value="${totalPrice + oList.gPrice}"></c:set>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td class="td_default" align="right" height="35" colspan="3">총 결제 금액 :</td>
					<td class="td_default" align='right'>${totalPrice} 원</td>
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
					<td class="td_default" width="150" height="35"> 총 결제금액</td>
					<td class="td_default" height="35" align = 'right'> 
					<input type = 'text' id = 'gPrice' value = '${totalPrice}' readonly>원
					</td>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35"> 결제수단</td>
					<td class="td_default" height="35" align = 'right'> 
					<span>${orderList[0].payMethod}</span>
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
		<td class="td_default" align="center"><a class="a_default"
			href="orderinfopage.do">주문조회 페이지로 이동</a></td>
	</tr>
	<tr>
		<td height="30">
	</tr>

</table>
    </div></div></div>