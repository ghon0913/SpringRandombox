<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<div style="background-color: #0277BD; color: #EEEEEE; padding: 12px 200px; margin-top: -30px;">
	<div style="margin-bottom: 8px;">
		<a style="font-size: 18px; color: #EEEEEE;"><b>랜덤상품 카테고리</b></a>
		<span class="fa fa-chevron-down"></span>
  	</div>
  <div>
    <table align="center" width="100%" class="categoryTd" style="background-color: #f2f7f3; font-size: 14px;">
    	<tr><td width="20%"></td></tr>
    	<tr align="center">
    		<td width="20%"></td>
    		<td><i class="fa fa-th" aria-hidden="true" style="color: #616161;"></i>
    			<a class="nav-link whiteColor" href="goodsList" style="color: #616161; display: inline-block;">전체보기</a></td>
    		<td><i class="fa fa-diamond" aria-hidden="true" style="color: #616161;"></i>
    			<a class="nav-link" href="goodsByCategory?category=패션의류" 
    			style="color: #616161; display: inline-block;">패션의류</a></td>
    		<td><i class="fa fa-briefcase" aria-hidden="true" style="color: #616161;"></i>
    			<a class="nav-link" href="goodsByCategory?category=잡화/뷰티"
    			style="color: #616161; display: inline-block;">잡화/뷰티</a></td>
    		<td><i class="fa fa-cutlery" aria-hidden="true" style="color: #616161;"></i>
    			<a class="nav-link" href="goodsByCategory?category=식품/음료"
    			style="color: #616161; display: inline-block;">식품/음료</a></td>
    		<td width="20%"></td>
    	</tr>
    	<tr align="center">
    		<td width="20%"></td>
    		<td><i class="fa fa-home" aria-hidden="true" style="color: #616161;"></i>
	    		<a class="nav-link" href="goodsByCategory?category=생활용품"
	    		style="color: #616161; display: inline-block;">생활용품</a></td>
    		<td><i class="fa fa-rocket" aria-hidden="true" style="color: #616161;"></i>
	    		<a class="nav-link" href="goodsByCategory?category=문구/취미"
	    		style="color: #616161; display: inline-block;">문구/취미</a></td>
    		<td><i class="fa fa-camera" aria-hidden="true" style="color: #616161;"></i>
	    		<a class="nav-link" href="goodsByCategory?category=디지털/컴퓨터"
	    		style="color: #616161; display: inline-block;">디지털/컴퓨터</a></td>
    		<td><i class="fa fa-ticket" aria-hidden="true" style="color: #616161;"></i>
	    		<a class="nav-link" href="goodsByCategory?category=티켓/e쿠폰"
	    		style="color: #616161; display: inline-block;">티켓/e쿠폰</a></td>
	    	<td width="20%"></td>
    	</tr>
    </table>
  </div>
</div>

