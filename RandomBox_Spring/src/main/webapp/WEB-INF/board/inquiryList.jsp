<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>|&nbsp;&nbsp;&nbsp;Q & A&nbsp;&nbsp;&nbsp;|</h3>
			<br>
			<div>
			<table width="100%">
				<tr>
					<td>
						<select class="form-control" id="searchCategory"
					name="searchCategory" style="font-size: 12px;">
					<option>카테고리별로 보기</option>
					<option value="전체카테고리">전체카테고리</option>
					<option value="패션의류">패션의류</option>
					<option value="잡화/뷰티">잡화/뷰티</option>
					<option value="식품/음료">식품/음료</option>
					<option value="생활용품">생활용품</option>
					<option value="문구/취미">문구/취미</option>
					<option value="디지털/컴퓨터">디지털/컴퓨터</option>
					<option value="티켓/e쿠폰">티켓/e쿠폰</option>
				</select>
					</td>
					<td width="60%">
					</td>
					<td>
						<input class="btn btn-success" type="button" id="inquiry" value="문의하기">
					</td>
				</tr>
			</table>
			</div>
			<div class="col-md-3">
				
			</div>
			<br>
			<table class="table table-hover" style="font-size: 12px;">
				<tr>
					<th width="70">글번호</th>
					<th width="110">카테고리</th>
					<th>제목</th>
					<th width="90">작성일</th>
					<th width="80">작성자</th>
					<th width="70">조회수</th>
					<th width="80">처리상태</th>
				</tr>
				<!-- ----------------------------------------------------------------리스트 목록 없을 때 -------------------------------->
				<c:if test="${ boardList.getList().size() == 0 }">
					<tr>
						<td colspan="7" align="center">해당하는 글 목록이 없습니다.</td>
					</tr>
				</c:if>
				<!-- ----------------------------------------------------------------리스트 목록 보여주기 -------------------------------->
				<c:if test="${ boardList.getList().size() != 0 }">
					<c:forEach var="bList" items="${ boardList.getList()}">
						<tr>
							<td>${bList.num }</td>
							<td>${bList.category }</td>
							<td style="padding-left: 30px">
							<c:if test="${bList.open == 'N' }">
									<c:if test="${bList.userId == sessionScope.login.userid }">
										<a href="inquiryRetrieve?num=${bList.num }"
											class="ck_writer">${bList.title } <img
											src="images/items/lock.png" width="12px" height="12px" /></a>
									</c:if>
									<c:if test="${bList.userId != sessionScope.login.userid }">
										<a href="#" class="ck_writer">${bList.title } <img
											src="images/items/lock.png" width="12px" height="12px" /></a>
									</c:if>
							</c:if>
							<c:if test="${bList.open == null || bList.open == 'Y' }">
									<a href="inquiryRetrieve?num=${bList.num }">${bList.title }</a>
							</c:if>
							</td>
							<td>${bList.writeDay }</td>
							<td align="center">${bList.userId }</td>
							<td>${bList.readCnt }</td>
							<td>${bList.state }</td>
						</tr>
					</c:forEach>
					<tr>
						<td align="center" colspan="7"><jsp:include
								page="boardPage.jsp" flush="true"></jsp:include></td>
					</tr>
				</c:if>
			</table>
			<form action="inquiryList">
			<div class="row" align="center">
					<div class="col-xs-3">
				<select class="form-control" id="searchName" name="searchName" style="font-size: 12px;">
						<option value="title">제목으로 검색</option>
						<option value="content">내용으로 검색</option>
				</select></div>
				&nbsp;&nbsp;&nbsp;
				<div class="col-xs-4"> <input class="form-control" type="text" id="searchWord" name="searchWord"></div>
				 &nbsp;&nbsp;&nbsp;
				 <div class="col-xs-3"><input class="btn btn-success" type="submit" value="검색"></div>
			</form>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {

				/* 문의글 작성 */
				$("#inquiry").on("click", function() {
					$(location).attr("href", "inquiryForm");
				});

				/* 카테고리별로 보기 */
				$("#searchCategory").on(
						"change",
						function() {
							var searchCategory = $("option:selected").val();
							$(location).attr("href","inquiryList?searchCategory="+ searchCategory);
						});
				
			});
</script>