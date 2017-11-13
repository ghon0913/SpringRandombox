<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<div class="container">
	<div class="row">
		<div class="form-inline">
			<form action="orderinfodatepage">
				<select class="form-control" name="perPage" id="perPage">
					<option>목록 보기 설정</option>
					<option value="3">3개씩보기</option>
					<option value="5">5개씩보기</option>
					<option value="7">7개씩보기</option>
				</select>
				<span style="padding-left: 130px;">
				<b>기간별조회</b>&nbsp;&nbsp; <input class="form-control" type="date" name="startdate">
				-&nbsp;<input class="form-control" type="date" name="finaldate">
				<input class="btn btn-success" type="submit" value="조회">
				</span>
			</form>
		</div>
	</div>
	<br>
		<table class="table" style="font-size: 12px;">
			<tr align="center">
				<th width="130px;"><b>날짜</b></th>
				<th width="80px;"><b>주문번호</b></th>
				<th style="padding-left: 20px;"><b>상품정보</b></th>
				<th width="140px;"><b>구매가격</b></th>
				<th width="140px;"><b>상태</b></th>
				<th width="140px;"><b>후기 작성</b></th>
			</tr>
			<c:if test="${empty pagedto.getOlist() }">
				<tr>
					<td colspan="6" align="center">주문 내역이 없습니다.</td>
				</tr>
			</c:if>

			<c:if test="${!empty pagedto.getOlist() }">
				<!-- 기간내 foreach문 주문내역 -->
				<c:forEach var="order" items="${pagedto.getOlist() }" varStatus="status">
					<tr>
						<input id="index${order.num }" type="hidden" value="${status.count }">
						<input id="gCode" type="hidden" value="${order.gCode }">
						<input id="gName" type="hidden" value="${order.gName }">
						<input id="gPrice" type="hidden" value="${order.gPrice }">
						<td align="center">${order.orderDay }
						<td align="center"><a class="orderInfoModal" href="#"
							data-toggle="modal" data-target="#myModal" data-num="${order.num }">${order.num }</a></td>
						<td><img src="/app/images/goods/${order.gImage }"
							height="70" width="70"> ${order.gName }</td>
						<td align="center">${order.gPrice }</td>
						<td align="center">${order.status}</td>
						<td align="center"><input class="reviewWrite btn btn-outline-primary btn-sm" type="button" value="후기 작성하기"></td>
					</tr>
				</c:forEach>
			</c:if>
				<tr>
					<td colspan="6" align="center">
						<jsp:include page="myPageOrderInfoPage.jsp" flush="true" /></td>
				</tr>
		</table>
</div>

 <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
					 <div class="modal fade" id="myModal">
					    <div class="modal-dialog">
					      <div class="modal-content">
					      
					        <div class="modal-header">
					          <h4 class="modal-title">주문 정보</h4>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <div class="modal-body">
					          <table class="table" style="font-size: 12px;">
									<tr>
										<th>주문정보<br /> (<span id="modalNum"></span>)
										</th>
										<td>주문상품<input id="modalgName" value="" readonly="readonly"> <br />
											배송상태<input id="modalStatus" value="" readonly="readonly"> <br />
										</td>
									</tr>
									<tr>
										<th>결제정보</th>
										<td>결제방식:<input id="modalPaymethod" value="" readonly="readonly"> <br />
											금액:<input id="modalgPrice" value="" readonly="readonly"> <br />
											결제시간:<input id="modalOrderday" value="" readonly="readonly"> <br />
										</td>
									</tr>
									<tr>
										<th>배송정보</th>
										<td>이름:<input id="modalOrderName" value="" readonly="readonly"> <br />
											연락처:<input id="modalPhone" value="" readonly="readonly"><br />
											주소:<textarea id="modalAddr" readonly="readonly" rows="4" cols="50"></textarea>
										</td>
									</tr>
								</table>
					        </div>
					        
					        <div class="modal-footer">
					          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        </div>
					        
					      </div>
					    </div>
					 </div>
<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<script>
	$(document).ready(function() {

		/* 후기작성하기 */
		$(".reviewWrite").on("click",function() {
			var gCode = $(this).parent().siblings("#gCode").val();
			var gPrice = $(this).parent().siblings("#gPrice").val();
				$(location).attr("href","reviewForm?gCode=" + gCode + "&gPrice=" + gPrice);
		});
		
		/* perPage */
		$("#perPage").on("change", function(){
			var perPage = $("#perPage :selected").val();
			$(location).attr("href", "orderinfoperpage?perPage="+perPage);
		});
		
		/* modal */
		$(".orderInfoModal").on("click", function(){
			var orderNum = $(this).attr("data-num");
			
			$.ajax({
				url : "orderretrieve",
				method : "get",
				dataType : "text",
				data : {
					ordernum : orderNum
				},
				success : function(responseData, status, xhr) {
					console.log(responseData);
					var jsonData = $.parseJSON(responseData);
					console.log(jsonData.num);
					$("#modalNum").text(jsonData.num);
					$("#modalgName").val(jsonData.gName);
					$("#modalgPrice").val(jsonData.gPrice);
					$("#modalPaymethod").val(jsonData.payMethod);
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			});
		});
});
</script>
