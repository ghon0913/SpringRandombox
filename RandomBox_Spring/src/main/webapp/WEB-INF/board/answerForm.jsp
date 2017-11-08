<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div style="background-color: #0277BD; margin-top: -30px; color: white; padding: 20px 200px; align: right; margin-bottom: 20px;">
	<h5 style="display:inline;">|&nbsp;&nbsp;&nbsp;<b>마이페이지 >> 고객 문의사항 >> 답변하기</b>&nbsp;&nbsp;&nbsp;|</h5>
</div>
<div class="container">
	<div>
	<form action="answerWrite" method="post" id="answerForm" modelAttribute="answerForm">
		<input type="hidden" name="boardNum" value="${retrieveDTO.num }">
		<input type="hidden" name="userId" value="${retrieveDTO.userId }">
		<input type="hidden" name="sellerId" value="${sessionScope.login.userid }">
		<table class="table" style="font-size: 12px;">
			<tr>
				<td><b>글번호 :</b> &nbsp;&nbsp;&nbsp;${retrieveDTO.num }<input type="hidden" name="num" value="${retrieveDTO.num }"></td>
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
				<c:if test="${!empty retrieveDTO.gCode}">
					<td colspan="2"><b>문의 상품 :</b>&nbsp;&nbsp;&nbsp;<span id="gCode">${retrieveDTO.gCode }</span></td>
				</c:if>
			</tr>
		</table>
		<table class="table" style="font-size: 12px;">
				<tr>
					<td><b>문의 제목 :</b></td>
					<td><input class="form-control" type="text" name="title" id="title" readonly="readonly" value="${retrieveDTO.title }"></td>
				</tr>
				<tr id="content">
					<td><b>문의 내용 :</b></td>
					<td><textarea class="form-control" rows="6" cols="50" name="content" id="content" readonly="readonly">${retrieveDTO.content }</textarea></td>
				</tr>
				<tr>
					<td><b>답변 내용 :</b></td>
					<td><textarea class="form-control" rows="6" cols="50" name="answer" id="answer" >${answerDTO.answer }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<c:if test="${empty answerDTO.answer}">
						<input class="btn btn-success" type="submit" value="답변하기">
					</c:if>
					<c:if test="${!empty answerDTO.answer && answerDTO.sellerId == sessionScope.login.userid}">
						<button class="btn btn-success" id="answerUpdate">답변 수정하기</button>
					</c:if>
						<input class="btn btn-outline-secondary" type="button" value="목록보기" id="questionList">
					</td>
				</tr>
		</table>
	</form>
</div>
</div>

<script>
$(document).ready(function(){

 	/* 목록보기 */
	$("#questionList").on("click", function(){
		$(location).attr("href", "questionList?gCode="+$("#gCode").text());
	});
 	
 	/* 답변수정 */
	$("#answerUpdate").on("click", function(){
		 $('#answerForm').attr('action', "answerUpdate").submit();
	});
	
	/* 문의사항 선택 확인  */
	$("#AnswerForm").on("submit", function(e){
		
		if($("#answer").val().length==0){
			alert("답변내용을 입력해 주세요!");
			e.preventDefault();
		}

	});
});

</script>