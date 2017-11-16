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

	<c:if test="${! empty search }">
		<table align="center">
			<tr height="10">
			<tr align="center" style="color: gray; text-decoration: bold" >
				<td>상품</td>
				<td>상품명</td>
				<td>가격</td>
				<td>판매자</td>
				<td>구매</td>
			</tr>
			<tr height="30px">

			
			<c:forEach var="dto" items="${search}">
				
				<tr height="210" align="center">
					<td width="200"><a href=""><img src="upload/${dto.gImage}"
							height="200" width="200"></a></td>
					<td width="200">${dto.gName }</td>
					<td width="200">${dto.gPrice }</td>
					<td width="200">${dto.sellerId }<br> <a href="reviewList?reviewBySearch=${dto.gCode}">상품후기
							보러가기</a></td>
					<td><a href="goodsListByCategory?category=${dto.gCategory}"><input
							type="button" value="랜덤박스" class="btn btn-primary"></a></td>
				</tr>
				<tr height="10" />
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${ empty search }">
		<div align="center">
			<br> <br> <br>
			<p style="font-size: 30px">
				검색하신 "${searchWord}"에 대한 검색결과는 없습니다.<br> 다시 시도해주세요.
			</p>
		</div>
	</c:if>


</body>
</html>