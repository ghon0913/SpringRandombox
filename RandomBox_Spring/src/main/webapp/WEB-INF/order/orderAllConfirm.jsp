<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../js/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->

<div style="background-color: #0277BD; margin-top: -30px; color: white; padding: 20px 200px; align: right; margin-bottom: 20px;">
	<h5 style="display:inline;">|&nbsp;&nbsp;&nbsp;<b>상품 결제</b>&nbsp;&nbsp;&nbsp;|</h5>
	<p id ="goShopping" style="display:inline; padding: 8px 15px; border: solid 1px white; font-size: 13px; margin-top: -6px;" class="pull-right">
		랜덤박스 쇼핑 바로가기
	</p>
</div>
<div class="container">
	<div>
		<p style="font-size: 12px">주문상품과 배송정보를  확인 후 결제해주세요.</p><br>
	</div>
	<form name="orderConfirmForm" method="post" id="orderConfirmForm">
		<table class="table" style="font-size: 12px;">
			<tr>
				<td><b>[ 상품정보 ]</b></td>
				<input type="hidden" name="eMail" value="${mDTO.email }">
				<input type="hidden" name="userId" value="${mDTO.userid }">
			</tr>
			<tr>
				<td style="padding-left: 15%;">
					<table class="table"  style="font-size: 12px; width: 80%;">
						<tr>
							<td align="center"><strong>주문번호</strong></td>
							<td align="center" colspan="2"><strong>상품정보</strong></td>
							<td align="center"><strong>판매가</strong></td>
						</tr>
						<c:set var="totalPrice" value="0"></c:set>
						<c:forEach var="oList" items="${orderList}">
							<input type="hidden" name="gCode" value="${oList.gCode }">
							<input type="hidden" name="gName" value="${oList.gName }">
							<input type="hidden" name="num" value="${oList.num }">
							<input type="hidden" name="gPrice" value="${oList.gPrice }">
							<input type="hidden" name="sellerId" value="${oList.sellerId }">
							<c:set var="totalPrice" value="${totalPrice + oList.gPrice}"></c:set>
						<tr>
							<td  width="80" align="center">${oList.num }</td>
							<td  width="80">
								<img src="../images/items/basicImage.png" border="0" align="center" width="60" />
							</td>
							<td  width="300" style='padding-left: 30px'>${oList.gName }</td>
							<td  align="center" width="110">${oList.gPrice } 원</td>
						</tr>
						</c:forEach>
						<tr>
							<td></td>
							<td></td>
							<td  align="right"><b>총 결제 금액 :</b></td>
							<td  align='right' style="font-size: 15px; padding-right: 30px;"><b>${totalPrice} 원</b></td>
						</tr>
					</table>

			<!--  고객 정보 시작-->
			<tr height="35">
				<td><b>[ 회원정보 ]</b></td>
			</tr>
			<tr>
				<td style=" padding-left: 15%;">
					<table class="table" style="font-size: 12px; width: 80%;">
						<tr>
							<td width="125">이 름</td>
							<td>
								<input class="form-control" type="text" id="mname" size="20"
								maxlength="20" value="${mDTO.username }" readonly="readonly"></input>
							</td>
						</tr>
						<tr>
							<td >주 소</td>
							<td >
								<div class="form-inline">
									<input class="form-control" type="text" id="mpost1" size="4"
									maxlength="3" value="${mDTO.post1 }" readonly="readonly"></input>
									&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
									<input class="form-control" type="text" id="mpost2" size="4"
									maxlength="3" value="${mDTO.post2 }" readonly="readonly"></input>
								</div><br>
							<input
								class="form-control" type="text" id="maddress1" size="40"
								maxlength="200" value="${mDTO.addr1 }" readonly="readonly"></input> <br>
								<input class="form-control" type="text" id="maddress2"
								size="40" maxlength="200" value="${mDTO.addr2 }"
								readonly="readonly"></input></td>
						</tr>
						<tr>
							<td>휴대전화</td>
							<c:set var="phone" value="${mDTO.phone}" />
							<td>
								<input class="form-control" type="text" id="mphone" size="15" maxlength="15" readonly="readonly"
								value="${fn:substring(phone, 0, 3)}-${fn:substring(phone, 3, 7)}-${fn:substring(phone, 7, -1)}"></input>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<!--  고객 정보 끝-->
			<tr height="70px">
				<td style="padding-left: 15%; padding-top: 27px;">
					<input type="checkbox" name="same" id="sameAddress">&nbsp;&nbsp;&nbsp;배송지가 동일할 경우 선택하세요.
				</td>
			</tr>
			<!--  배송지 정보 시작-->
			<tr height="35" >
				<td><b>[ 배송지 정보 ]</b></td>
			</tr>
			<tr>
				<td style=" padding-left: 15%;">
					<table class="table" style="font-size: 12px; width: 80%">
						<tr>
							<td width="125">이 름</td>
							<td><input
								class="form-control" type="text" id="orderName"
								name="orderName" size="20" maxlength="20" value=""></input></td>
						</tr>
						<tr>
							<td>주 소</td>
							<td>
								<div class="form-inline">
									<input class="form-control" name="post1" id="post1" size="5" readonly="">
									&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
									<input class="form-control" name="post2" id="post2" size="5" readonly=""> 
									&nbsp;&nbsp;&nbsp;
									<input class="btn btn-secondary" onclick="openDaumPostcode()"
									type="button" value="우편번호찾기">
								</div> <br>
									<input class="form-control" name="addr1" id="addr1" size="40" readonly=""
									placeholder="도로명주소"> <br>
									<input class="form-control" name="addr2"
									id="addr2" size="40" placeholder="지번주소">
							</td>
						</tr>

						<tr>
							<td>휴대전화</td>
							<td>
								<input class="form-control" type="text" id="phone" name="phone"
								size="15" maxlength="15" value=""></input>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<!--  배송지 정보 끝-->

			<tr height="35" >
				<td><b>[ 결제수단 ]</b></td>
			</tr>
			<tr>
				<td style=" padding-left: 15%;">
					<table width="80%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse: collapse" bordercolor="#CCCCCC">
						<tr>
							<td width="125" height="35" align="center"><input
								type="radio" name="payMethod" value="신용카드" checked>&nbsp;신용카드</input>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="payMethod" value="계좌이체">&nbsp;계좌이체</input>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="payMethod" value="무통장입금">&nbsp;무통장 입금</input></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="30">
			</tr>
			
			<tr>
				<td  align="center">
					<input class="btn btn-outline-secondary" type='button' value='취소' onclick="javascript:history.back()">
					<input class="btn btn-success" type='button' value='결제하기' id="orderAllDone"></td>
			</tr>

		</table>
	</FORM>
</div>
<script>

	/* 쇼핑 바로가기 */
	$("#goShopping").on("click", function() {
		$(location).attr("href", "goodsList");
	});

	$("#sameAddress").on("change", function(){
		 if($("#sameAddress").prop("checked")){
			$("#orderName").val($("#mname").val());
			$("#post1").val($("#mpost1").val());
			$("#post2").val($("#mpost2").val());
			$("#addr1").val($("#maddress1").val());
			$("#addr2").val($("#maddress2").val());
			$("#phone").val($("#mphone").val());	
		}else{
			$("#orderName").val("");
			$("#post1").val("");
			$("#post2").val("");
			$("#addr1").val("");
			$("#addr2").val("");
			$("#phone").val("");	
		} 
	});
	
	$("#orderAllDone").on("click", function(){

		$("#orderConfirmForm").attr("action", "orderAllDone");
		$("#orderConfirmForm").submit();
	});
	
	$("#orderConfirmForm").on("submit", function(e){
		if($("#orderName").val().length == 0){
			alert("배송 받으실 분의 이름을 입력해주세요!");
			e.preventDefault();
		} else if($("#post1").val().length == 0){
			alert("배송 주소를 확인해주세요!");
			e.preventDefault();
		} else if($("#addr2").val().length == 0){
			alert("배송 주소를 확인해주세요!");
			e.preventDefault();
		} else if($("#phone").val().length == 0){
			alert("배송 받으실 분의 전화번호를 입력해주세요!");
			e.preventDefault();
		}
	});

</script>
