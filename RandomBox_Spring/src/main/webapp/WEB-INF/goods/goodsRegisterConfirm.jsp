<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="background-color: #0277BD; margin-top: -30px; color: white; padding: 20px 200px; align: right; margin-bottom: 20px;">
	<h5 style="display:inline;">|&nbsp;&nbsp;&nbsp;<b>상품 등록</b>&nbsp;&nbsp;&nbsp;|</h5>
</div>
<div class="container">
	<div style="padding-left: 10%; padding-right: 15%">
			<p style="font-size: 12px;">상품 정보를 입력해 주세요. 모두 입력하셔야 등록이 가능합니다.</p>

			<table class="table" style="font-size: 12px;">
				<tr>
					<td width="200px;" style="padding-left: 50px;"><b>카테고리</b></td>
					<td>${goodsConfirm.gCategory}</td>
				</tr>
				<tr>
					<td style="padding-left: 50px;"><b>상품이름</b></td>
					<td>${goodsConfirm.gName}</td>
				</tr>
				<tr>
					<td style="padding-left: 50px;"><b>상품가격</b></td>
					<td>${goodsConfirm.gPrice}</td>
				</tr>

				<tr>
					<td style="padding-left: 50px;"><b>상품이미지</b></td>
					<td><img src="/upload/${goodsConfirm.gImage}" height="100" width="100"></td>
				</tr>

				<tr>
					<td style="padding-left: 50px;"><b>상품 상세이미지</b></td>
					<td><img src="/upload/${goodsConfirm.gContentImage}"
						height="100" width="100"></td>
				</tr>

				<tr>
					<td style="padding-left: 50px;"><b>상품수량</b></td>
					<td>${goodsConfirm.gAmount}</td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input class="btn btn-success" id="goodsInfo"
						type="button" value="마이페이지로 가기"></td>
				</tr>
			</table>

		</div>
	</div>
<script type="text/javascript">
	/* 상품 등록 페이지로 이동 */
	$("#goodsInfo").on("click", function() {
		$(location).attr("href", "/app/loginchk/goodsinfo");
	});

</script>
