<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dto.MemberDTO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
	<c:if test="${! empty result }">
		<script>
			alert('${result}');
		</script>
	</c:if>

	<jsp:include page="include/top.jsp" flush="true" /><br>
	<jsp:include page="include/category.jsp" flush="true" /><br>

	<jsp:include page="include/main.jsp" flush="true" /><br>

</body>
</html>