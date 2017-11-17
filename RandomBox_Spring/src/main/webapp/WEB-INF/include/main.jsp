<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: -24px;">
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner" role="listbox">
			    <div class="carousel-item active">
			      <img class="d-block img-fluid" src="images/main1.jpg" alt="First slide" width="100%">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block img-fluid" src="images/main2.jpg" alt="Second slide" width="100%">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block img-fluid" src="images/main3.jpg" alt="Third slide" width="100%">
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
			
			<div class="row" style="margin-top: 15px;">
				<div class="col-md-5">
					<div style="border: solid 5px; border-color: #388E3C; padding: 8px; background-color: #F1F8E9;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="fa fa-quote-left" aria-hidden="true" style="color: #1B5E20;"></span>
						&nbsp;<b>인기후기글</b>&nbsp;
						<span class="fa fa-quote-right" aria-hidden="true" style="color: #1B5E20;"></span>
						<hr>
						<ul style="list-style: none; font-size: 12px; padding-left: 20px; padding-right: 25px;">
								<c:forEach var="review" items="${reviewList}">
									<li>[${review.category}]&nbsp;&nbsp;<a href="reviewRetrieve?num=${review.num }">${review.title}</a></li>
								</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-4" style="padding-left: 5px; padding-right: 5px;">
					<div style="border: solid 5px; border-color: #388E3C; padding: 8px; background-color: #F1F8E9;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="fa fa-quote-left" aria-hidden="true" style="color: #1B5E20;"></span>
						&nbsp;<b>최근 등록된 상품</b>&nbsp;
						<span class="fa fa-quote-right" aria-hidden="true" style="color: #1B5E20;"></span>
						<hr>
						<ul style="list-style: none; font-size: 12px; padding-left: 20px; padding-right: 25px;">
							<c:forEach var="goods" items="${goodsList}">
								<c:set var="searchBar" value="${fn:substring(goods.gName,0,3)}"></c:set>
								<li>[${goods.gCategory}]&nbsp;&nbsp;<a href="/app/goodsBySearch?searchBar=${searchBar}">${goods.gName}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div id="question" align="center" style="padding: 25% 0%; background-color: #388E3C; color: white;">
						<span class="fa fa-quote-left" aria-hidden="true"></span>
						<b>자주하는 질문</b>
						<span class="fa fa-quote-right" aria-hidden="true"></span>
						<br>
						<span style="font-size: 12px;">[바로가기]</span>
					</div>
				</div>
			</div>
</div>
<script>
	$(window).on("load",function(){
		if(${empty reviewList || empty goodsList}){
			$(location).attr("href", "mainList");
		}
	});
	
	$("#question").on("click", function(){
		$(location).attr("href", "inquiryMain");
	});
</script>
