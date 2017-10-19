<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div align="center">

	<div align="center">
		<div class="container" align="center">

			<div align="center">
				<div style="width: 1000px">
					<form role="form" method="POST" action="login">
						<fieldset style="width: 300px">
							<h2>Please Sign In</h2>
							<hr class="colorgraph">
							<div class="form-group">
								<input type="text" name="userid" id="userid"
									class="form-control input-lg" placeholder="아이디를 입력하세요.">
							</div>
							<div class="form-group">
								<input type="password" name="passwd" id="passwd"
									class="form-control input-lg" placeholder="비밀번호를 입력하세요.">
							</div>
							<p align="left" style="font-size: 11px; height: 18px">
								<span><input type="checkbox" name="autoLogin"
									id="autoLogin" value="on"><label for=""> 아이디 저장</label></span>
								<span class="fright"><a href="findUserIdForm">아이디 찾기</a>&nbsp;|&nbsp;<a
									href="findPasswdForm">비밀번호 찾기</a>&nbsp;|&nbsp;<a
									href="memberAddForm">회원가입</a></span>
							</p>
							<hr class="colorgraph">
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<input type="submit" class="btn btn-lg btn-success btn-block"
										value="Sign In">
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<a href="memberAddForm"
										class="btn btn-lg btn-primary btn-block">Register</a>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
