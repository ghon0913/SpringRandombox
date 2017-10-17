<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<option>상품명 선택</option>
	<option value="none">목록에 없음</option>
	<c:forEach var="goods" items="${goodsList }">
		<option value="${goods.gCode }">${goods.gName }</option>
	</c:forEach>