<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>|&nbsp;&nbsp;&nbsp;상품 등록&nbsp;&nbsp;&nbsp;|</h3>
			<br>
			<p style="font-size: 12px;">상품 정보를 입력해 주세요. 모두 입력하셔야 등록이 가능합니다.</p>

			<table class="table">
				<tr>
					<td width="180px">카테고리</td>
					<td>${goodsConfirm.gCategory}</td>
				</tr>
				<tr>
					<td width="180px">상품이름</td>
					<td>${goodsConfirm.gName}</td>
				</tr>
				<tr>
					<td>상품가격</td>
					<td>${goodsConfirm.gPrice}</td>
				</tr>

				<tr>
					<td>상품이미지</td>
					<td><img src="/upload/${goodsConfirm.gImage}" height="100" width="100"></td>
				</tr>

				<tr>
					<td>상품 상세이미지</td>
					<td><img src="/upload/${goodsConfirm.gContentImage}"
						height="100" width="100"></td>
				</tr>

				<tr>
					<td>상품수량</td>
					<td>${goodsConfirm.gAmount}</td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input class="btn btn-success"
						type="button" value="마이페이지로 가기"></td>
				</tr>
			</table>

		</div>
	</div>
</div>

<img src="/upload/${gImage_originalFileName}" height="100" width="100">
${gImage_originalFileName } ${gImage_size }

