<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">

<!-- 주문상세보기 -->
<table border="1">
	<tr>
		<td>주문정보<br /> (주문번호)
		</td>
		<td>주문상품<input name="" value="${orderretrieve.gName }" readonly="readonly"> <br />
			배송상태<input name="" value="상태" readonly="readonly"> <br />
		</td>
	</tr>
	<tr>
		<td>결제정보</td>
		<td>결제방식:<input name="" value="${orderretrieve.payMethod }" readonly="readonly"> <br />
			금액:<input name="" value="${orderretrieve.gPrice }" readonly="readonly"> <br />
			결제시간:<input name="" value="${orderretrieve.orderDay }" readonly="readonly"> <br />
		</td>
	</tr>
	<tr>
		<td>배송정보</td>
		<td>이름:<input name="" value="${orderretrieve.orderName }" readonly="readonly"> <br />
			연락처:<input name="" value="${orderretrieve.phone }" readonly="readonly"><br />
			주소:<textarea readonly="readonly" rows="4" cols="50">${orderretrieve.post1 }-${orderretrieve.post1 }
${orderretrieve.addr1 }${orderretrieve.addr2 }
				</textarea><br />
			 배송요청사항:<input name="" value="mes" readonly="readonly"><br />
		</td>
	</tr>
</table>

</div>