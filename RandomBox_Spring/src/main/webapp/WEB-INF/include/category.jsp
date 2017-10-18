<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<table align="center">
		<tr>
			<td><a href="GoodsListServlet"
				class="btn btn-info btn-block" role="button" aria-pressed="true">&nbsp;전체보기&nbsp;</a></td>
			<td><a href="GoodsByCategoryServlet?category=c1"
				class="btn btn-info btn-block" role="button" aria-pressed="true">패션의류</a></td>
			<td><a href="GoodsByCategoryServlet?category=c2"
				class="btn btn-info btn-block" role="button" aria-pressed="true">잡화/뷰티</a></td>
			<td><a href="GoodsByCategoryServlet?category=c3"
				class="btn btn-info btn-block" role="button" aria-pressed="true">식품/음료</a></td>
		</tr>
		<tr>
			<td><a href="GoodsByCategoryServlet?category=c4"
				class="btn btn-info btn-block" role="button" aria-pressed="true">생활용품</a></td>
			<td><a href="GoodsByCategoryServlet?category=c5"
				class="btn btn-info btn-block" role="button" aria-pressed="true">문구/취미</a></td>
			<td><a href="GoodsByCategoryServlet?category=c6"
				class="btn btn-info btn-block" role="button" aria-pressed="true">디지털/컴퓨터</a></td>
			<td><a href="GoodsByCategoryServlet?category=c7"
				class="btn btn-info btn-block" role="button" aria-pressed="true">티켓/e쿠폰</a></td>
		</tr>

	</table>
</div>

