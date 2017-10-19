<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
	<h5>|&nbsp;&nbsp;&nbsp;문의글 쓰기&nbsp;&nbsp;&nbsp;|</h5><br>
	<form id="inquiryWriteForm" action="inquiryWrite" method="post" modelAttribute="inquiryWriteForm">
		<table class="table" style="font-size: 12px;">
			<input type="hidden" name="userId" value="${sessionScope.login.userid }">
			<input type="hidden" name="state" value="처리중">
			<tr>
				<th width="160px">작성자 : </th>
				<td>${sessionScope.login.userid }</td>
			</tr>
			<tr>
				<th>문의사항 선택 :</th>
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
					<select class="form-control" id="select_category" name="category" style="display: none; font-size: 12px;">
						<option>카테고리 선택</option>
						<option value="전체카테고리">전체카테고리</option>
						<option value="패션의류">패션의류</option>
						<option value="잡화/뷰티">잡화/뷰티</option>
						<option value="식품/음료">식품/음료</option>
						<option value="생활용품">생활용품</option>
						<option value="문구/취미">문구/취미</option>
						<option value="디지털/컴퓨터">디지털/컴퓨터</option>
						<option value="티켓/e쿠폰">티켓/e쿠폰</option>
					</select>
					</span>&nbsp;&nbsp;
					<span class="col-xs-2">
					<select class="form-control" id="select_goods" name="gCode" style="display: none; font-size: 12px;">
					</select>
					</span>
				</td>	
			</tr>
			<tr>
				<th>문의글 공개여부 :</th>
				<td><input type="radio" name="open" value="N">&nbsp;비공개글로 작성&nbsp;&nbsp;&nbsp;
				<input type="radio" name="open" value="Y" checked="checked">&nbsp;공개글로 작성</td>
			</tr>
			<tr>
				<th>제목 :</th>
				<td><input class="form-control" type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<th>문의 내용 :</th>
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

<script>
$(document).ready(function(){

	/* 목록보기 */
	$("#inquiryList").on("click", function(){
		$(location).attr("href", "inquiryList");
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
               type:"post",
               url:"selectCategory",
               data: {gCategory: s_category},
               dataType:"json",
               
               success : function(responseData, status, xhr){
            	   
            	   var option = "<option>상품명 선택</option>"
            			+"<option value='admin'>목록에 없음</option>";
            			
            	   $.each(responseData, function(index, value){
            		   option = option + "<option value="+value.gCode+">"
            		   			+value.gName+"</option>";
            	   });
            	   
            	   $("#select_goods").show();
            	   $("#select_goods").append(option);
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