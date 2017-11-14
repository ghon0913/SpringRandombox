<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="background-color: #0277BD; margin-top: -168px; color: white; padding: 20px 200px; align: right; margin-bottom: 20px;">
	<h5 style="display:inline;">|&nbsp;&nbsp;&nbsp;<b>상품 등록</b>&nbsp;&nbsp;&nbsp;|</h5>
</div>
<div class="container">
	<div style="padding-left: 10%; padding-right: 15%">
			<p style="font-size: 12px;">상품 정보를 입력해 주세요. 모두 입력하셔야 등록이 가능합니다.</p>
			<form action="goodsRegister" method="post" id="goodsRegisterForm" enctype="multipart/form-data">
				<div>
					<select class="form-control" id="gCategory" name="gCategory"
						style="font-size: 12px; width: 25%">
						<option>카테고리 선택</option>
						<option value="패션의류">패션의류</option>
						<option value="잡화/뷰티">잡화/뷰티</option>
						<option value="식품/음료">식품/음료</option>
						<option value="생활용품">생활용품</option>
						<option value="문구/취미">문구/취미</option>
						<option value="디지털/컴퓨터">디지털/컴퓨터</option>
						<option value="티켓/e쿠폰">티켓/e쿠폰</option>
					</select>
				</div><br>
				<table class="table" style="font-size: 12px;">

					<tr>
						<th width="180px">상품이름</th>
						<td><input class="form-control" type="text" name="gName"
							id="gName" placeholder="상품이름"></td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td><input class="form-control" type="text" name="gPrice"
							id="gPrice" placeholder="상품가격"></td>
					</tr>

					<tr>
						<th>상품이미지</th>
						<td><input type="file" id="gImage" name="gImage" required></td>
					</tr>

					<tr>
						<th>상품 상세이미지</th>
						<td><input type="file" id="gContentImage"
							name="gContentImage" required></td>
					</tr>

					<tr>
						<th>상품수량</th>
						<td><input class="form-control" type="text" name="gAmount"
							id="gAmount" placeholder="상품수량"></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input class="btn btn-success"
							type="submit" value="상품등록"> <input
							class="btn btn-default" type="reset" value="취소"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
<script type="text/javascript">

	$(document).ready(function() {
		/* 빈칸 없나 확인 */
		$("#goodsRegisterForm").on("submit", function(e) {
			console.log($('#file').val());

			if ($("#gCategory").val() == "카테고리 선택") {
				alert("카테고리를 선택해주세요!");
				e.preventDefault();
			} else if ($("#gName").val().length == 0) {
				alert("입력하신 상품이름을 확인해주세요!");
				e.preventDefault();
			} else if ($("#gPrice").val().length == 0) {
				alert("입력하신 상품가격을 확인해주세요!");
				e.preventDefault();
			} else if ($("#gAmount").val().length == 0) {
				alert("입력하신 상품수량을 확인해주세요!");
				e.preventDefault();
			}

		});
	});
</script>
