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
	<!-- <script src="https://code.jquery.com/jquery-3.6.4.js"></script> -->
  	<script>
		$(document).ready(function(){
			$(".lnb").hide();
			$("ul .lnb-down").mouseenter(function(){ $(this).children(".lnb").stop().slideDown(300);})
			$("ul .lnb-down").mouseleave(function(){ $(this).children(".lnb").stop().slideUp(300);})
			$(".search").click(function(){
				$(".search-view").toggleClass("up");
				$('.searchHeaderName').focus();
			});
			$("div.bar-close").click(function(){
				$(".top-bar").css("display", "none");
			})
			
			var memberId = $('#memberId').val();
			$(".cart").click(function(){
				if(!memberId){
					alert('로그인 한 회원만 가능합니다');
					location.href='${conPath}/login.do?after=cart/list.do';
					return;
				}
				location.href="${conPath}/cart/list.do";
			});
			
		});
		$(window).scroll(function(){
			var scroll = $(this).scrollTop();
			if(scroll > 1){
				$("#header").css("box-shadow", "0 3px 4px 0 rgba(0, 0, 0, 0.07)");
			}else{
				$("#header").css("box-shadow","0px 0px 0px 0px");
			}
		});
		
		$('.headerSearch').submit(function(){
			var shname = $('.searchHeaderName').val();
			if(shname.trim() == ''){
				alert('빈칸은 검색할 수 없습니다');
				return false;
			}
		});
		
	</script>
</head>
<body>
	<input type="hidden" id="memberId" value="${member.memberId}">
	
	<div id="header">
		<div class="top-bar">
			<div>				
				<a>BOWOW 바우와우에 신규가입하고 <span class="point-font">2천원 즉시 할인혜택 받기</span></a>
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
							<li><a href="${conPath}/join.do">회원가입</a></li>
							<li><a href="${conPath}/login.do">로그인</a></li>
							<li><a href="#">주문내역</a></li>
						</ul>
					</c:if>
					<c:if test="${not empty member and empty admin}">
						<ul class="inner-right">
							<li><a href="${conPath}/logout.do">${member.memberId}님 로그아웃</a></li>
							<li><a href="${conPath}/mypage/orderList.do">마이페이지</a></li>
							<li><a href="#">주문내역</a></li>
						</ul>
					</c:if>
					<c:if test="${empty member and not empty admin}">
						<ul class="inner-right">
							<li><a href="${conPath}/admin/logout.do">${admin.adminId}님 로그아웃</a></li>
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
										<li><a href="${conPath}/qna/list.do">QnA</a></li>
										<li><a href="${conPath}/notice/list.do">공지사항</a></li>
										<li><a href="${conPath}/faq/list.do">자주하는질문</a></li>
										<li><a href="${conPath }/inquiry/list.do">1:1문의</a></li>
										<li><a href="${conPath}/review/list.do">리뷰게시판</a></li>
									</ul>
							</li>
						</ul>
					</div>
					<div class="gnb-right">
						<button class="search">검색하기</button>
						<button class="cart">
							장바구니
							<c:if test="${not empty totCntCart}">
								<span>${totCntCart}</span>
							</c:if>
						</button>
					</div>
					<div class="search-view">
						<form action="${conPath}/product/search.do" class="headerSearch">
							<input type="text" name="searchName" class="searchHeaderName">
							<input type="submit" class="searchP">
							<input type="button" class="search">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>