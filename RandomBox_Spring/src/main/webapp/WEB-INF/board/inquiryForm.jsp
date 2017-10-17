<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
	<h3>|&nbsp;&nbsp;&nbsp;문의글 쓰기&nbsp;&nbsp;&nbsp;|</h3><br>
	<form id="inquiryWriteForm" action="InquiryWriteServlet" method="post">
		<table class="table">
			<input type="hidden" name="userid" value="${sessionScope.login.userid }">
			<tr>
				<td width="200px">작성자 : </td>
				<td>${sessionScope.login.userid }</td>
			</tr>
			<tr>
				<td>문의사항 선택 :</td>
				<td>
				<span class="row">
					<span class="col-xs-2">
					<select class="form-control" id="select_question" name="select_question" style="font-size: 12px;">
						<option>문의사항 선택</option>
						<option value="q_goods">상품 문의</option>
						<option value="q_admin">관리자에게 질문</option>
					</select>
					</span>&nbsp;&nbsp;
					<span class="col-xs-2">
					<select class="form-control" id="select_category" name="select_category" style="display: none; font-size: 12px;">
						<option>카테고리 선택</option>
						<option value="c1">카테고리 1</option>
						<option value="90">카테고리 2</option>
						<option value="1">카테고리 3</option>
						<option value="test">카테고리 4</option>
					</select>
					</span>&nbsp;&nbsp;
					<span class="col-xs-2">
					<select class="form-control" id="select_goods" name="gCode" style="display: none; font-size: 12px;">
					</select>
					</span>
				</td>	
			</tr>
			<tr>
				<td>문의글 공개여부 :</td>
				<td><input type="radio" name="open" value="N">&nbsp;비공개글로 작성&nbsp;&nbsp;&nbsp;
				<input type="radio" name="open" value="Y" checked="checked">&nbsp;공개글로 작성</td>
			</tr>
			<tr>
				<td>제목 :</td>
				<td><input class="form-control" type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<td>문의 내용 :</td>
				<td><textarea class="form-control" rows="10" cols="30" name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input class="btn btn-success" type="submit" value="문의하기">&nbsp;
					<input class="btn btn-default" id="inquiryList" type="button" value="작성취소">
				</td>
			</tr>
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
		
		$("#select_goods").hide();
		$("#select_goods").empty();
		
		var s_category = $("#select_category option:selected").val();

        $.ajax({
               type:"get",
               url:"SelectCategoryServlet",
               data: {gCategory: s_category},
               dataType:"text",
               
               success : function(responseData, status, xhr){
            	   $("#select_goods").show();
            	   $("#select_goods").append(responseData);
               },
               
               error : function(xhr, status, e){
					console.log(status, e);
               }
        }); // ajax 끝
	});
	
	/* 문의사항 선택 확인  */
	$("#inquiryWriteForm").on("submit", function(e){
		
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