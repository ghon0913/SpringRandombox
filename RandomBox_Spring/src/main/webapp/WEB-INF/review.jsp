<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review</title>
</head>
<body>
	<jsp:include page="include/top.jsp" flush="true" /><br>

	<c:if test="${! empty sessionScope.login }">
		<c:if test="${chk_reviewPage == 'reviewForm' }">
			<jsp:include page="board/reviewForm.jsp" flush="true" /><br>
		</c:if>
		<c:if test="${chk_reviewPage == 'reviewList' }">
			<jsp:include page="board/reviewList.jsp" flush="true" /><br>
		</c:if>
		<c:if test="${chk_reviewPage == 'reviewRetrieve' }">
			<jsp:include page="board/reviewRetrieve.jsp" flush="true" /><br>
		</c:if>
	</c:if>
	<c:if test="${empty sessionScope.login }">
		<c:if test="${chk_reviewPage == 'reviewList' }">
			<jsp:include page="board/reviewList.jsp" flush="true" /><br>
		</c:if>
		<c:if test="${chk_reviewPage != 'reviewList' }">
			<script type="text/javascript">
				alert("로그인이 필요한 메뉴입니다!");
			</script>
			<br><br><br><br><br><br>
			<jsp:include page="login/loginForm.jsp" flush="true" /><br>
		</c:if>
	</c:if>
</body>
</html>