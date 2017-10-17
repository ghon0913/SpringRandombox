<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">
	<form action="boardupdate.do">
	<table border="1">
	<input type="hidden" name="num" value="${bndto.num }">
	<input type="hidden" name="retrievedto" value="${bndto }">
		<tr>
			<td>NUM.${bndto.num }</td>
			<td>카테고리: ${bndto.category }</td>
			<td>작성일: ${bndto.writeDay }</td>
			<td>상태: ${bndto.state }</td>
		</tr>
		<tr>
			<td colspan="5" align="center">제목: ${bndto.title }</td>
		</tr>
		<tr>
			<td colspan="5">내용<br /> <input type="text" height="100%"
				width="100%" name="content" value="${bndto.content }">
			</td>
		</tr>
		<tr>
			<td colspan="5"	align="right">
				<input type="submit" value="수정">
			</td>
		</tr>
	</table>
	</form>
</div>