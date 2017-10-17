<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<h2>상품 등록</h2>
	<hr>
	<form action="GoodsRegisterServlet" method="post" enctype="multipart/form-data">
		gCode : <input type="text" name="gCode"><br>
		gCategory : <input type="text" name="gCategory"><br>
		
		gName : <input type="text" name="gName"><br>
		gPrice : <input type="text" name="gPrice"><br>
		
		gImage : <input type="file" name="gImage"><br>
		gContentImage : <input type="file" name="gContentImage"><br> 
		gAmount : <input type="text" name="gAmount"><br> 
		
		<input type="submit" value="등록">&nbsp;
		<input type="reset" value="취소"><br>
	</form>