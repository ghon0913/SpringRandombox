<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<br>
<br>
<div align="center">사용자의 아이디는 ${userid}입니다.</div>
<br>
<br>
<div align="center">
<table>
	<tr>
		<td><a href="loginForm"><input type="button"
				class="input-group-addon" value="로그인"></a></td>
				<td>&nbsp;&nbsp;</td>
		<td><a href="findPasswdForm"><input type="button"
				class="input-group-addon" value="비밀번호 찾기"></a></td>
	</tr>
</table>
</div>