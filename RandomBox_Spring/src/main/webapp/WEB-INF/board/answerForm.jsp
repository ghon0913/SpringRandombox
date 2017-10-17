<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
	<form action="AnswerWriteServlet" method="post" id="AnswerForm">
		<input type="hidden" name="boardNum" value="${retrieveDTO.num }">
		<input type="hidden" name="userId" value="${retrieveDTO.userId }">
		<input type="hidden" name="sellerId" value="${sessionScope.login.userid }">
		<table>
			<tr>
				<td>글번호 : ${retrieveDTO.num }<input type="hidden" name="num" value="${retrieveDTO.num }"></td>
				<td id="writer">작성자 : ${retrieveDTO.userId }</td>
				<td>작성일 : ${retrieveDTO.writeDay }</td>
			</tr>
			<tr>
				<td>처리상태 : ${retrieveDTO.state }</td>
				<td></td>
				<td>조회수 : ${retrieveDTO.readCnt }</td>
			</tr>
			<tr>
				<td>카테고리 :</td>
				<td>${retrieveDTO.category }</td>
			</tr>
			<c:if test="${!empty retrieveDTO.gCode}">
				<tr>
					<td>문의 상품 :</td>
					<td id="gCode">${retrieveDTO.gCode }</td>
				</tr>
			</c:if>
		</table>
		<table>
				<tr >
					<td>문의 제목 :</td>
					<td><input type="text" name="title" id="title" readonly="readonly" value="${retrieveDTO.title }"></td>
				</tr>
				<tr id="content">
					<td>문의 내용 :</td>
					<td><textarea rows="10" cols="50" name="content" id="content" readonly="readonly">${retrieveDTO.content }</textarea></td>
				</tr>
				<tr>
					<td>답변 내용 :</td>
					<td><textarea rows="10" cols="50" name="answer" id="answer" ></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="답변하기">
						<input type="button" value="목록보기" id="questionList">
					</td>
				</tr>
		</table>
	</form>
</div></div></div>

<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script>
$(document).ready(function(){

 	/* 목록보기 */
	$("#questionList").on("click", function(){
		$(location).attr("href", "QuestionListServlet?gCode="+$("#gCode").text());
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