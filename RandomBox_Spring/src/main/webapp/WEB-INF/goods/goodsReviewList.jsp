<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<table width="100%" cellspacing="0" cellpadding="0">
	<tr height="10" />
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border=1>

				<tr height="30">
					<td align="center"><a
						href="GoodsByCategoryServlet?category=${category}">구매페이지</a></td>
					<td align="center"><a
						href="GoodsRetrieveByCategoryServlet?category=${category}">상품설명</a></td>
					<td align="center">
						<c:if test="${empty searchCategory}">
							<a href="GoodsReviewListServlet">후기</a></td>
						</c:if>
						<c:if test="${!empty searchCategory}">
							<a href="GoodsReviewListServlet?searchCategory=${searchCategory }">후기</a></td>
						</c:if>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<table border="0">
							<tr>
								<td height="7" />
							</tr>
							<c:if test="${empty searchCategory}">
								<tr>
									<td colspan="3"><select id="searchCategory"
										name="searchCategory">
											<option>카테고리별로 보기</option>
											<option value="category1">category1</option>
											<option value="category2">category2</option>
											<option value="category3">category3</option>
											<option value="category4">category4</option>
									</select></td>
								</tr>
							</c:if>
							<tr>
								<td colspan="10">
									<hr size="1" color="CCCCCC">
								</td>
							</tr>
							<tr>
								<td height="7" />
							</tr>
							<tr>
								<th>글번호</th>
								<th>카테고리</th>
								<th width="250">제목</th>
								<th>작성일</th>
								<th width="80">작성자</th>
								<th>조회수</th>
							</tr>
							<tr>
								<td colspan="10">
									<hr size="1" color="CCCCCC">
								</td>
							</tr>
							<tr>
								<td height="7" />
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
											href="InquiryRetrieveServlet?num=${rList.num }">${rList.title }</a></td>
										<td>${rList.writeDay }</td>
										<td align="center">${rList.userId }</td>
										<td>${rList.readCnt }</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="10">
										<hr size="1" color="CCCCCC">
									</td>
								</tr>
								<tr>
									<td align="center" colspan="7"><jsp:include
											page="../board/boardPage.jsp" flush="true"></jsp:include></td>
								</tr>
							</c:if>
							<tr>
								<td colspan="10">
									<hr size="1" color="CCCCCC">
								</td>
							</tr>
							<tr>
								<form action="GoodsReviewListServlet">
									<c:if test="${!empty searchCategory}">
										<input type="hidden" name="searchCategory" value="${searchCategory }">
									</c:if>
									<td colspan="4" style="padding-left: 10px" align="center">
										<select id="searchName" name="searchName">
											<option value="title">제목으로 검색</option>
											<option value="content">내용으로 검색</option>
									</select> <input type="text" id="searchWord" name="searchWord">
										<input type="submit" value="검색">
									</td>
								</form>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="10" />
			</table>
	<tr height="10" />
</table>

<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script>
	$(document).ready(
			function() {

				/* 카테고리별로 보기 */
				$("#searchCategory").on("change",function() {
							var searchCategory = $("option:selected").val();
							$(location).attr("href","GoodsReviewListServlet?searchCategory="+ searchCategory);
						});

			});
</script>