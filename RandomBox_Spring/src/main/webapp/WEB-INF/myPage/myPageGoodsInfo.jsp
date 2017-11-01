<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" class="container">	
<div class="row">
<table class="table">


<tr>
<td colspan="10">
<form action="goodssearchpage">
<select class="form-control"name="searchName">
	<option value="gCode">상품코드</option>
	</select>
	<input type="text" name="searchValue">
	<input type="submit" class="btn btn-success" value="검색"> 
	
</form>	
</td>
</tr>
<tr>

			<td colspan="10" class="table table-hover">
				<form action="goodsperpage">
					<select name="perPage">
						<!-- change함수주기 -->
						<option value="3">3개씩보기</option>
						<option value="5">5개씩보기</option>
						<option value="7">7개씩보기</option>
					</select> <input class="btn btn-success" type="submit">
				</form>
			</td>

		</tr>

<c:if test="${empty pagedto.glist }">
<tr>
	<td colspan="10"	> 레코드가없습니다.</td>
</tr>
</c:if>
<c:if test="${! empty pagedto.glist }">

<tr>
	<td>상품코드</td>
	<td>상품명</td>
	<td>카테고리</td>
	<td>가격</td>
	<td>Q&A</td>
</tr>

<c:forEach var="goods" items="${pagedto.glist }">
<tr>
	<td> <a href="goodsinforetrieve.do?gCode=${goods.gCode }" id="gCode">${goods.gCode }</a>
	</td>
	<td>${goods.gImage }${goods.gName }
	</td>
	<td>${goods.gCategory }
	</td>
	<td>${goods.gPrice }
	</td>
	<td><a href="questionList?gCode=${goods.gCode}">답변하러가기</a>
	</td>
</tr>

</c:forEach>

<tr>
	<td  colspan="10" align="center"><jsp:include page="myPageGoodsInfoPage.jsp"></jsp:include>
</tr>
</c:if>
<tr>
<td colspan="10" align="right"> <a href="goodsRegisterForm">상품등록</a>
</tr>



</table>
</div>
</div>

