<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h5>|&nbsp;&nbsp;&nbsp;상품 후기&nbsp;&nbsp;&nbsp;|</h5>
			<br>
			<div class="col-md-4">
				<select class="form-control" id="searchCategory"
					name="searchCategory" style="font-size: 12px;">
					<option>카테고리별로 보기</option>
					<option value="all">후기 전체</option>
					<option value="패션의류">패션의류</option>
					<option value="잡화/뷰티">잡화/뷰티</option>
					<option value="식품/음료">식품/음료</option>
					<option value="생활용품">생활용품</option>
					<option value="문구/취미">문구/취미</option>
					<option value="디지털/컴퓨터">디지털/컴퓨터</option>
					<option value="티켓/e쿠폰">티켓/e쿠폰</option>
				</select>
			</div>
			<br>
			<table class="table table-hover" style="font-size: 12px;">
				<thead>
				<tr>
					<th style="text-align: center;" width="70">글번호</th>
					<th style="text-align: center;" width="110">카테고리</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;" width="90">작성일</th>
					<th style="text-align: center;" width="80">작성자</th>
					<th style="text-align: center;" width="70">조회수</th>
				</tr>
				</thead>
				<!-- ----------------------------------------------------------------리스트 목록 없을 때 -------------------------------->
				<c:if test="${ boardList.getList().size() == 0 }">
					<tr>
						<td colspan="6" align="center">해당하는 후기가 없습니다.</td>
					</tr>
				</c:if>
				<!-- ----------------------------------------------------------------리스트 목록 보여주기 -------------------------------->
				<c:if test="${ boardList.getList().size() != 0 }">
					<c:forEach var="rList" items="${boardList.getList()}">
						<tr>
							<td style="text-align: center;">${rList.num }</td>
							<td style="text-align: center;">${rList.category }</td>
							<td><a
								href="reviewRetrieve?num=${rList.num }">${rList.title }</a></td>
							<td style="text-align: center;">${rList.writeDay }</td>
							<td style="text-align: center;">${rList.userId }</td>
							<td style="text-align: center;">${rList.readCnt }</td>
						</tr>
					</c:forEach>
					<tfoot>
					<tr>
						<td align="center" colspan="7">
							<c:set var="boardChk" value="review"/>
							<jsp:include page="boardPage.jsp" flush="true">
								<jsp:param name="boardChk" value="review" />
							</jsp:include>
						</td>
					</tr>
					</tfoot>
				</c:if>
			</table>
			<form action="reviewList">
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

<script>
	$(document).ready(function() {

				/* 카테고리별로 보기 */
				$("#searchCategory").on("change",function() {
					var searchCategory = $("option:selected").val();
					$(location).attr("href","reviewList?searchCategory="+ searchCategory);
				});
	});
</script>