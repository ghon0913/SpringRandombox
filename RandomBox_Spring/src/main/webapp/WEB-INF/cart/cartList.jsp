<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
	<h5>|&nbsp;&nbsp;&nbsp;나의 장바구니&nbsp;&nbsp;&nbsp;|</h5><br>
	<table class="table table-hover" style="font-size: 12px;">
		<thead>
		<tr>
			<th width="120px"><input type="checkbox" name="allCheck" id="allCheck">&nbsp;&nbsp;<strong>전체선택</strong></th>
			<th width="90px"><strong>주문번호</strong></th>
			<th colspan="2"><strong>상품정보</strong></th>
			<th><strong>판매가</strong></th>
			<th colspan="2"></th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${fn:length(cartList)==0}">
			<tr>
				<td align="center" colspan="7" style="padding-top: 30px; padding-bottom: 30px;">카트에 추가된 상품이 없습니다.</td>
			</tr>
			</tbody>
			</table>
			<hr>
			<div align="center"><input id="goShopping" class="btn btn-success" type="button" value="계속 쇼핑하기"></div>
		</c:if>
		
<!--cartList---------------------------------------------------------------------------------------------------------->

		<c:if test="${fn:length(cartList)!=0}">

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
				<tr id="tr${xxx.num}">
					<td align="center">
						<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. -->
						<input type="checkbox" name="check" id="check${xxx.num}" class="check"
						value="${xxx.num}">
					</td>
					<td  width="80" id="num">${xxx.num}</td>
					<td  width="80"><img
						src="images/goods/${xxx.gImage}" border="0" align="center"
						width="80" /></td>
					<td  width="300" style='padding-left: 30px; padding-top: 30px;'>${xxx.gName}</td>
					<td  align="center" width="110"><fmt:formatNumber
							value="${xxx.gPrice}" type="currency" /></td>
					<td style='padding-left: 5px'><button style="font-size: 12px;" class="btn btn-outline-success btn-sm" type="button"
						id="order">주문</button></td>
					<td style='padding-left: 5px'><button style="font-size: 12px;" class="btn btn-outline-secondary btn-sm delCart" type="button"
						id="delCart" data-num="${xxx.num}">삭제</button></td>
				</tr>
			</c:forEach>
		</form>
		
<!--end cartList------------------------------------------------------------------------------------------------------>
	
		</tbody>
		</table>
			<hr>
			<div align="center">
				  <button type="button" class="btn btn-success" id="orderAllConfirm">전체 주문하기</button>
				  <button type="button" class="btn btn-outline-secondary" id="delAllCart">전체삭제하기</button>
				  <button type="button" class="btn btn-outline-secondary" id="goShopping">계속 쇼핑하기 </button>
			</div>
			
		</c:if>
		
	

</div></div></div>

<!--script cartList------------------------------------------------------------------------------------------------------>

<script>

	/* 장바구니 개별 삭제  */
	$(".delCart").on("click", function() {
		
		var num = $(this).attr("data-num");
		/*$(location).attr("href", "cartDelete?num="+num); */
	
		$.ajax({
			url : "cartDelete",
			method : "get",
			dataType : "text",
			data : {
				num : num
			},
			success : function(responseData, status, xhr) {
				$("#tr"+num).remove();
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		}); // end ajax
		
	});
	
	$("#goShopping").on("click", function(){
		$(location).attr("href", "goodsList");
	});
	
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
		$(location).attr("href", "orderConfirm?num="+$("#num").text()+"&userid="+$("#userid").val());
	});
	
	$("#orderAllConfirm").on("click", function(){
		$("#cartListForm").attr("action", "orderAllConfirm");
		$("#cartListForm").submit();
	});

</script>