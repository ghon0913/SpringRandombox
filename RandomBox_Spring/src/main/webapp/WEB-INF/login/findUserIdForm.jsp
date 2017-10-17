<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">
	<div style="width: 500px">
		<form action="FindUserIdServlet" method="get">
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1"
					style="width: 100px">이름</span> <input type="text"
					class="form-control" placeholder="이름을 입력해 주세요."
					aria-label="Username" aria-describedby="basic-addon1"
					name="username">
			</div>
			<br>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1"
					style="width: 100px">전화번호</span> <input type="text"
					class="form-control" placeholder="ex) 01096590369"
					aria-label="Username" aria-describedby="basic-addon1" name="phone">
			</div>
			<br>
			<div align="center">
				<input class="input-group-addon" type="submit" value="id찾기">
			</div>
		</form>
	</div>
</div>
