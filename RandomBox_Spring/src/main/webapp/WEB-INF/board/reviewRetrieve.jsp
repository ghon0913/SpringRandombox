<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<h5>|&nbsp;&nbsp;&nbsp;상품 후기&nbsp;&nbsp;&nbsp;|</h5><br>
			<form action="reviewUpdate" method="post" id="reviewRetrieveForm" modelAtrribute="reviewRetrieveForm">
				<table class="table" style="font-size: 12px;">
					<tr>
						<td><b>글번호 :</b>&nbsp;&nbsp;&nbsp; ${retrieveDTO.num }<input type="hidden" name="num"
							value="${retrieveDTO.num }"></td>
						<td id="writer"><b>작성자 :</b> &nbsp;&nbsp;&nbsp;${retrieveDTO.userId }</td>
						<td><b>작성일 : </b>&nbsp;&nbsp;&nbsp;${retrieveDTO.writeDay }</td>
					</tr>
					<tr>
						<td><b>조회수 :</b>&nbsp;&nbsp;&nbsp; ${retrieveDTO.readCnt }</td>
						<td></td><td></td>
					</tr>
					<tr>
						<td colspan="3"><b>상품 카테고리 : </b>&nbsp;&nbsp;&nbsp;${retrieveDTO.category }</td>
					</tr>
					<tr>
						<td colspan="3"><b>랜덤 배정 상품 :</b>&nbsp;&nbsp;&nbsp;${retrieveDTO.gCode }</td>
					</tr>
				</table>
				<table class="table" style="font-size: 12px;">
					<c:if test="${retrieveDTO.userId == sessionScope.login.userid}">
						<tr>
							<td><b>제목 :</b></td>
							<td><input class="form-control" type="text" name="title" id="title"
								value="${retrieveDTO.title }"></td>
						</tr>
						<tr>
							<td><b>후기 내용 :</b></td>
							<td><textarea class="form-control" rows="10" cols="50" name="content"
									id="content">${retrieveDTO.content }</textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input class="btn btn-success" type="submit"
								value="수정하기" id="update">&nbsp; <input class="btn btn-default" type="button"
								value="삭제하기" id="delete">&nbsp; <input class="btn btn-default" type="button"
								value="목록보기" id="reviewListPage"></td>
						</tr>
					</c:if>
					<c:if test="${retrieveDTO.userId != sessionScope.login.userid}">
						<tr>
							<td><b>제목 :</b></td>
							<td><input class="form-control" type="text" name="title" id="title"
								readonly="readonly" value="${retrieveDTO.title }"></td>
						</tr>
						<tr id="content">
							<td><b>후기 내용 :</b></td>
							<td><textarea class="form-control" rows="10" cols="50" name="content"
									id="content" readonly="readonly">${retrieveDTO.content }</textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input class="btn btn-default" type="button"
								value="목록보기" id="reviewListPage"></td>
						</tr>
					</c:if>
				</table>
			</form>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {

			/* 목록보기 */
			$("#reviewListPage").on("click", function() {
				console.log("$$$");
				$(location).attr("href", "reviewList");
			});
   			
			/* 삭제하기 */
			$("#delete").on("click",function() {
				$(location).attr("href","reviewDelete?num=${retrieveDTO.num }");
			});
	});
</script>