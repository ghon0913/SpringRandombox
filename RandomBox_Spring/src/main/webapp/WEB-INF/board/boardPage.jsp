<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set var="board" value="${boardList}"></c:set>
<c:set var="totalNum" value="${board.totalCount / board.perPage}"></c:set>
<c:if test="${(board.totalCount % board.perPage) != 0}">
	<c:set var="totalNum" value="${totalNum}"></c:set>
</c:if>

<!-- totalnum 소수부분 올림 처리하기 -->
<fmt:formatNumber var="totalNum" value="${totalNum+(1-(totalNum%1))%1}"
	type="number" maxFractionDigits="0" />
	
<c:if test="${totalNum==1}">
1
</c:if>
<c:if test="${totalNum>=2 }">
<c:forEach begin="1" end="${totalNum}" varStatus="status">
       <c:if test="${board.curPage == status.index}">
              ${status.index}&nbsp;
       </c:if>
       <c:if test="${board.curPage != status.index}">
       		<c:if test="${param.boardChk == 'review'}">
              <a href="reviewList?curPage=${status.index}">${status.index}</a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'inquiry'}">
              <a href="inquiryList?curPage=${status.index}">${status.index}</a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'qna'}">
              <a href="qnaList?curPage=${status.index}">${status.index}</a>
              &nbsp;
            </c:if>
       </c:if>
</c:forEach>
</c:if>
