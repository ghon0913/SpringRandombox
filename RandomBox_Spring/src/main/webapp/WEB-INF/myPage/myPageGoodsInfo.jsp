<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8;"%>

<div class="container">	
	<div class="row">
		<div class="form-inline">
			<form action="goodssearchpage">
				<select class="form-control" name="perPage" id="perPage">
					<option>목록 보기 설정</option>
					<option value="3">3개씩보기</option>
					<option value="5">5개씩보기</option>
					<option value="7">7개씩보기</option>
				</select>
				<span style="padding-left: 220px;">
					<select class="form-control" name="searchName">
						<option value="gCode">상품코드</option>
					</select>
					<input class="form-control" type="text" name="searchValue">
					<input type="submit" class="btn btn-success" value="검색">
				</span>
			</form>
		</div>
	</div>
	<br>
		<table class="table" style="font-size: 12px;">
			<c:if test="${empty pagedto.glist }">
				<tr>
					<td colspan="10" align="center"> 레코드가없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${! empty pagedto.glist }">
				<tr align="center">
					<td><b>상품코드</b></td>
					<td><b>상품명</b></td>
					<td><b>카테고리</b></td>
					<td><b>가격</b></td>
					<td><b>Q&A</b></td>
				</tr>
			<c:forEach var="goods" items="${pagedto.glist }">
			<tr>
				<td align="center">${goods.gCode }
				</td>
				<td><img src="${goods.gImage }">&nbsp;${goods.gName }
				</td>
				<td align="center">${goods.gCategory }
				</td>
				<td align="center">${goods.gPrice }
				</td>
				<td align="center"><a href="questionList?gCode=${goods.gCode}">답변하러가기</a>
				</td>
			</tr>
			
			</c:forEach>
			
			<tr>
				<td  colspan="10" align="center"><jsp:include page="myPageGoodsInfoPage.jsp"></jsp:include>
			</tr>
			</c:if>
		</table>
		<div class="pull-right">
			<button class="btn btn-outline-info btn-block" id="goodsRegisterForm">상품등록</button>
		</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		
		/* perPage */
		$("#perPage").on("change", function(){
			var perPage = $("#perPage :selected").val();
			$(location).attr("href", "goodsperpage?perPage="+perPage);
		});
		
		/* 상품등록 */
		$("#goodsRegisterForm").on("click", function(){
			$(location).attr("href", "goodsRegisterForm");
		});
	});
</script>

