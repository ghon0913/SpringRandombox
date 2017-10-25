<%@page import="java.util.HashMap"%>
<%@page import="java.io.Console"%>
<%@page import="com.dto.MyPageBoardPageDTO"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 현재페이지 -->
<c:set var="curPage" value="${pagedto.curPage}" />

<!-- 한페이지당 행개수 -->
<c:set var="perPage" value="${pagedto.getPerPage()}" />

<!-- 전체 행 개수 -->
<c:set var="totalPage" value="${pagedto.getTotalPage() }" />

<!-- 전체행개수/페이지당행개수 -->
<c:set var="totalNum" value="${totalPage/perPage}" />
<!-- totalnum 소수부분 올림 처리하기 -->
<fmt:formatNumber var="totalNum" value="${totalNum+(1-(totalNum%1))%1}"
	type="number" maxFractionDigits="0" />

<!-- 기간별조회 파라미터받기 -->
<c:set var="startdate" value="${pagedto.getStartdate()}" />
<c:set var="finaldate" value="${pagedto.getFinaldate()}" />

<!-- 보여줄 페이지 개수 -->
<c:set var="perBlock" value="${pagedto.getPerBlock()}" />


<!-- 현재페이지/보여줄페이지개수 -->
<fmt:formatNumber value="${curPage/perBlock}" pattern="0.0" var="N" />
<fmt:formatNumber var="block" value="${N+(1-(N%1))%1}" />
<fmt:formatNumber var="curBlock" value="${block}" type="number"
	maxFractionDigits="0" />

<!-- 페이지 시작번호 -->
<c:set var="startPage" value="${(curBlock -1)* perBlock+1 }" />
<!-- 페이지 마지막번호-->
<c:set var="endPage" value="${startPage+perBlock-1}" />
<!-- --- -1추가 -->
<c:if test="${endPage>totalNum }">
	<c:set var="endPage" value="${totalNum}" />
</c:if>

<!-- 번호출력하기 -->
<c:if test="${endPage <= 1 }">
1
</c:if>
<c:if test="${endPage > 1}">


	<!-- 첫패이지로이동 -->
	<c:if test="${curPage == 1}">
	처음
</c:if>
	<c:if test="${curPage != 1}">
		<a
			href="orderinfo?curPage=1&startdate=${startdate}&finaldate=${finaldate}">
			처음 </a>
	</c:if> &nbsp;

<!-- 이전페이지블럭 -->
	<c:if test="${startPage ==1}">
	&lt;&lt;
</c:if>
	<c:if test="${startPage!=1}">
		<a
			href="orderinfo?curPage=${startPage-1}&startdate=${startdate}&finaldate=${finaldate}">
			&lt;&lt; </a>
	</c:if> &nbsp;

<!-- 이전페이지로 이동 -->
	<c:if test="${curPage==1}">
	&lt;
</c:if>
	<c:if test="${curPage!=1}">
		<a
			href="orderinfo?curPage=${curPage-1}&startdate=${startdate}&finaldate=${finaldate}">
			&lt; </a>
	</c:if> &nbsp;

<!-- 블럭당 표시할 페이지번호들 -->
	<c:forEach begin="${startPage}" end="${endPage-1}" varStatus="status">
		<c:if test="${curPage==status.index}">
	${status.index}
</c:if>
		<c:if test="${curPage!=status.index}">
			<a
				href="orderinfo?curPage=${status.index}&startdate=${startdate}&finaldate=${finaldate}">
				${status.index} </a>
		</c:if> &nbsp;
</c:forEach>

	<c:if test="${curPage==endPage}">
	${endPage}
</c:if>
	<c:if test="${curPage!=endPage}">
		<a
			href="orderinfo?curPage=${endPage}&startdate=${startdate}&finaldate=${finaldate}">
			${endPage} </a>
	</c:if>

	<!-- 다음페이지로 이동 -->
	<c:if test="${curPage==totalNum}">
	&gt;
</c:if>
	<c:if test="${curPage!=totalNum}">
		<a
			href="orderinfo?curPage=${curPage+1}&startdate=${startdate}&finaldate=${finaldate}">
			&gt; </a>
	</c:if> &nbsp;

<!-- 다음페이지블럭 -->
	<c:if test="${endPage==totalNum}">
	&gt;&gt;
</c:if>
	<c:if test="${endPage!=totalNum}">
		<a
			href="orderinfo?curPage=${endPage+1}&startdate=${startdate}&finaldate=${finaldate}">
			&gt;&gt; </a>
	</c:if> &nbsp;

<!-- 마지막페이지로이동 -->
	<c:if test="${curPage ==totalNum}">
	마지막
</c:if>
	<c:if test="${curPage !=totalNum}">
		<a
			href="orderinfo?curPage=${endPage+1}&startdate=${startdate}&finaldate=${finaldate}">
			마지막 </a>
	</c:if>
</c:if>
&nbsp;
