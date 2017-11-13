<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div style="background-color: #0277BD; margin-top: -30px; color: white; padding: 20px 200px; align: right; margin-bottom: 20px;">
	<h5 style="display:inline;">|&nbsp;&nbsp;&nbsp;<b>Q & A</b>&nbsp;&nbsp;&nbsp;|</h5>
	<c:if test="${sessionScope.login.ox == 'N' }">
		<p id ="goShopping" style="display:inline; padding: 8px 15px; border: solid 1px white; font-size: 13px; margin-top: -6px;" class="pull-right">
			랜덤박스 쇼핑 바로가기
		</p>
	</c:if>
</div>
<div class="container">
	<div class="row">
			<div class="col-md-3">
				<select class="form-control" id="searchCategory" name="searchCategory" style="font-size: 12px;">
					<option>카테고리별로 보기</option>
					<option value="all">문의사항 전체</option>
					<option value="전체카테고리">전체카테고리 상품</option>
					<option value="패션의류">패션의류</option>
					<option value="잡화/뷰티">잡화/뷰티</option>
					<option value="식품/음료">식품/음료</option>
					<option value="생활용품">생활용품</option>
					<option value="문구/취미">문구/취미</option>
					<option value="디지털/컴퓨터">디지털/컴퓨터</option>
					<option value="티켓/e쿠폰">티켓/e쿠폰</option>
				</select>
			</div>
			<div class="col-md-9" align="right">
				<input class="btn btn-success" type="button" id="inquiry" value="문의하기">
				<input class="btn btn-outline-success" type="button" id="inquiryMain" value="자주하는 질문">
			</div>
	</div>
			<br>
			<table class="table table-hover" style="font-size: 12px;">
				<thead>
				<tr >
					<th style="text-align: center;" width="100">글번호</th>
					<th style="text-align: center;" width="150">카테고리</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;" width="100">작성일</th>
					<th style="text-align: center;" width="100">작성자</th>
					<th style="text-align: center;" width="80">조회수</th>
					<th style="text-align: center;" width="80">처리상태</th>
				</tr>
				</thead>
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
							<td style="text-align: center;">${bList.num }</td>
							<td style="text-align: center;">${bList.category }</td>
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
							<td style="text-align: center;">${bList.writeDay }</td>
							<td style="text-align: center;">${bList.userId }</td>
							<td style="text-align: center;">${bList.readCnt }</td>
							<td style="text-align: center;">${bList.state }</td>
						</tr>
					</c:forEach>
					<tfoot>
					<tr>
						<td align="center" colspan="7">
						<c:set var="boardChk" value="inquiry"/>
							<jsp:include page="boardPage.jsp" flush="true">
								<jsp:param name="boardChk" value="${boardChk}" />
							</jsp:include>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="7">
							<div align="center">
								<form action="inquiryList" class="form-inline">
									<select class="form-control" id="searchName" name="searchName" style="font-size: 12px;">
											<option value="title">제목으로 검색</option>
											<option value="content">내용으로 검색</option>
									</select>
									&nbsp;&nbsp;&nbsp;
									<input class="form-control" type="text" id="searchWord" name="searchWord">
									&nbsp;&nbsp;&nbsp;
									<input class="btn btn-success" type="submit" value="검색">
								</form>
							</div>
						</td>
					</tr>
					</tfoot>
				</c:if>
			</table>
</div>
<script>
	$(document).ready(function() {

				/* 문의글 작성 */
				$("#inquiry").on("click", function() {
					$(location).attr("href", "loginchk/inquiryForm");
				});
				
				/* 자주하는 질문 */
				$("#inquiryMain").on("click", function() {
					$(location).attr("href", "inquiryMain");
				});
				
				/* 쇼핑 바로가기 */
				$("#goShopping").on("click", function() {
					$(location).attr("href", "goodsList");
				});

				/* 카테고리별로 보기 */
				$("#searchCategory").on("change", function() {
						var searchCategory = $("option:selected").val();
						$(location).attr("href","inquiryListByCategory?searchCategory="+ searchCategory);
					});
				});
</script>