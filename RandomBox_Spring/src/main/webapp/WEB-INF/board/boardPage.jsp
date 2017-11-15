<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set var="board" value="${boardList}"></c:set>

<!-- 첫페이지로 이동 -->
<c:if test="${board.curPage == 1}">
	[처음]&nbsp;
</c:if>
       <c:if test="${board.curPage != 1}">
       		<c:if test="${param.boardChk == 'review'}">
              <a href="reviewList?curPage=1&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	[처음]
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'inquiry'}">
              <a href="inquiryList?curPage=1&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	[처음]
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'qna'}">
              <a href="qnaList?curPage=1&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	[처음]
              </a>
              &nbsp;
            </c:if>
		</c:if>
<%-- <c:if test="${board.curPage != 1}">
	<a href="inquiryList?curPage=1&searchName=${board.searchName}&searchValue=${board.searchName}">[처음]&nbsp;</a>
</c:if> --%>
	
<!-- 이전블럭으로 이동 -->
<c:if test="${startPage == 1}">
	&lt;&lt;&nbsp;
</c:if>
       <c:if test="${startPage != 1}">
       		<c:if test="${param.boardChk == 'review'}">
              <a href="reviewList?curPage=${startPage-1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&lt;&lt;
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'inquiry'}">
              <a href="inquiryList?curPage=${startPage-1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&lt;&lt;
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'qna'}">
              <a href="qnaList?curPage=${startPage-1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&lt;&lt;
              </a>
              &nbsp;
            </c:if>
		</c:if>
<%-- <c:if test="${startPage != 1}">
	<a href="inquiryList?curPage=${startPage-1}&searchName=${board.searchName}&searchValue=${board.searchName}">&lt;&lt;&nbsp;</a>
</c:if> --%>

<!-- 이전 페이지로 이동 -->
<c:if test="${board.curPage==1}">
	&lt;&nbsp;
</c:if>
       <c:if test="${board.curPage != 1}">
       		<c:if test="${param.boardChk == 'review'}">
              <a href="reviewList?curPage=${board.curPage-1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&lt;
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'inquiry'}">
              <a href="inquiryList?curPage=${board.curPage-1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&lt;
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'qna'}">
              <a href="qnaList?curPage=${board.curPage-1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&lt;
              </a>
              &nbsp;
            </c:if>
		</c:if>
<%-- <c:if test="${board.curPage!=1}">
	<a href="inquiryList?curPage=${board.curPage-1}&searchName=${board.searchName}&searchValue=${board.searchName}">&lt;&nbsp;</a>
</c:if> --%>

<!-- 페이지 번호들 -->
<c:forEach begin="${startPage}" end="${endPage}" varStatus="status">
       <c:if test="${board.curPage == status.index}">
              ${status.index}&nbsp;
       </c:if>
       <c:if test="${board.curPage != status.index}">
       		<c:if test="${param.boardChk == 'review'}">
              <a href="reviewList?curPage=${status.index}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	${status.index}
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'inquiry'}">
              <a href="inquiryList?curPage=${status.index}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	${status.index}
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'qna'}">
              <a href="qnaList?curPage=${status.index}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	${status.index}
              </a>
              &nbsp;
            </c:if>
       </c:if>
</c:forEach>

<!-- 다음 페이지로 이동 -->
<c:if test="${board.curPage == totalNum}">
	&gt;&nbsp;
</c:if>
<c:if test="${board.curPage != totalNum}">
			<c:if test="${param.boardChk == 'review'}">
              <a href="reviewList?curPage=${board.curPage+1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&gt;
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'inquiry'}">
              <a href="inquiryList?curPage=${board.curPage+1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&gt;
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'qna'}">
              <a href="qnaList?curPage=${board.curPage+1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&gt;
              </a>
              &nbsp;
            </c:if>
	<%-- <a href="inquiryList?curPage=${board.curPage+1}&searchName=${board.searchName}&searchValue=${board.searchName}">&gt;&nbsp;</a> --%>
</c:if>

<!-- 다음 페이지 블럭으로 이동 -->
<c:if test="${curBlock == endBlock}">
	&gt;&gt;&nbsp;
</c:if>
<c:if test="${curBlock != endBlock}">
			<c:if test="${param.boardChk == 'review'}">
              <a href="reviewList?curPage=${endPage+1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&gt;&gt;
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'inquiry'}">
              <a href="inquiryList?curPage=${endPage+1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&gt;&gt;
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'qna'}">
              <a href="qnaList?curPage=${endPage+1}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	&gt;&gt;
              </a>
              &nbsp;
            </c:if>
	<%-- <a href="inquiryList?curPage=${endPage+1}&searchName=${board.searchName}&searchValue=${board.searchName}">&gt;&gt;&nbsp;</a> --%>
</c:if>

<!-- 마지막 페이지로 바로 이동 -->
<c:if test="${board.curPage == totalNum}">
	[마지막]&nbsp;
</c:if>
<c:if test="${board.curPage != totalNum}">
			<c:if test="${param.boardChk == 'review'}">
              <a href="reviewList?curPage=${totalNum}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	[마지막]
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'inquiry'}">
              <a href="inquiryList?curPage=${totalNum}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	[마지막]
              </a>
              &nbsp;
            </c:if>
            <c:if test="${param.boardChk == 'qna'}">
              <a href="qnaList?curPage=${totalNum}&searchName=${board.searchName}&searchValue=${board.searchValue}">
              	[마지막]
              </a>
              &nbsp;
            </c:if>
	<%-- <a href="inquiryList?curPage=${totalNum}&searchName=${board.searchName}&searchValue=${board.searchName}">[마지막]</a> --%>
</c:if>
