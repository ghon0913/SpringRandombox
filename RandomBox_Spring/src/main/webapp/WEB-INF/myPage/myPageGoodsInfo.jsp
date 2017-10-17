<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">	
<table border="1">


<tr>
<td colspan="10">
<form action="goodsinfo.do">
<select name="searchName">
	<option value="gCode">상품코드</option>
	</select>
	<input type="text" name="searchValue">
	<input type="submit" value="검색"> 
	
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
	<td><a href="QuestionListServlet?gCode=${goods.gCode}">답변하러가기</a>
	</td>
</tr>

</c:forEach>

<tr>
	<td  colspan="10"><jsp:include page="myPageGoodsInfoPage.jsp"></jsp:include>
</tr>
</c:if>
<tr>
<td colspan="10" align="right"> <a href="GoodsRegisterFormServlet">상품등록</a>
</tr>



</table>
</div>

