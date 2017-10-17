<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>로그인</title>
</head>
<body>
	<c:if test="${! empty email }">
		<script>
			alert("가입하신 메일로 비밀번호를 보냈습니다^^");
		</script>
	</c:if>
	<jsp:include page="include/top.jsp" flush="true" /><br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="login/loginForm.jsp" flush="true" /><br>

</body>
</html>