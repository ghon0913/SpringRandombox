<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="background-color: #0277BD; margin-top: -30px; color: white; padding: 20px 200px; align: right; margin-bottom: 20px;">
	<h5 style="display:inline;">|&nbsp;&nbsp;&nbsp;<b>마이페이지 >> 고객 문의사항</b>&nbsp;&nbsp;&nbsp;|</h5>
</div>
<div class="container">
	<div>
	<button class="btn btn-outline-secondary pull-right" id="goGoodsList">등록 상품 목록</button><br><br><br>
	<table class="table table-hover" style="font-size: 12px;">
	<thead>
		<tr>
			<th style="text-align: center;" width="70">글번호</th>
			<th style="text-align: center;" width="110">카테고리</th>
			<th style="text-align: center;">제목</th>
			<th style="text-align: center;" width="90">작성일</th>
			<th style="text-align: center;" width="80">작성자</th>
			<th style="text-align: center;" width="70">조회수</th>
			<th style="text-align: center;" width="90">처리상태</th>
		</tr>
	</thead>
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
					<td style="text-align: center;">${bList.num }</td>
					<td style="text-align: center;">${bList.category }</td>
					<td style="padding-left: 30px">
						<a href="answerForm?num=${bList.num }">${bList.title }</a>
					</td>
					<td style="text-align: center;">${bList.writeDay }</td>
					<td style="text-align: center;">${bList.userId }</td>
					<td style="text-align: center;">${bList.readCnt }</td>
					<td style="text-align: center;">${bList.state }</td>
				</tr>
			</c:forEach>
		<tfoot>
			<tr>
				<td align="center" colspan="7">
					<c:set var="boardChk" value="qna"/>
					<jsp:include page="boardPage.jsp" flush="true">
						<jsp:param name="boardChk" value="${boardChk }" />
					</jsp:include>
				</td>
			</tr>
		</tfoot>
		</c:if>
	</table>
</div>
</div>
<script>
	$("#goGoodsList").on("click", function(){
		window.history.back();
	});
</script>