<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<c:set var="board" value="${boardList}"></c:set>
<c:set var="totalNum" value="${board.totalCount / board.perPage}"></c:set>
<c:if test="${(board.totalCount % board.perPage) != 0}">
	<c:set var="totalNum" value="${totalNum +1}"></c:set>
</c:if>
<c:if test="${totalNum==1}">
1
</c:if>
<c:if test="${totalNum>=2 }">
<c:forEach begin="1" end="${totalNum}" varStatus="status">
       <c:if test="${board.curPage == status.index}">
              ${status.index}&nbsp;
       </c:if>
       <c:if test="${board.curPage != status.index}">
              <a href="InquiryListServlet?curPage=${status.index}">${status.index}</a>
              &nbsp;
       </c:if>
</c:forEach>
</c:if>
