<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">
	<link href="${conPath}/css/mypage_top.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	<div id="mypage">
		<div class="mypage-wrap">
			<div class="mypage-left">
				<h1>MY PAGE</h1>
				<p>마이페이지</p>
				<div class="mypage-info">
					<p><span></span>이름</p>
				</div>
			</div>
			<div class="mypage-right">
				<div class="mypage-point">
					<p>적립금</p>
				</div>
				<div class="mypage-coupon">
					<p>쿠폰</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>