<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<table border="1">
	
	<tr>
	<td colspan="10">
	
	<table>
	<tr>
		<td colspan="3">
		<form action="userInfoPage.admin" method="post">
			<select id="searchName" name="searchName">
				<option value="userId">아이디</option>
				<option value="userName">이름</option>
			</select>
			<input type="text" id="searchValue" name="searchValue">
		 	<input type="submit" value="검색"> 
		 	</form>
		</td>
		<td>
		<form action="userInfoPerpage.admin">
			<select id="perCount" name="perCount">
			
				<option value="10">10개씩 보기</option>
				<option value="15">15개씩 보기</option>
				<option value="20">20개씩 보기</option>				
			</select>
				<input type="submit" value="선택">
			</form>
		</td>
		<td>
		<form action="userInfoOrderStandard.admin">
			<select name ="orderStandard" id="orderStandard">
				<option value="username">이름순</option>
				<option value="userid">아이디순</option>
			</select>
			<input type="submit" value="선택">
		 </form>
		</td>
	</tr>
	</table>
	
	</td>
	</tr>

	<c:if test="${empty pagedto.mlist}">
	<tr>
		<td colspan="10"> 가입된 회원이 없습니다.</td>
	</tr>
	</c:if>
	<c:if test="${!empty pagedto.mlist}">
		<tr>
			<td> 회원아이디</td>
			<td> 회원이름</td>
			<td> 회원성명</td>
			<td> 이메일</td>
			<td> 유형</td>
		</tr>
	<c:forEach var="a" items="${pagedto.mlist}">
		<tr>
			<td>${a.userid }</td>
			<td>${a.username }</td>
			<td>${a.gender }</td>
			<td>${a.email }</td>
			<td>${a.ox }</td>
		</tr>
	</c:forEach>
		<tr>
		<td colspan="10" align="center">
			<jsp:include page="userInfoPage.jsp" flush="false"/>
		</td>
	</tr>
	</c:if>

	</table>