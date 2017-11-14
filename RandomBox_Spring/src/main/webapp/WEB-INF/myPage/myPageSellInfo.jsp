<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="container">
	<div style="width: 300px;">
		<select class="form-control" name="perPage" id="perPage">
			<option>목록 보기 설정</option>
			<option value="3">3개씩보기</option>
			<option value="5">5개씩보기</option>
			<option value="7">7개씩보기</option>
		</select>
	</div><br>
	<table class="table" style="font-size: 12px;">
			<tr align="center">
				<td width="100px"><b>주문번호</b></td>
				<td width="100px"><b>주문자</b></td>
				<td width="100px"><b>상품코드</b></td>
				<td><b>상품명</b></td>
				<td width="100px"><b>주문 정보</b></td>
				<td width="100px"><b>주문일자</b></td>
				<td width="100px"><b>배송상태</b></td>
			</tr>
		<c:if test="${empty sellInfoDTO.olist }">
			<tr>
				<td colspan="10" align="center">주문 정보가없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${! empty sellInfoDTO.olist }">
			<c:forEach var="order" items="${sellInfoDTO.olist }">
				<tr align="center">
					<td >${order.num }</td>
					<td>${order.orderName }</td>
					<td>${order.gCode }</td>
					<td align="left"><img src="/app/images/goods/${order.gImage }" height="70" width="70">&nbsp;
					${order.gName }</td>
					<td><input class="btn btn-outline-secondary btn-sm orderInfoModal" type="button" 
					data-toggle="modal" data-target="#myModal" data-num="${order.num }" value="자세히보기"></td>
					<td>${order.orderDay }</td>
					<td><span id="span${order.num }" class="statusSpan">${order.status }</span><br>
						<c:if test="${order.status=='배송준비중'}">
							<input class="btn btn-outline-success btn-sm status" type="button" value="배송처리" id="statusBtn${order.num }" data-num="${order.num }">
						</c:if>
					</td>
				</tr>

			</c:forEach>

			<tr>
				<td colspan="10" align="center">
					<jsp:include page="myPageSellInfoPage.jsp"></jsp:include><hr>
				</td>
			</tr>
		</c:if>
	</table>

</div>
 <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
					  <div class="modal fade" id="myModal">
					    <div class="modal-dialog">
					      <div class="modal-content">
					      
					        <div class="modal-header">
					          <h6 class="modal-title"><b>주문 정보</b></h6>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <div class="modal-body">
					          <table class="table" style="font-size: 12px;">
									<tr>
										<th rowspan="2">주문정보<br/>(<span id="modalNum"></span>)</th>
										<td width="80px">주문상품 :</td>
										<td><span id="modalgName"></span></td>
									</tr>
									<tr>
										<td>배송상태 :</td>
										<td><span id="modalStatus"></span></td>
									</tr>	
									<tr>
										<th rowspan="3">결제정보</th>
										<td>결제방식 :</td>
										<td><span id="modalPaymethod"></span></td>
									<tr>
										<td>금액 :</td>
										<td><span id="modalgPrice"></span></td>
									</tr>
									<tr>
										<td>결제시간 :</td>
										<td><span id="modalOrderday"></span></td>
									</tr>
									<tr>
										<th rowspan="3">배송정보</th>
										<td>주문자 :</td>
										<td><span id="modalOrderName"></span></td>
									</tr>
									<tr>
										<td>연락처 :</td>
										<td><span id="modalPhone"></span></td>
									</tr>
									<tr>
										<td>주소 :</td>
										<td><span id="modalAddr"></span></td>
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
	
	/* 배송처리 */
	$(".status").on("click", function() {
		
		var num = $(this).attr("data-num");
		$.ajax({
			url : "statusUpdate",
			method : "get",
			dataType : "text",
			data : {
				num : num
			},
			success : function(responseData, status, xhr) {
				$("#span"+num).text("배송 완료");
				$("#statusBtn"+num).remove();
				alert("배송처리가 완료되었습니다.");
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		}); // end ajax
	});
	
	/* perPage */
	$("#perPage").on("change", function(){
		var perPage = $("#perPage :selected").val();
		$(location).attr("href", "sellInfoperpage?perPage="+perPage);
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

				var jsonData = $.parseJSON(responseData);
				$("#modalNum").text(jsonData.num);
				$("#modalgName").text(jsonData.gName);
				$("#modalgPrice").text(jsonData.gPrice+" 원");
				$("#modalPaymethod").text(jsonData.payMethod);
				$("#modalStatus").text(jsonData.status);
				$("#modalOrderday").text(jsonData.orderDay);
				$("#modalOrderName").text(jsonData.orderName);
				$("#modalPhone").text(jsonData.phone);
				$("#modalAddr").text("("+jsonData.post1+" - "+jsonData.post2+") "+jsonData.addr1+jsonData.addr2);
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		});
	});
});
</script>
