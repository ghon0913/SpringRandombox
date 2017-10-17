<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>|&nbsp;&nbsp;&nbsp;상품 후기&nbsp;&nbsp;&nbsp;|</h3>
			<br>
			<div class="col-md-3">
				<select class="form-control" id="searchCategory"
					name="searchCategory" style="font-size: 12px;">
					<option>카테고리별로 보기</option>
					<option value="category1">category1</option>
					<option value="category2">category2</option>
					<option value="category3">category3</option>
					<option value="category4">category4</option>
				</select>
			</div>
			<br>

			<table class="table table-hover">
				<tr>
					<th>글번호</th>
					<th>카테고리</th>
					<th width="250">제목</th>
					<th>작성일</th>
					<th width="80">작성자</th>
					<th>조회수</th>
				</tr>
				<!-- ----------------------------------------------------------------리스트 목록 없을 때 -------------------------------->
				<c:if test="${ boardList.getList().size() == 0 }">
					<tr>
						<td colspan="6" align="center">해당하는 후기가 없습니다.</td>
					</tr>
				</c:if>
				<!-- ----------------------------------------------------------------리스트 목록 보여주기 -------------------------------->
				<c:if test="${ boardList.getList().size() != 0 }">
					<c:forEach var="rList" items="${ boardList.getList()}">
						<tr>
							<td>${rList.num }</td>
							<td>${rList.category }</td>
							<td style="padding-left: 30px"><a
								href="ReviewRetrieveServlet?num=${rList.num }">${rList.title }</a></td>
							<td>${rList.writeDay }</td>
							<td align="center">${rList.userId }</td>
							<td>${rList.readCnt }</td>
						</tr>
					</c:forEach>
					<tr>
						<td align="center" colspan="7"><jsp:include
								page="boardPage.jsp" flush="true"></jsp:include></td>
					</tr>
				</c:if>
			</table>
			<form action="ReviewListServlet">
				<div class="row" align="center">
					<div class="col-xs-3">
						<select class="form-control" id="searchName" name="searchName"
							style="font-size: 12px;">
							<option value="title">제목으로 검색</option>
							<option value="content">내용으로 검색</option>
						</select>
					</div>
					&nbsp;&nbsp;&nbsp;
					<div class="col-xs-4">
						<input class="form-control" type="text" id="searchWord"
							name="searchWord">
					</div>
					&nbsp;&nbsp;&nbsp;
					<div class="col-xs-3">
						<input class="btn btn-success" type="submit" value="검색">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script>
	$(document).ready(
			function() {

				/* 카테고리별로 보기 */
				$("#searchCategory").on(
						"change",
						function() {
							var searchCategory = $("option:selected").val();
							$(location).attr(
									"href",
									"ReviewListServlet?searchCategory="
											+ searchCategory);
						});

			});
</script>