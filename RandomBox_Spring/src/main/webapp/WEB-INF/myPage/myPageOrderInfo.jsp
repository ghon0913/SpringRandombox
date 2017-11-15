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
						<td><img src="/upload/${order.gImage }"
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
			});// end ajax
		});
});
</script>
