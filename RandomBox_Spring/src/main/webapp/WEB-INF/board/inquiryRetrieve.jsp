<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="background-color: #0277BD; margin-top: -30px; color: white; padding: 20px 200px; align: right; margin-bottom: 20px;">
	<h5 style="display:inline;">|&nbsp;&nbsp;&nbsp;<b>Q & A</b>&nbsp;&nbsp;&nbsp;|</h5>
	<p id ="goShopping" style="display:inline; padding: 8px 15px; border: solid 1px white; font-size: 13px; margin-top: -6px;" class="pull-right">
		랜덤박스 쇼핑 바로가기
	</p>
</div>
<div class="container">
	<div>
	<form action="loginchk/inquiryUpdate" method="post" id="inquiryRetrieveForm" modelAttribute="inquiryRetrieveForm">
		<table class="table" style="font-size: 12px;">
			<tr>
				<input type="hidden" name="num" value="${retrieveDTO.num }">
				<input type="hidden" name="boardNum" value="${retrieveDTO.num }">
				<td><b>글번호 :</b> &nbsp;&nbsp;&nbsp;${retrieveDTO.num }</td>
				<td id="writer"><b>작성자 : </b>&nbsp;&nbsp;&nbsp;${retrieveDTO.userId }</td>
				<td><b>작성일 :</b> &nbsp;&nbsp;&nbsp;${retrieveDTO.writeDay }</td>
			</tr>
			<tr>
				<td><b>처리상태 :</b> &nbsp;&nbsp;&nbsp;${retrieveDTO.state }</td>
				<td></td>
				<td><b>조회수 :</b> &nbsp;&nbsp;&nbsp;${retrieveDTO.readCnt }</td>
			</tr>
			<tr>
				<td><b>상품 카테고리 :</b>&nbsp;&nbsp;&nbsp; ${retrieveDTO.category }</td>
				<td>
					<c:if test="${(retrieveDTO.gCode != 'admin') && !empty retrieveDTO.gCode}">
						<b>문의 상품 :</b>&nbsp;&nbsp;&nbsp;${retrieveDTO.gCode }
					</c:if>
				</td>
				<td></td>
			</tr>
		</table>
		<table class="table" style="font-size: 12px;">
			<c:if test="${retrieveDTO.userId == sessionScope.login.userid}">
				<tr>
					<td><b>문의글 공개여부 :</b></td>
					<td id="open"><input type="radio" name="open" value="N">비공개글로 작성&nbsp;&nbsp;
					<input type="radio" name="open" value="Y" checked="checked">공개글로 작성</td>
				</tr>
				<tr>
					<td><b>제목 :</b></td>
					<td><input class="form-control" type="text" name="title" id="title" value="${retrieveDTO.title }"></td>
				</tr>
				<tr>
					<td><b>문의 내용 :</b></td>
					<td><textarea class="form-control" rows="6" cols="50" name="content" id="content">${retrieveDTO.content }</textarea></td>
				</tr>
			</c:if>
			<c:if test="${retrieveDTO.userId != sessionScope.login.userid}">
				<tr >
					<td><b>제목 : </b></td>
					<td><input class="form-control" type="text" name="title" id="title" readonly="readonly" value="${retrieveDTO.title }"></td>
				</tr>
				<tr id="content">
					<td><b>문의 내용 :</b></td>
					<td><textarea class="form-control" rows="6" cols="50" name="content" id="content" readonly="readonly">${retrieveDTO.content }</textarea></td>
				</tr>
			</c:if>
<!-- 답변 내용	//////////////////////////////////////////////////////////////////////////////////////// -->
				<c:if test="${ ! empty answerDTO}">
					<c:if test="${ answerDTO.sellerId == sessionScope.login.userid}">
						<tr>
							<td><b>답변 내용 :</b></td>
							<td><textarea class="form-control" rows="6" cols="50" name="answer" id="answer">${answerDTO.answer }</textarea></td>
						</tr>					
					</c:if>
					<c:if test="${ answerDTO.sellerId != sessionScope.login.userid}">
						<tr>
							<td><b>답변 내용 :</b></td>
							<td><textarea class="form-control" rows="6" cols="50" readonly="readonly">${answerDTO.answer }</textarea></td>
						</tr>					
					</c:if>
				</c:if>
<!-- 하단 버튼	//////////////////////////////////////////////////////////////////////////////////////// -->
				<c:if test="${retrieveDTO.userId != sessionScope.login.userid}">
					<tr>
						<td colspan="2" align="center">
							<c:if test="${ ! empty answerDTO}">
								<c:if test="${ answerDTO.sellerId == sessionScope.login.userid}">
									<input class="btn btn-success" type="button" value="답변 수정하기" id="answerUpdate">
								</c:if>
							</c:if>
							<input class="btn btn-outline-secondary" type="button" value="목록보기" id="inquiryList">
						</td>
					</tr>
				</c:if>
				<c:if test="${retrieveDTO.userId == sessionScope.login.userid}">	
					<tr>
						<td colspan="2" align="center">
							<input class="btn btn-success" type="submit" value="수정하기" id="update">&nbsp;
							<input class="btn btn-outline-secondary" type="button" value="삭제하기" id="delete">&nbsp;
							<input class="btn btn-outline-secondary" type="button" value="목록보기" id="inquiryList">
						</td>
					</tr>
				</c:if>
		</table>
	</form>
</div>
</div>
<script>

$(document).ready(function(){

	/* 쇼핑 바로가기 */
	$("#goShopping").on("click", function() {
		$(location).attr("href", "goodsList");
	});
	
	/* 목록보기 */
	$("#inquiryList").on("click", function(){
		window.history.back();
	});
	
	/* 삭제하기 */
	$("#delete").on("click", function(){
		$(location).attr("href", "loginchk/inquiryDelete?num=${retrieveDTO.num }");
	});
	
	/* 답변 수정 하기 */
	$("#answerUpdate").on("click", function(){
		var answer = $("#answer").val();
		$(location).attr("href", "answerUpdate?boardNum=${retrieveDTO.num }&answer="+answer);
	});
	
	/* 지정했던 공개여부 선택되도록 */
	var open = '${retrieveDTO.open }';
	$("#open").find("[value='"+open+"']").attr("checked", "checked");
	
	/* 문의사항 선택하기  */
	$("#select_question").on("change", function(){
		
		var s_question = $("option:selected").val();
 		if(s_question == "q_goods"){
			$("#select_category").show();
		}else{
			$("#select_category").hide();
		}
	});
	
	/* 카테고리 선택하기 */
	$("#select_category").on("change", function(){
		
		var s_category = $("#select_category option:selected").val();

        $.ajax({
               type:"get",
               url:"SelectCategoryServlet",
               data: {gCategory: s_category},
               dataType:"text",
               
               success : function(responseData, status, xhr){
            	   console.log(responseData);
            	   $("#select_category").after(responseData);
               },
               
               error : function(xhr, status, e){
					console.log(status, e);
               }
        }); // ajax 끝
	});
	
	/* 문의사항 선택 확인  */
	$("#inquiryRetrieveForm").on("submit", function(e){
		
		if(${ answerDTO.sellerId != sessionScope.login.userid}){
			if($("#title").val().length==0){
				alert("제목을 입력해 주세요!");
				e.preventDefault();
			}else if($("#content").val().length==0){
				alert("내용을 입력해 주세요!");
				e.preventDefault();
			}else if($("#select_question option:selected").val()!="q_admin"){
				
				if($("#select_question option:selected").val()=="문의사항 선택"){
					alert("문의사항 선택 항목을 확인해 주세요!");
					e.preventDefault();
				}else{
					if($("#select_category option:selected").val()=="카테고리 선택"){
						alert("카테고리 선택 항목을 확인해 주세요!");
						e.preventDefault();
					}else if($("#select_goods option:selected").val()=="상품명 선택"){
						alert("상품명 선택 항목을 확인해 주세요!");
						e.preventDefault();
					}
				}
			}
		}

	});
});

</script>