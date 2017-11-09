<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- Nav tabs -->
<ul class="nav nav-tabs nav-justified">
	<li class="nav-item"><a class="nav-link active" data-toggle="tab"
		href="#panel1" role="tab">랜덤박스</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab"
		href="#panel2" role="tab">상품설명</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab"
		href="#panel3" role="tab">상품후기</a></li>
</ul>
<!-- Tab panels -->
<div class="tab-content card">
	<!--Panel 1-->
	<div class="tab-pane fade in show active" id="panel1" role="tabpanel"
		align="center">
		<br> <img src="images/items/basicImage.png" border="0"
			width="200" data-toggle="tooltip" data-placement="top"
			title="상품구성: <c:forEach var="list16" items="${isCategory}" varStatus="status">${list16.gName}<c:if test="${status.index!=15}">, </c:if></c:forEach>">
		<p style="font-size: 20px; font-style: italic">(상품에 커서를 올리면 구성품을
			보여드립니다.)</p>
		<br>

		<p style="font-size: 100px; font-style: italic">${randomGoods.gPrice}원
			!!!</p>
		<br> <br>
		<table border="1">

		</table>
		<a href="goodsMixList"><input type="button" value="새로 구성하기"
			class="btn btn-primary" /></a> <input type="button" id="cartAdd"
			value="장바구니 넣기" class="btn btn-primary" /> <input type="button"
			id="orderAdd" value="주문하기" class="btn btn-primary" />
	</div>
	<!--/.Panel 1-->
	<!--Panel 2-->
	<div class="tab-pane fade" id="panel2" role="tabpanel" align="center">
		<br>
		<table>
			<c:forEach var="list16" items="${sessionScope.goodsList16}" varStatus="status">
				<tr>
					<td><table><tr><td align="center"><p style="font-size:50px ">상품${status.index+1}:${list16.gName}</p></td></tr>
					<tr><td><img src="/upload/${list16.gContentImage}"></td></tr>
					</table></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!--/.Panel 2-->
	<!--Panel 3-->
	<div class="tab-pane fade" id="panel3" role="tabpanel" align="center">
		<br>
		<table>
		</table>
	</div>
	<!--/.Panel 3-->
</div>



<form id="randomGoodsForm" modelAttribute="randomGoodsForm">
	<input type="hidden" name="gCode" value="${randomGoods.gCode }">
	<input type="hidden" name="userId"
		value="${sessionScope.login.userid }"> <input type="hidden"
		name="gName" value="${randomGoods.gName }"> <input
		type="hidden" name="gPrice" value="${randomGoods.gPrice }"> <input
		type="hidden" name="gImage" value="${randomGoods.gImage }"> <input
		type="hidden" name="sellerId" value="${randomGoods.sellerId }">
	<input type="hidden" name="gCategory" value="전체 카테고리">
</form>


<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script>


	$(window).on("load",function(){
		if(${empty sessionScope.goodsList16}){
			$(location).attr("href", "goodsList");
		}
	});
	
	/* 장바구니 넣기 */
	$("#cartAdd").on("click", function(){

			$("#randomGoodsForm").attr("action", "loginchk/cartAdd");
			$("#randomGoodsForm").submit();
	});
	
	/* 바로 주문하기 */
	$("#orderAdd").on("click", function(){
		
			$("#randomGoodsForm").attr("action", "loginchk/orderAdd");
			$("#randomGoodsForm").submit();		
	});
	
	

</script>