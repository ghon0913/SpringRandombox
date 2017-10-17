<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<h3>|&nbsp;&nbsp;&nbsp;Q & A&nbsp;&nbsp;&nbsp;|</h3><br>
	<form action="InquiryUpdateServlet" method="post" id="inquiryRetrieveForm">
		<table class="table">
			<tr>
				<td>글번호 : &nbsp;&nbsp;&nbsp;${retrieveDTO.num }<input type="hidden" name="num" value="${retrieveDTO.num }"></td>
				<td id="writer">작성자 : &nbsp;&nbsp;&nbsp;${retrieveDTO.userId }</td>
				<td>작성일 : &nbsp;&nbsp;&nbsp;${retrieveDTO.writeDay }</td>
			</tr>
			<tr>
				<td>처리상태 : &nbsp;&nbsp;&nbsp;${retrieveDTO.state }</td>
				<td></td>
				<td>조회수 : &nbsp;&nbsp;&nbsp;${retrieveDTO.readCnt }</td>
			</tr>
			<tr>
				<td>상품 카테고리 :</td>
				<td>${retrieveDTO.category }</td>
			</tr>
			<c:if test="${!empty retrieveDTO.gCode}">
				<tr>
					<td>문의 상품 :</td>
					<td>${retrieveDTO.gCode }</td>
				</tr>
			</c:if>
		</table>
		<table class="table">
			<c:if test="${retrieveDTO.userId == sessionScope.login.userid}">
				<tr>
					<td>문의글 공개여부 :</td>
					<td id="open"><input type="radio" name="open" value="N">비공개글로 작성&nbsp;&nbsp;
					<input type="radio" name="open" value="Y" checked="checked">공개글로 작성</td>
				</tr>
				<tr>
					<td>제목 :</td>
					<td><input type="text" name="title" id="title" value="${retrieveDTO.title }"></td>
				</tr>
				<tr>
					<td>문의 내용 :</td>
					<td><textarea rows="10" cols="50" name="content" id="content">${retrieveDTO.content }</textarea></td>
				</tr>
				
				<c:if test="${ ! empty answerDTO}">
				<tr>
					<td>답변 내용 :</td>
					<td><textarea rows="10" cols="50" name="content" id="content">${answerDTO.answer }</textarea></td>
				</tr>					
				</c:if>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기" id="update">&nbsp;
						<input type="button" value="삭제하기" id="delete">&nbsp;
						<input type="button" value="목록보기" id="inquiryList">
					</td>
				</tr>
			</c:if>
			<c:if test="${retrieveDTO.userId != sessionScope.login.userid}">
				<tr >
					<td>제목 :</td>
					<td><input type="text" name="title" id="title" readonly="readonly" value="${retrieveDTO.title }"></td>
				</tr>
				<tr id="content">
					<td>문의 내용 :</td>
					<td><textarea rows="10" cols="50" name="content" id="content" readonly="readonly">${retrieveDTO.content }</textarea></td>
				</tr>
				<c:if test="${ ! empty answerDTO}">
				<tr>
					<td>답변 내용 :</td>
					<td><textarea rows="10" cols="50" name="content" id="content">${answerDTO.answer }</textarea></td>
				</tr>					
				</c:if>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="목록보기" id="inquiryList">
					</td>
				</tr>
			</c:if>
		</table>
	</form>
</div>
</div></div>
<script type="text/javascript" src="jquery-3.2.1.js"></script>
<script>
$(document).ready(function(){

	/* 목록보기 */
	$("#inquiryList").on("click", function(){
		$(location).attr("href", "InquiryListServlet");
	});
	
	/* 삭제하기 */
	$("#delete").on("click", function(){
		$(location).attr("href", "InquiryDeleteServlet?num=${retrieveDTO.num }");
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

	});
});

</script>