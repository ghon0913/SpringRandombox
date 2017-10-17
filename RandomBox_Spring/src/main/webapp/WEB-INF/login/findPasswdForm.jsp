<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">
	<div style="width: 500px">
		<form action="FindPasswdServlet" method="get">

			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1"
					style="width: 100px">아이디</span> <input type="text"
					class="form-control" placeholder="아이디를 입력하세요."
					aria-label="Username" aria-describedby="basic-addon1" name="userid">
				<br> <input type="submit" value="비밀번호 찾기"
					class="btn btn-info">
			</div>
		</form>
	</div>
</div>
