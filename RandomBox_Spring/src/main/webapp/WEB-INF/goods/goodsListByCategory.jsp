<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%
	String randomGoodsByCategory = "randomGoodsBy"+(String)request.getAttribute("gCategory");
	String listByCategory = "listBy"+(String)request.getAttribute("gCategory");
	GoodsDTO randomGoods = (GoodsDTO) session.getAttribute(randomGoodsByCategory);
	List<GoodsDTO> list = (List<GoodsDTO>) session.getAttribute(listByCategory);
	
%>
<!-- Nav tabs -->
<ul class="nav nav-tabs nav-justified">
	<li class="nav-item"><a class="nav-link active" data-toggle="tab"
		href="#panel1" role="tab">랜덤박스</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab"
		href="#panel2" role="tab">상품설명</a></li>
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
	
		<p style="font-size: 100px; font-style: italic"><%=randomGoods.getgPrice()%>원</p>
		<br> <br>
		<table border="1">

		</table>
		<input type="button" value="새로 구성하기"
			class="btn btn-primary mixGoods" /> <input type="button" id="cartAdd"
			value="장바구니 넣기" class="btn btn-primary" /> <input type="button"
			id="orderAdd" value="주문하기" class="btn btn-primary" />
	</div>
	<!--/.Panel 1-->
	<!--Panel 2-->
	<div class="tab-pane fade" id="panel2" role="tabpanel" align="center">
		<br>
		<table>
			<c:forEach var="list16" items="<%=list %>" varStatus="status">
				<tr>
					<td align="center"><table><tr><td align="center"><p style="font-size: 50px">상품${status.index+1}</p><br><p style="font-size: 20px">${list16.gName}</p></td></tr>
					<tr><td align="center"><img src="/upload/${list16.gContentImage}"></td></tr>
					</table></td>
				</tr>
				
			</c:forEach>
		</table>
	</div>
	<!--/.Panel 2-->
</div>



<form id="randomGoodsForm" modelAttribute="randomGoodsForm">
	<input type="hidden" name="gCode" value="<%=randomGoods.getgCode()%>">
	<input type="hidden" name="userId"
		value="${sessionScope.login.userid }"> <input type="hidden"
		name="gName" value="<%=randomGoods.getgName()%>"> <input
		type="hidden" name="gPrice" value="<%=randomGoods.getgPrice()%>"> <input
		type="hidden" name="gImage" value="<%=randomGoods.getgImage()%>"> <input
		type="hidden" name="sellerId" value="<%=randomGoods.getSellerId()%>">
	<input type="hidden" name="gCategory" value="전체 카테고리">
</form>


<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script>

	
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
	
	$(document).ready(function() {

		/* 상품변환  */
		$(".mixGoods").on("click", function() {
			

			$.ajax({
				url : "goodsMixListByCategory?category=${gCategory}",
				method : "get",
				success : function(responseData, status, xhr) {
					
					location.reload();
					
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			}); // end ajax

		});

	});

</script>