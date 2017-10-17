<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<h3>|&nbsp;&nbsp;&nbsp;답변하기&nbsp;&nbsp;&nbsp;|</h3><br>
	<table class="table">
		<tr>
			<th width="90">글번호</th>
			<th width="110">카테고리</th>
			<th width="250">제목</th>
			<th>작성일</th>
			<th width="100">작성자</th>
			<th width="100">조회수</th>
			<th width="120">처리상태</th>
		</tr>
<!-- ----------------------------------------------------------------리스트 목록 없을 때 -------------------------------->
		<c:if test="${ boardList.getList().size() == 0 }">
			<tr>
				<td colspan="7" align="center">
					해당하는 글 목록이 없습니다.
				</td>
			</tr>
		</c:if>
<!-- ----------------------------------------------------------------리스트 목록 보여주기 -------------------------------->
		<c:if test="${ boardList.getList().size() != 0 }">
			<c:forEach var="bList" items="${ boardList.getList()}">
				<tr>
					<td>${bList.num }</td>
					<td>${bList.category }</td>
					<td style="padding-left: 30px">
							<a href="AnswerFormServlet?num=${bList.num }">${bList.title }</a>
					</td>
					<td>${bList.writeDay }</td>
					<td align="center">${bList.userId }</td>
					<td>${bList.readCnt }</td>
					<td>${bList.state }</td>
				</tr>
			</c:forEach>
			<tr>
				<td align="center" colspan="7">
					<jsp:include page="boardPage.jsp" flush="true"></jsp:include>
				</td>
			</tr>
		</c:if>
	</table>
</div></div></div>