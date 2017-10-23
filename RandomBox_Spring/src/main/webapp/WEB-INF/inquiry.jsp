<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q & A</title>
</head>
<body>
	<jsp:include page="include/top.jsp" flush="true" /><br>
		<c:if test="${chk_inquiryPage == 'inquiryForm' }">
			<jsp:include page="board/inquiryForm.jsp" flush="true" /><br>
		</c:if>
		<c:if test="${chk_inquiryPage == 'inquiryList' }">
			<jsp:include page="board/inquiryList.jsp" flush="true" /><br>
		</c:if>
		<c:if test="${chk_inquiryPage == 'inquiryRetrieve' }">
			<jsp:include page="board/inquiryRetrieve.jsp" flush="true" /><br>
		</c:if>
</body>
</html>