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
	<div class="tab-pane fade in show active" id="panel1" role="tabpanel">
		<br>
		<p>
			구성품(총16개의 상품)<br>
			<c:forEach var="list16" items="${sessionScope.goodsList16}">
							${list16.gName} &nbsp;
						</c:forEach>
		</p>

		<a href="goodsMixList"><input type="button" value="새로 구성하기" /></a> <input
			type="button" id="cartAdd" value="장바구니 넣기" /> <input type="button"
			id="orderAdd" value="주문하기" />
	</div>
	<!--/.Panel 1-->
	<!--Panel 2-->
	<div class="tab-pane fade" id="panel2" role="tabpanel">
		<br>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil
			odit magnam minima, soluta doloribus reiciendis molestiae placeat
			unde eos molestias. Quisquam aperiam, pariatur. Tempora, placeat
			ratione porro voluptate odit minima.</p>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil
			odit magnam minima, soluta doloribus reiciendis molestiae placeat
			unde eos molestias. Quisquam aperiam, pariatur. Tempora, placeat
			ratione porro voluptate odit minima.</p>
	</div>
	<!--/.Panel 2-->
	<!--Panel 3-->
	<div class="tab-pane fade" id="panel3" role="tabpanel">
		<br>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil
			odit magnam minima, soluta doloribus reiciendis molestiae placeat
			unde eos molestias. Quisquam aperiam, pariatur. Tempora, placeat
			ratione porro voluptate odit minima.</p>
	</div>
	<!--/.Panel 3-->
</div>


<table width="100%" cellspacing="0" cellpadding="0">
	<tr height="10" />

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border=1>

				<tr height="30">
					<td align="center"><a href="home.jsp">구매페이지</a></td>
					<td align="center"><a href="goodsRetrieve">상품설명</a></td>
					<td align="center"><a href="goodsReviewList">후기</a></td>
				</tr>
				<tr>

					<td colspan="3" align="center">
						<table style='padding: 15px'>

							<tr>
								<td><a href=""> <img src="images/items/basicImage.png"
										border="0" width="200">
								</a></td>
								<td>
									<form id="randomGoodsForm" modelAttribute="randomGoodsForm">
										<input type="hidden" name="gCode"
											value="${randomGoods.gCode }"> <input type="hidden"
											name="userId" value="${sessionScope.login.userid }">
										<input type="hidden" name="gName"
											value="${randomGoods.gName }"> <input type="hidden"
											name="gPrice" value="${randomGoods.gPrice }"> <input
											type="hidden" name="gImage" value="${randomGoods.gImage }">
										<input type="hidden" name="sellerId"
											value="${randomGoods.sellerId }"> <input
											type="hidden" name="gCategory" value="전체 카테고리">
									</form>
								</td>
							</tr>

						</table>
					</td>
				</tr>
				<tr>
					<td colspan="3">구성품(총16개의 상품)<br> <c:forEach var="list16"
							items="${sessionScope.goodsList16}">
							${list16.gName} &nbsp;
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><a href="goodsMixList"><input
							type="button" value="새로 구성하기" /></a> <input type="button"
						id="cartAdd" value="장바구니 넣기" /> <input type="button"
						id="orderAdd" value="주문하기" /></td>
				</tr>

				<tr height="10" />
			</table>
	<tr height="10" />
</table>

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