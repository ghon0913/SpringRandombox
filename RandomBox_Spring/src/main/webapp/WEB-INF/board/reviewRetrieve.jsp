<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<h3>|&nbsp;&nbsp;&nbsp;상품 후기&nbsp;&nbsp;&nbsp;|</h3><br>
			<form action="ReviewUpdateServlet" method="post"
				id="reviewRetrieveForm">
				<table class="table">
					<tr>
						<td>글번호 :&nbsp;&nbsp;&nbsp; ${retrieveDTO.num }<input type="hidden" name="num"
							value="${retrieveDTO.num }"></td>
						<td id="writer">작성자 : &nbsp;&nbsp;&nbsp;${retrieveDTO.userId }</td>
						<td>작성일 : &nbsp;&nbsp;&nbsp;${retrieveDTO.writeDay }</td>
					</tr>
					<tr>
						<td>조회수 :&nbsp;&nbsp;&nbsp; ${retrieveDTO.readCnt }</td>
						<td></td><td></td>
					</tr>
					<tr>
						<td colspan="3">상품 카테고리 : &nbsp;&nbsp;&nbsp;${retrieveDTO.category }</td>
					</tr>
					<tr>
						<td colspan="3">랜덤 배정 상품 :&nbsp;&nbsp;&nbsp;${retrieveDTO.gCode }</td>
					</tr>
				</table>
				<table class="table">
					<c:if test="${retrieveDTO.userId == sessionScope.login.userid}">
						<tr>
							<td>제목 :</td>
							<td><input class="form-control" type="text" name="title" id="title"
								value="${retrieveDTO.title }"></td>
						</tr>
						<tr>
							<td>후기 내용 :</td>
							<td><textarea class="form-control" rows="10" cols="50" name="content"
									id="content">${retrieveDTO.content }</textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input class="btn btn-success" type="submit"
								value="수정하기" id="update">&nbsp; <input class="btn btn-default" type="button"
								value="삭제하기" id="delete">&nbsp; <input class="btn btn-default" type="button"
								value="목록보기" id="inquiryList"></td>
						</tr>
					</c:if>
					<c:if test="${retrieveDTO.userId != sessionScope.login.userid}">
						<tr>
							<td>제목 :</td>
							<td><input class="form-control" type="text" name="title" id="title"
								readonly="readonly"></td>
						</tr>
						<tr id="content">
							<td>후기 내용 :</td>
							<td><textarea class="form-control" rows="10" cols="50" name="content"
									id="content" readonly="readonly"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button"
								value="목록보기" id="reviewList"></td>
						</tr>
					</c:if>
				</table>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script>
	$(document)
			.ready(
					function() {

						/* 목록보기 */
						$("#reviewList").on("click", function() {
							$(location).attr("href", "ReviewListServlet");
						});

						/* 삭제하기 */
						$("#delete")
								.on(
										"click",
										function() {
											$(location)
													.attr("href",
															"ReviewDeleteServlet?num=${retrieveDTO.num }");
										});

					});
</script>