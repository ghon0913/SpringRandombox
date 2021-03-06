<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table width="100%">
	<tr height="10" />
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border=1>
			<c:if test="${ empty category }">
				<tr height="30">
					<td align="center"><a href="goodsList">구매페이지</a></td>
					<td align="center"><a href="goodsRetrieve">상품설명</a></td>
					<td align="center"><a href="goodsReviewList">후기</a></td>
				</tr>
			</c:if>
			<c:if test="${ !empty category }">
				<tr height="30">
					<td align="center"><a href="goodsListByCategory?category=${category }">구매페이지</a></td>
					<td align="center"><a href="goodsRetrieveByCategory?category=${category }">상품설명</a></td>
					<td align="center"><a href="goodsReviewList">후기</a></td>
				</tr>
			</c:if>
				<tr>
					<td colspan="3" align="center">
						<p height="5px">
						<table table class="table table-hover" style="font-size: 12px;">
							<thead>
							<tr>
								<th>글번호</th>
								<th>카테고리</th>
								<th width="250">제목</th>
								<th>작성일</th>
								<th width="80">작성자</th>
								<th>조회수</th>
							</tr>
							</thead>
							<tbody>

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
										<td style="padding-left: 30px">
											<a href="reviewRetrieve?num=${rList.num }">
											${rList.title }</a></td>
										<td>${rList.writeDay }</td>
										<td align="center">${rList.userId }</td>
										<td>${rList.readCnt }</td>
									</tr>
								</c:forEach>
								<thead>
								<tr>
									<td align="center" colspan="7"><jsp:include
											page="../board/boardPage.jsp" flush="true"></jsp:include></td>
								</tr>
							</c:if>
						</tbody>
				<tr>
					<td colspan="6">
						<div style="padding-left: 20px;">
								<form action="goodsReviewList">
									<c:if test="${!empty searchCategory}">
										<input type="hidden" name="searchCategory" value="${searchCategory }">
									</c:if>
									<div class="row" align="center">
									<div class="col-xs-3">
										<select class="form-control" id="searchName" name="searchName" style="font-size: 12px;">
											<option value="title">제목으로 검색</option>
											<option value="content">내용으로 검색</option>
										</select>
									</div>
									&nbsp;&nbsp;&nbsp;
									<div class="col-xs-4">
										<input class="form-control" type="text" id="searchWord" name="searchWord">
									</div>
									&nbsp;&nbsp;&nbsp;
									<div class="col-xs-3">
										<input class="btn btn-success" type="submit" value="검색">
									</div>
									</div>
								</form>
						</div>
					</td>
				</tr>
				</thead>
							</table>
					</td>
				</tr>
				<tr height="10" />
			</table>
</table>