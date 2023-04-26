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
	<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">
	<link href="${conPath }/css/header.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
  	<script>
		$(document).ready(function(){
			$(".lnb").hide();
			$("ul .lnb-down").mouseenter(function(){ $(this).children(".lnb").stop().slideDown(300);})
			$("ul .lnb-down").mouseleave(function(){ $(this).children(".lnb").stop().slideUp(300);})
			$(".search").click(function(){
				$(".search-view").toggleClass("up");
			});
			$("div.bar-close").click(function(){
				$(".top-bar").css("display", "none");
			})
		});
	</script>
</head>
<body>
	<div id="header">
		<div class="top-bar">
			<div>				
				<a>BOWOW 바우와우에 신규가입하고 <b>2천원 즉시 할인혜택 받기</b></a>
				<div class="bar-close">
					<span></span>
				</div>
			</div>
		</div>
		<div class="header-top">
			<div class="header-inner">
				<div class="inner">
					<h1 class="logo"><a href="${conPath}/main.do"><img src="${conPath }/img/bowow_logo.png"></a></h1>
					<c:if test="${empty member and empty admin}">
						<ul class="inner-right">
							<li><a href="${conPath}/member/join.do">회원가입</a></li>
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
						<ul style="display:inline-block;">
							<li><a href="#">회사소개</a></li>
							<li><a href="#">오시는길</a></li>
							<li class="lnb-down">
								<a href="#">상품</a>
									<ul class="lnb">
										<li><a href="${conPath}/product/list.do?category=fashion">패션</a></li>
										<li><a href="${conPath}/product/list.do?category=food">푸드</a></li>
										<li><a href="${conPath}/product/list.do?category=toy">장난감</a></li>
										<li><a href="${conPath}/product/list.do?category=walking">산책(외출)</a></li>
										<li><a href="${conPath}/product/list.do?category=clean">목욕(위생)</a></li>
									</ul>
							</li>
							<li><a href="#">매거진</a></li>
							<li class="lnb-down">
								<a href="#">고객센터</a>
									<ul class="lnb">
										<li><a href="${conPath }/qna/list.do?pageNum=${paging.currentPage}">QnA</a></li>
										<li><a href="#">공지사항</a></li>
										<li><a href="${conPath }/faq/list.do?pageNum=${paging.currentPage}">자주하는질문</a></li>
										<li><a href="#">1:1문의</a></li>
										<li><a href="#">리뷰게시판</a></li>
									</ul>
							</li>
						</ul>
					</div>
					<div class="gnb-right">
						<button class="search">검색하기</button>
						<button class="cart">장바구니<span>0</span></button>
					</div>
					<div class="search-view">
						<form>
							<input type="text" name="sch_product">
							<input type="submit" class="searchP">
							<input type="button" class="search">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
  	<script>
		$(function(){
			
			$(".lnb").hide();
			$("ul .lnb-down").mouseenter(function(){ $(this).children(".lnb").stop().slideDown(300);})
			$("ul .lnb-down").mouseleave(function(){ $(this).children(".lnb").stop().slideUp(300);})
			$("ul .lnb-down").click(function(){ $(this).children(".lnb").slideToggle(300);});
			$(".search").click(function(){
				$(".search-view").toggleClass("up");
			});
			$("div.bar-close").click(function(){
				$(".top-bar").css("display", "none");
			})
		});

	</script>
</body>
</html>