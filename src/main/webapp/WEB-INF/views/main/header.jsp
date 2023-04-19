<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link href="${conPath }/css/header.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$(".lnb").hide();
			$("ul .lnb-down").mouseenter(function(){ $(this).children(".lnb").stop().slideDown(300);})
			.mouseleave(function(){ $(this).children(".lnb").stop().slideUp(300);})
			$("ul .lnb-down").click(function(){ $(this).children(".lnb").slideToggle(300);})
 			$(".search]").click(function(){
				
			});
		});
	</script>
</head>
<body>
	<div id="header">
		<div class="top-bar">
			<p><a>BOWOW 바우와우에 신규가입하고 <b>2천원 즉시 할인혜택 받기</b></a></p>
		</div>
		<div class="header-top">
			<div class="header-inner">
				<div class="inner">
					<h1 class="logo"><a><img src="${conPath }/img/bowow_logo.png"></a></h1>
					<c:if test="${empty member and empty admin}">
						<ul class="inner-right">
							<li><a href="#">회원가입</a></li>
							<li><a href="#">로그인</a></li>
							<li><a href="#">주문내역</a></li>
						</ul>
					</c:if>
					<c:if test="${not empty member and empty admin}">
						<ul class="inner-right">
							<li><a href="#">로그아웃</a></li>
							<li><a href="#">마이페이지</a></li>
							<li><a href="#">주문내역</a></li>
						</ul>
					</c:if>
				</div>
			</div><!-- header-inner -->
			<div class="header-bottom">
				<div class="gnb">
					<div class="gnb-left">
						<ul>
							<li><a href="#">회사소개</a></li>
							<li><a href="#">오시는길</a></li>
							<li class="lnb-down">
								<a href="#">상품</a>
									<ul class="lnb">
										<li><a href="#">패션</a></li>
										<li><a href="#">푸드</a></li>
										<li><a href="#">장난감</a></li>
										<li><a href="#">산책(외출)</a></li>
										<li><a href="#">목욕(위생)</a></li>
									</ul>
							</li>
							<li><a href="#">매거진</a></li>
							<li class="lnb-down">
								<a href="#">고객센터</a>
									<ul class="lnb">
										<li><a href="#">공지사항</a></li>
										<li><a href="#">자주하는질문</a></li>
										<li><a href="#">1:1문의</a></li>
										<li><a href="#">리뷰게시판</a></li>
									</ul>
							</li>
						</ul>
					</div>
					<div class="gnb-right">
						<form>
							<input type="text" name="search" class="search-form">
							<input type="submit" class="search" value="">
						</form>
						<button class="cart">장바구니<span>0</span></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>