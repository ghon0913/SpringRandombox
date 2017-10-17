<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table border=1 align="center">
		<tr height="10" />
		<c:forEach var="dto" items="${search}">
			<tr height="210">
				<td width="200"><a href=""><img src="upload/${dto.gImage}"
						height="200" width="200"></a></td>
				<td width="200">상품명 : ${dto.gName }</td>
				<td width="200">가격 : ${dto.gPrice }</td>
				<td width="200">판매자 : ${dto.sellerId }<br>
				<a href="">상품평 보러가기</a></td>
				<td><a href="GoodsByCategoryServlet?category=${dto.gCategory}"><input
						type="button" value="랜덤박스"></a></td>
			</tr>
			<tr height="10" />
		</c:forEach>
	</table>
</body>
</html>