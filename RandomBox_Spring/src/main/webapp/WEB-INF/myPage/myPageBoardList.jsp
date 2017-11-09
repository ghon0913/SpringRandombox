<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="form-inline">
			<form action="boardsearchpage">
				<select class="form-control" name="perPage" id="perPage">
						<option>목록 보기 설정</option>
						<option value="3">3개</option>
						<option value="5">5개</option>
						<option value="7">7개</option>
				</select>
				<span style="padding-left: 220px;">
					<select class="form-control" name="searchName">
						<option >상태</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input class="form-control" type="text" name="searchValue">
					<input type="submit" class="btn btn-success" value="검색">
				</span>
				</form>
		</div>
	</div>
	<br>
	<table class="table" style="font-size: 12px;">
		<tr align="center">
			<td width="120px"><b>번호</b></td>
			<td><b>글 제목</b></td>
			<td width="120px"><b>상태</b></td>
			<td width="120px"><b>날짜</b></td>
		</tr>
		<c:if test="${empty pagedto.getBlist()}">
			<tr>
				<td colspan="4" align="center">레코드가없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${! empty pagedto.getBlist()}">
			<c:forEach var="a" items="${pagedto.getBlist()}">
				<tr>
					<td align="center">${a.num }</td>
					<td style="padding-left: 70px;"><a href="myPageBoardRetrieve?bnum=${a.num}&state=${a.state}&atMyPage=true" target="_blank">${a.title}</a></td>
					<td align="center">${a.state}</td>
					<td align="center">${a.writeDay }</td>
				</tr>
			</c:forEach>
		</c:if>
		<tr>
			<td colspan="4" align="center"><jsp:include page="myPageBoardPage.jsp" flush="true" /></td>
		</tr>
	</table>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		
		/* perPage */
		$("#perPage").on("change", function(){
			var perPage = $("#perPage :selected").val();
			$(location).attr("href", "boardperpage?perPage="+perPage);
		});
	});
</script>
