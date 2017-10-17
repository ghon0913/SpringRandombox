<%@page import="java.util.HashMap"%>
<%@page import="java.io.Console"%>
<%@page import="com.dto.MyPageBoardPageDTO"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1> 상품 상세페이지</h1>

	<form name="myform">
		gCode : <input type="text" name="gCode" value="${dto.gCode }" readonly="readonly"><br>
		gCategory : <input type="text" name="gCategory" value="${dto.gCategory }" ><br>
		
		gName : <input type="text" name="gName" value="${dto.gName }" ><br>
		gPrice : <input type="text" name="gPrice" value="${dto.gPrice }" ><br>
		
		gImage : <input type="file" name="gImage" value="${dto.gImage }" ><br>
		gContentImage : <input type="file" name="gContentImage" value="${dto.gContentImage }"><br> 
		gAmount : <input type="text" name="gAmount" value="${dto.gAmount }" ><br> 
		
		<input type="button" value="삭제" onclick="goodsdelete(myform)" >&nbsp;
		<input type="button" value="수정" onclick="goodsupdate(myform)" >&nbsp;
		<input type="button" value="돌아가기" onclick="goback()"><br>
	</form>
	
<script>

function goodsdelete(f){
	f.action="goodsdelete.do";
	f.submit();
}
function goodsupdate(f){
	f.action="goodsupdate.do";
	f.submit();
}
function goback(){
	 window.history.back();
}

</script>

