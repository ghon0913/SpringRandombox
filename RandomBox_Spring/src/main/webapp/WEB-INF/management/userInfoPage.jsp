<%@page import="java.util.HashMap"%>
<%@page import="java.io.Console"%>
<%@page import="com.dto.MyPageBoardPageDTO"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set var="curPage" value="${pagedto.curPage}" />
<c:set var="perCount" value="${pagedto.getPerCount()}" />
<c:set var="totalPage" value="${pagedto.getTotalPage() }" />
<c:set var="totalNum" value="${totalPage/perCount }" />
<fmt:formatNumber var="totalNum" value="${totalNum}" type="number"
	maxFractionDigits="0" />
<c:set var="searchName" value="${param.searchName }" />
<c:set var="searchValue" value="${param.searchValue }" />
<c:set var="orderStandard" value="${param.orderStandard }" />

<!-- 보여줄 페이지번호 개수 -->
<c:set var="perBlock" value="${pagedto.getPerBlock() }" />


<!-- 현재페이지번호의 블럭번호 -->
<fmt:formatNumber value="${curPage/perBlock}" pattern="0.0" var="N" />
<fmt:formatNumber var="block" value="${N+(1-(N%1))%1}" />
<fmt:formatNumber var="curBlock" value="${block}" type="number"
	maxFractionDigits="0" />

<!-- 시작페이지번호 -->
<c:set var="startPage" value="${(curBlock -1)* perBlock+1 }" />
<!-- 마지막페이지번호 -->
<c:set var="endPage" value="${startPage+perBlock-1 }" />
<c:if test="${endPage>totalNum }">
	<c:set var="endPage" value="${totalNum }" />
</c:if>

<!-- 번호출력하기 -->
<c:if test="${endPage <= 1 }">
1
</c:if>
<c:if test="${endPage > 1 }">
	<!-- 첫패이지로이동 -->
	<c:if test="${curPage == 1}">
	처음
	</c:if>
	<c:if test="${curPage != 1 }">
		<a
			href="userInfoPage.admin?curPage=1&searchName=${searchName }&searchValue=${searchValue }&orderStandard=${orderStandard}">
			처음 </a>
	</c:if> &nbsp;

<!-- 이전페이지블럭 -->
	<c:if test="${ startPage ==1}">
	&lt;&lt;
</c:if>
	<c:if test="${ startPage!=1}">
		<a
			href="userInfoPage.admin?curPage=${startPage-1}&searchName=${searchName}&searchValue=${searchValue}&orderStandard=${orderStandard}">
			&lt;&lt; </a>
	</c:if> &nbsp;

<!-- 이전페이지로 이동 -->
	<c:if test="${curPage==1}">
	&lt;
</c:if>
	<c:if test="${curPage!=1}">
		<a
			href="userInfoPage.admin?curPage=${curPage-1 }&searchName=${searchName}&searchValue=${searchValue}&orderStandard=${orderStandard}">
			&lt; </a>
	</c:if> &nbsp;
<!-- 블럭당 표시할 페이지번호들 -->

	<c:forEach begin="${startPage }" end="${endPage-1}" varStatus="status">
		<c:if test="${curPage==status.index }">
			${status.index }
		</c:if>
		<c:if test="${curPage!=status.index }">
			<a
				href="userInfoPage.admin?curPage=${status.index }&searchName=${searchName }&searchValue=${searchValue}&orderStandard=${orderStandard}">
				${status.index } </a>
		</c:if> &nbsp;
</c:forEach>


	<c:if test="${curPage==endPage }">
	${endPage }
</c:if>
	<c:if test="${curPage!=endPage }">
		<a
			href="userInfoPage.admin?curPage=${endPage }&searchName=${searchName}&searchValue=${searchValue}&orderStandard=${orderStandard}">
			${endPage } </a>
	</c:if>

	<!-- 다음페이지로 이동 -->
	<c:if test="${curPage==totalNum}">
	&gt;
</c:if>
	<c:if test="${curPage!=totalNum}">
		<a
			href="userInfoPage.admin?curPage=${curPage+1 }&searchName=${searchName}&searchValue=${searchValue}&orderStandard=${orderStandard}">
			&gt; </a>
	</c:if> &nbsp;

<!-- 다음페이지블럭 -->
	<c:if test="${endPage==totalNum}">
	&gt;&gt;
</c:if>
	<c:if test="${endPage!=totalNum}">
		<a
			href="userInfoPage.admin?curPage=${ endPage+1}&searchName=${searchName}&searchValue=${searchValue}&orderStandard=${orderStandard}">
			&gt;&gt; </a>
	</c:if> &nbsp;

<!-- 마지막페이지로이동 -->
	<c:if test="${curPage ==totalNum}">
	마지막
</c:if>
	<c:if test="${curPage !=totalNum}">
		<a
			href="userInfoPage.admin?curPage=${endPage+1 }&searchName=${searchName }&searchValue=${searchValue }&orderStandard=${orderStandard}">
			마지막 </a>
	</c:if> &nbsp;
</c:if>
