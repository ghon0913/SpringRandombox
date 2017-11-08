<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" class="container">
<div class="row">
	<table class="table table-hover">

		<tr>
		
			<td colspan="3">
				<form action="boardsearchpage">
					<select class="form-control" name="searchName">
						<option value="state">상태</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select> <input type="text" name="searchValue"> <input
						type="submit"class="btn btn-default" value="검색">
				</form>
			</td>
		

			<td  >
				<form action="boardperpage">
					<select class="form-control" name="perPage">
						<!-- change함수주기 -->
						<option value="3">3개</option>
						<option value="5">5개</option>
						<option value="7">7개</option>
					</select> <input type="submit" class="btn btn-success">
				</form>
			</td>

		</tr>

		<tr>
			<td>번호</td>
			<td>글 제목</td>
			<td>상태</td>
			<td>날짜</td>
		</tr>
		<c:if test="${empty pagedto.getBlist()}">
			<tr>
				<td colspan="4">레코드가없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${! empty pagedto.getBlist()}">
			<c:forEach var="a" items="${pagedto.getBlist()}">
				<tr>
					<td>${a.num }</td>
					<td><a href="myPageBoardRetrieve?bnum=${a.num}&state=${a.state}&atMyPage=true" target="_blank">${a.title}</a></td>
					<td>${a.state}</td>
					<td>${a.writeDay }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="center"><jsp:include
						page="myPageBoardPage.jsp" flush="true" /></td>
			</tr>
		</c:if>
		
	</table>
	</div>
</div>