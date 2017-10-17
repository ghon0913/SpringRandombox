<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table width="100%" cellspacing="0" cellpadding="0">
	<tr height="10" />

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border=1>

				<tr height="30">
					<td align="center"><a href="GoodsByCategoryServlet?category=${category}">구매페이지</a></td>
					<td align="center"><a href="GoodsRetrieveByCategoryServlet?category=${category}">상품설명</a></td>
					<td align="center"><a href="GoodsReviewListServlet?searchCategory=${category}">후기</a></td>
				</tr>
				<tr>
				<td colspan="4">${category}구성품에 대한 상세설명입니다. 물품에 대한 자세한 사항을 확인하세요.</td>
				</tr>
				<tr>
					
					<td colspan="4" align="center"><c:forEach var="list16"
							items="${isCategory}">
							상품명 : ${list16.gName}<br>
							상세설명 : ${list16.gContentImage}
							<hr>
						</c:forEach></td>
				</tr>


				<tr height="10" />
			</table>
	<tr height="10" />
</table>