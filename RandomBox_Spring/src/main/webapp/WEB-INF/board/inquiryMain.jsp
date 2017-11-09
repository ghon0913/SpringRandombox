<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div style="background-color: #0277BD; margin-top: -30px; color: white; padding: 20px 200px; align: right; margin-bottom: 20px;">
	<h5 style="display:inline;">|&nbsp;&nbsp;&nbsp;<b>Q & A</b>&nbsp;&nbsp;&nbsp;|</h5>
	<p id ="goShopping" style="display:inline; padding: 8px 15px; border: solid 1px white; font-size: 13px; margin-top: -6px;" class="pull-right">
		랜덤박스 쇼핑 바로가기
	</p>
</div>
<div class="container">
	<div align="right" style="padding: 0px;">
		<input class="btn btn-success pull-right" type="button" id="inquiry" value="다른 문의사항">
	</div><br><br>
	<div id="accordion">
	  <div class="card">
	    <div class="card-header">
	      <a class="card-link" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
	 		<i class="fa fa-question-circle" aria-hidden="true"></i>
	 		개인정보수정은 어디에서 가능한가요?
	      </a>
	    </div>
	    <div id="collapseOne" class="collapse" style="font-size: 12px;">
	      <div class="card-body">
	      	<span>
	      		<i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;
				<b>로그인 후 [마이페이지 >> 회원정보]에서 회원정보 수정 가능</b><br><br>
				아이디, 이름, 생일 등 일부 정보는 수정이 불가하며<br>
				아이디는 수정이 불가하기 때문에 변경을 원하신다면 관리자 문의 후 새아이디로 가입하셔야 합니다.<br>
				이외 정보들은 마이페이지에서 직접 변경 하실 수 있습니다.<br><br>
				<a href="loginchk/userInfo">[회원정보 수정] 바로가기</a>
			</span>
	      </div>
	    </div>
	  </div>
	
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
	        <i class="fa fa-question-circle" aria-hidden="true"></i>
	 		신용카드 결제 중 오류가 난 경우 어떻게 하나요?
	      </a>
	    </div>
	    <div id="collapseTwo" class="collapse" style="font-size: 12px;">
	      <div class="card-body">
	      	<i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;
			<b>오류상황에 따른 확인사항</b><br><br>
			1. 타임아웃 : 일시적인 오류로 잠시 후 재결제<br>
			2. 비밀번호, CVC값 오류 : 카드정보 재확인<br>
			3. 할부개월수 : 체크카드, 기프트카드는 일시불만 결제 가능<br>
			4. 안심클릭, ISP결제 등 결제서비스 오류 : 해당 카드사 문의<br>
			5. 카드오류 : 한도초과, 사용중지 등인 경우<br>
	      </div>
	    </div>
	  </div>
	
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
	        <i class="fa fa-question-circle" aria-hidden="true"></i>
	 		장바구니란 무엇인가요?
	      </a>
	    </div>
	    <div id="collapseThree" class="collapse" style="font-size: 12px;">
	      <div class="card-body">
	      	<i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;
			<b>장바구니는 오프라인 매장에서 이용하시는 장바구니 또는 카트와 같이 쇼핑 중 원하시는 상품을 담아놓는 기능입니다<b><br><br>
			구매를 원하시는 상품을 장바구니에 모아 한 번에 함께 주문하실 수 있습니다.<br>
			장바구니 안에서 개별 주문, 전체 주문, 마음에 들지 않는 상품의 삭제,<br>
			현재 담아놓은 상품들의 상품가격 등을 확인하실 수 있습니다.
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
	        <i class="fa fa-question-circle" aria-hidden="true"></i>
	 		상품에 대해 궁금한 점이 있어요.
	      </a>
	    </div>
	    <div id="collapseFour" class="collapse" style="font-size: 12px;">
	      <div class="card-body">
	      	<i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;
			<b>상품에 대해 궁금한 점이 있으실 경우, [Q&A게시판]에서 문의하기 버튼을 통하여 문의하실 수 있습니다.</b><br><br>
			질문글을 올리실 때 해당 상품 카데고리와 상품명을 선택해 질문글을 올려주시면<br>
			해당 상품 판매자가 답변을 해 드립니다.<br>
			상품 카데고리와 상품명을 선택 할때 목록에 문의을 원하는 상품명이 없을 경우 '목록에 없음'으로 선택해 문의하시면<br>
			랜덤박스 홈페이지  관리자가 답변을 드리거나 판매자를 따로 연결해 답변이 갈 수 있도록 하겠습니다.<br>
			(단, 악의적인 글이나 관계없는 글은 삭제처리될 수 있습니다.)
	      </div>
	    </div>
	  </div>
	
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
	        <i class="fa fa-question-circle" aria-hidden="true"></i>
	 		회원가입을 하지 않아도 판매와 구매가 가능한가요?
	      </a>
	    </div>
	    <div id="collapseFive" class="collapse" style="font-size: 12px;">
	      <div class="card-body">
	      	<i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;
			<b>비회원은 구매/판매는 불가합니다.</b><br><br>
			비회원은 상품정보를 확인하거나 [Q & A], [랜덤박스 후기] 게시물만 확인 가능하고 랜덤박스 상품의 구매/판매는 불가합니다.<br>
			회원일 경우라도 램덤박스 상품 구매는 구매회원만 가능하고, 상품 판매는  판매회원만 가능하기 때문에<br>
			이용 목적에 따라 각각 다른 아이디로 회원가입 후 이용해 주시기 바랍니다.
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
	        <i class="fa fa-question-circle" aria-hidden="true"></i>
	 		아이디/비밀번호가 생각나지 않아요.
	      </a>
	    </div>
	    <div id="collapseSix" class="collapse" style="font-size: 12px;">
	      <div class="card-body">
	      	<i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;
			<b>간단한 정보 확인 후 아이디/비밀번호 정보를 알려드립니다.</b><br><br>
			아이디 혹은 비밀번호를 분실하셨다면 로그인 페이지 하단에 있는<br>
			[아이디 찾기], [비밀번호 찾기] 기능을 통해 가입정보를 확인 할 수 있습니다.<br>
			간단한 정보 확인 후 아이디는 홈페이지에서 바로, 비밀번호는 가입시 적으셨던 이메일로 비밀번호를 발송해 드립니다.
	      </div>
	    </div>
	  </div>
	</div>
</div>
<script>
$(document).ready(function() {
	
	/* 쇼핑 바로가기 */
	$("#goShopping").on("click", function() {
		$(location).attr("href", "goodsList");
	});
	
	/* 문의글 작성 */
	$("#inquiry").on("click", function() {
		$(location).attr("href", "loginchk/inquiryForm");
	});
});
</script>