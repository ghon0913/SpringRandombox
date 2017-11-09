<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="background-color: #0277BD; margin-top: -30px; color: white; padding: 20px 200px; align: right; margin-bottom: 20px;">
	<h5 style="display:inline;">|&nbsp;&nbsp;&nbsp;<b>랜덤박스 후기 작성</b>&nbsp;&nbsp;&nbsp;|</h5>
	<p id ="goShopping" style="display:inline; padding: 8px 15px; border: solid 1px white; font-size: 13px; margin-top: -6px;" class="pull-right">
		랜덤박스 쇼핑 바로가기
	</p>
</div>
<div class="container">
	<div>
	<form id="reviewForm" action="reviewWrite" method="post" modelAttribute="reviewForm">
		<table class="table">
			<input type="hidden" name="userid" value="${sessionScope.login.userid }">
			<tr>
				<td width="200px">작성자 : </td>
				<td>${sessionScope.login.userid }</td>
				<input type="hidden" name="userId" value="${sessionScope.login.userid }">
			</tr>
			<tr>
				<td>구매 카테고리 : </td>
				<td>${GoodsDTO.gCategory }</td>
				<input type="hidden" name="category" value="${GoodsDTO.gCategory }">
			</tr>
			<tr>
				<td>랜덤 배송 상품 :</td>
				<td>${GoodsDTO.gName }</td>
				<input type="hidden" name="gName" value="${GoodsDTO.gName }">
				<input type="hidden" name="gCode" value="${GoodsDTO.gCode }">
			</tr>
			<tr>
				<td>제목 :</td>
				<td><input class="form-control" type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<td>후기 내용 :</td>
				<td><textarea class="form-control" rows="8" cols="30" name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input class="btn btn-success" type="submit" value="후기작성">&nbsp;
					<input class="btn btn-outline-secondary" type="reset" value="다시작성">&nbsp;
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
<script>
$(document).ready(function(){
	
	/* 쇼핑 바로가기 */
	$("#goShopping").on("click", function() {
		$(location).attr("href", "../goodsList");
	});
	
	/* 입력사항 확인  */
	$("#reviewForm").on("submit", function(e){
		
		if($("#title").val().length==0){
			alert("제목을 입력해 주세요!");
			e.preventDefault();
		}else if($("#content").val().length==0){
			alert("내용을 입력해 주세요!");
			e.preventDefault();
		}
	});
});

</script>