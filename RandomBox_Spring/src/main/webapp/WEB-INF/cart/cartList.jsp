<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-11">
	<h3>|&nbsp;&nbsp;&nbsp;나의 장바구니&nbsp;&nbsp;&nbsp;|</h3><br>
	<table width="70%" cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td height="30">
	</tr>
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="7">
	</tr>
		<tr>
			<td class="td_default" align="center" width="100"><input type="checkbox"
				name="allCheck" id="allCheck"> <strong>전체선택</strong></td>
			<td class="td_default" align="center" width="100"><strong>주문번호</strong></td>
			<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
			<td class="td_default" align="center"><strong>판매가</strong></td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td height="7">
		</tr>
		
		<c:if test="${fn:length(cartList)==0}">
			<tr>
				<td colspan="10">
					<hr size="1" color="CCCCCC">
				</td>
			</tr>

			<tr>
				<td height="5">
			</tr>
			<tr>
				<td class="td_default" align="center" colspan="7">카트에 추가된 상품이 없습니다.</td>
			</tr>
		</c:if>
		
<!--cartList---------------------------------------------------------------------------------------------------------->

		<c:if test="${fn:length(cartList)!=0}">
			<tr>
				<td colspan="10">
					<hr size="1" color="CCCCCC">
				</td>
			</tr>
		<form name="cartListForm" id="cartListForm">
			<c:forEach var="xxx" items="${cartList}">
				<input type="hidden" name="num${xxx.num}" value="${xxx.num}"
					id="num${xxx.num}">
				<input type="hidden" name="gImage${xxx.num}" value="${xxx.gImage}"
					id="gImage${xxx.num}">
				<input type="hidden" name="gName${xxx.num}" value="${xxx.gName}"
					id="gName${xxx.num}">
				<input type="hidden" name="gPrice${xxx.num}" value="${xxx.gPrice}"
					id="gPrice${xxx.num}">
				<input type="hidden" name="userid" value="${xxx.userId}"
					id="userid">
				<input type="hidden" name="sellerId" value="${xxx.sellerId}"
					id="sellerId">
				<tr>
					<td class="td_default" width="80">
						<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. -->
						<input
						type="checkbox" name="check" id="check${xxx.num}" class="check"
						value="${xxx.num}">
					</td>
					<td class="td_default" width="80" id="num">${xxx.num}</td>
					<td class="td_default" width="80"><img
						src="images/goods/${xxx.gImage}" border="0" align="center"
						width="80" /></td>
					<td class="td_default" width="300" style='padding-left: 30px'>${xxx.gName}</td>
					<td class="td_default" align="center" width="110"><fmt:formatNumber
							value="${xxx.gPrice}" type="currency" /></td>
					<td class="td_default" align="center" width="30"
						style='padding-left: 10px'><input type="button" value="주문"
						id="order"></td>
					<td class="td_default" align="center" width="30"
						style='padding-left: 10px'><input type="button" value="삭제"
						id="delCart"></td>
					<td height="10"></td>
				</tr>
			</c:forEach>
		</form>
		
<!--end cartList------------------------------------------------------------------------------------------------------>
		
			<tr>
				<td colspan="10">
					<hr size="1" color="CCCCCC">
				</td>
			</tr>
			<tr>
				<td height="30">
			</tr>

			<tr>
				<td align="center" colspan="5"><a class="a_black"
					href="#" id="orderAllConfirm"> 전체 주문하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="a_black" id="delAllCart" href="#"> 전체
						삭제하기 </a>&nbsp;&nbsp;&nbsp;&nbsp; <a class="a_black" href="start.jsp">
						계속 쇼핑하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td height="20">
			</tr>
		</c:if>
			<tr>
				<td colspan="10">
					<hr size="1" color="CCCCCC">
				</td>
			</tr>
	</table>
</div></div></div>

<!--script cartList------------------------------------------------------------------------------------------------------>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

	$("#delCart").on("click", function(){
		$(location).attr("href", "CartDelServlet?num="+$("#num").text());
	})
	
	$("#allCheck").on("change", function(event){
			var chk = $(".check");

 	 		$.each(chk, function(idx, ele){
 	 			ele.checked = event.target.checked;
 	 		})

	});
	
	$("#delAllCart").on("click", function(event){
/* 		$("#cartListForm").attr("action", "CartDelAllServlet");
		$("#cartListForm").submit(); */
		
		var chk = $(".check");
		var count = 0;
		
	 	$.each(chk, function(idx, ele){
	 		var xxx = ele.checked;
			if(xxx =="true"){
				count++;
			}
 	 	});
		console.log(count);
/* 		if(){
			
		}else{
			
		} */
	});
	
	$("#order").on("click", function(){
		$(location).attr("href", "OrderConfirmServlet?num="+$("#num").text()+"&userid="+$("#userid").val());
	});
	
	$("#orderAllConfirm").on("click", function(){
		$("#cartListForm").attr("action", "OrderAllConfirmServlet");
		$("#cartListForm").submit();
	});

</script>