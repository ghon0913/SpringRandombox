<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-11">
	<h3>주문 페이지</h3>

	<FORM name="orderConfirmForm" method="get" action="">
		<table width="80%" cellspacing="0" cellpadding="0">
			<input type="hidden" name="gCode" value="${cDTO.gCode }">
			<input type="hidden" name="gName" value="${cDTO.gName }">
			<input type="hidden" name="userId" value="${mDTO.userid }">
			<input type="hidden" name="eMail" value="${mDTO.email }">
			<input type="hidden" name="num" value="${cDTO.num }">
			<input type="hidden" name="gPrice" value="${cDTO.gPrice }">
			

			<tr>
				<td height="30">
			</tr>

			<tr>
				<td><b>주문상품 확인</b></td>
			</tr>

			<tr>
				<td height="15">
			</tr>

			<tr>
				<td>
					<hr size="1" color="CCCCCC">
				</td>
			</tr>

			<tr>
				<td height="5">
			</tr>

			<tr>
				<td>
					<table width="100%" cellspacing="0" cellpadding="0">
						<tr>
							<td class="td_default" align="center"><strong>주문번호</strong></td>
							<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
							<td class="td_default" align="center"><strong>판매가</strong></td>
						</tr>
						<tr>
							<td colspan="4">
								<hr size="1" color="CCCCCC">
							</td>
						</tr>
						<tr>
							<td class="td_default" width="80">${cDTO.num }</td>
							<td class="td_default" width="80"><img
								src="images/goods/${cDTO.gImage }" border="0" align="center"
								width="80" /></td>
							<td class="td_default" width="300" style='padding-left: 30px'>${cDTO.gName }</td>
							<td class="td_default" align="center" width="110">${cDTO.gPrice }
								원</td>
						</tr>
						<tr>
							<td colspan="4">
								<hr size="1" color="CCCCCC">
							</td>
						</tr>
						<tr>
							<td height="30" colspan="2"></td>
							<td class="td_default" align="right">결제 금액 :</td>
							<td class="td_default" align='right'>${cDTO.gPrice}원</td>
						</tr>
					</table>
			<tr>
				<td>
					<hr size="1" color="CCCCCC">
				</td>
			</tr>


			<!--  고객 정보 시작-->
			<tr>
				<td height="30">
			</tr>

			<tr>
				<td><b>고객 정보</b></td>
			</tr>

			<tr>
				<td height="15">
			</tr>
			<tr>
				<td>
					<table width="100%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse: collapse" bordercolor="#CCCCCC">
						<tr>
							<td width="125" height="35" class="td_default">이 름</td>
							<td height="35" class="td_default"><input
								class="input_default" type="text" id="mname" size="20"
								maxlength="20" value="${mDTO.username }" readonly="readonly"></input></td>
						</tr>
						<tr>
							<td height="35" class="td_default">주 소</td>
							<td height="35" class="td_default"><input
								class="input_default" type="text" id="mpost1" size="4"
								maxlength="3" value="${mDTO.post1 }" readonly="readonly"></input>-
								<input class="input_default" type="text" id="mpost2" size="4"
								maxlength="3" value="${mDTO.post2 }" readonly="readonly"></input><br>
							<input
								class="input_default" type="text" id="maddress1" size="40"
								maxlength="200" value="${mDTO.addr1 }" readonly="readonly"></input> <br> <span
								style="line-height: 10%;"><br></span> 
								<input class="input_default" type="text" id="maddress2"
								size="40" maxlength="200" value="${mDTO.addr2 }"
								readonly="readonly"></input></td>
						</tr>
						<tr>
							<td height="35" class="td_default">휴대전화</td>
							<c:set var="phone" value="${mDTO.phone}" />
							<td height="35" class="td_default"><input
								class="input_default" type="text" id="mphone" size="15"
								maxlength="15"
								value="${fn:substring(phone, 0, 3)}-${fn:substring(phone, 3, 7)}-${fn:substring(phone, 7, -1)}"></input>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<!--  고객 정보 끝-->
			<tr>
				<td height="30">
			</tr>

			<tr>
				<td class="td_default"><input type="checkbox" name="same"
					onclick="javascript:sameAddress(this);"> 배송지가 동일할 경우 선택하세요.
				</td>
			</tr>
			<!--  배송지 정보 시작-->
			<tr>
				<td height="30">
			</tr>

			<tr>
				<td><b>배송지 정보</b></td>
			</tr>

			<tr>
				<td height="15">
			</tr>


			<tr>
				<td>
					<table width="100%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse: collapse" bordercolor="#CCCCCC">
						<tr>
							<td width="125" height="35" class="td_default">이 름</td>
							<td height="35" class="td_default"><input
								class="input_default" type="text" id="orderName"
								name="orderName" size="20" maxlength="20" value=""></input></td>
						</tr>
						<tr>
							<td height="35" class="td_default">주 소</td>
							<td height="35" class="td_default">
								<!-- 다음주소 시작--> <input name="post1" id="post1" size="5"
								readonly=""> - <input name="post2" id="post2" size="5"
								readonly=""> <input onclick="openDaumPostcode()"
								type="button" value="우편번호찾기"> <br> <input
								name="addr1" id="addr1" size="40" readonly=""
								placeholder="도로명주소"> <br> <span
								style="line-height: 10%;"><br></span> <input name="addr2"
								id="addr2" size="40" placeholder="지번주소"> <!-- 다음주소 끝 -->
							</td>
						</tr>

						<tr>
							<td height="35" class="td_default">휴대전화</td>
							<td height="35" class="td_default"><input
								class="input_default" type="text" id="phone" name="phone"
								size="15" maxlength="15" value=""></input></td>
						</tr>
					</table>
				</td>
			</tr>
			<!--  배송지 정보 끝-->

			<tr>
				<td height="30">
			</tr>
			<tr>
				<td><b>결제수단</b></td>
			</tr>

			<tr>
				<td height="15">
			</tr>
			<tr>
				<td>
					<table width="100%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse: collapse" bordercolor="#CCCCCC">
						<tr>
							<td width="125" height="35" class="td_default"><input
								type="radio" name="payMethod" value="신용카드" checked>신용카드</input>
								<input type="radio" name="payMethod" value="계좌이체">계좌이체</input> <input
								type="radio" name="payMethod" value="무통장입금">무통장 입금</input></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="30">
			</tr>


			<tr>
				<td class="td_default" align="center"><input type='button'
					value='취소' onclick="javascript:history.back()"> <input
					type='button' value='결제하기' onclick="orderDone(orderConfirmForm)"></td>
			</tr>

		</table>
	</FORM>
</div></div></div>
<script>
	function sameAddress(chk) {

		if (chk.checked) {
			document.getElementById("orderName").value = document
					.getElementById("mname").value;
			document.getElementById("post1").value = document
					.getElementById("mpost1").value;
			document.getElementById("post2").value = document
					.getElementById("mpost2").value;
			document.getElementById("addr1").value = document
					.getElementById("maddress1").value;
			document.getElementById("addr2").value = document
					.getElementById("maddress2").value;
			document.getElementById("phone").value = document
					.getElementById("mphone").value;
		} else {
			document.getElementById("orderName").value = "";
			document.getElementById("post1").value = "";
			document.getElementById("post2").value = "";
			document.getElementById("addr1").value = "";
			document.getElementById("addr2").value = "";
			document.getElementById("phone").value = "";
		}

	}

	function orderDone(f) {
		f.action = "OrderDoneServlet";
		f.submit();
	}
</script>
