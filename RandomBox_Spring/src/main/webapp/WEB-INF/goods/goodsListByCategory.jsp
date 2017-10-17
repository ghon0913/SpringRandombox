<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<table width="100%" cellspacing="0" cellpadding="0">
	<tr height="10" />
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border=1>

				<tr height="30">
					<td align="center"><a href="home.jsp">구매페이지</a></td>
					<td align="center"><a href="GoodsRetrieveByCategoryServlet?category=${gCategory}">상품설명</a></td>
					<td align="center"><a href="GoodsReviewListServlet?searchCategory=${gCategory}">후기</a></td>
				</tr>
				<tr>

					<td colspan="4" align="center">
						<table style='padding: 15px' align="center">

							<tr>
								<td><a href=""> <img src="images/items/basicImage.png"
										border="0" align="center" width="200">
								</a></td>
								<td>
									<form id="randomGoodsForm">
										<input type="hidden" name="gCode" value="${randomGoods.gCode }">
										<input type="hidden" name="userId" value="${sessionScope.login.userid }">
										<input type="hidden" name="gName" value="${randomGoods.gName }">
										<input type="hidden" name="gPrice" value="${randomGoods.gPrice }">
										<input type="hidden" name="gImage" value="${randomGoods.gImage }">
										<input type="hidden" name="gCategory" value="${randomGoods.gCategory }">
										<input type="hidden" name="sellerId" value="${randomGoods.sellerId }">
									</form>
								</td>
							</tr>

						</table>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						카테고리 구성품(총16개의 상품)<br>
						<c:forEach var="list16" items="${isCategory}">
							${list16.gName} &nbsp;
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<a href="GoodsMixListByCategoryServlet?category=${gCategory}"><input type="button" value="새로 구성하기"/></a>
						<input type="button" id="cartAdd" value="장바구니 넣기"/>
						<input type="button" id="orderAdd" value="주문하기"/>
					</td>
				</tr>

				<tr height="10" />
			</table>
	<tr height="10" />
</table>
<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script>
	
	/* 장바구니 넣기 */
	$("#cartAdd").on("click", function(){
		
		if(${empty sessionScope.login}){
			alert("로그인이 필요한 서비스입니다.");
			$(location).attr("href", "LoginFormServlet");
		}else{
			$("#randomGoodsForm").attr("action", "CartAddServlet");
			$("#randomGoodsForm").submit();
		}
	});
	
	/* 바로 주문하기 */
	$("#orderAdd").on("click", function(){
		
		if(${empty sessionScope.login}){
			alert("로그인이 필요한 서비스입니다.");
			$(location).attr("href", "LoginFormServlet");
		}else{
			$("#randomGoodsForm").attr("action", "OrderAddServlet");
			$("#randomGoodsForm").submit();
		}
		
	});

</script>