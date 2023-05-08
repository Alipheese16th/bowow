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
</head>
<body>
	<div id="mypage">
		<div class="mypage-wrap">
			<div class="mypage-left">
				<h1>MY PAGE</h1>
				<div class="mypage-info">
					<p><span>${member.memberName}</span> 고객님</p>
					<p style="margin-top:5px;">${grade}</p>
				</div>
			</div>
			<div class="mypage-right">
				<div class="mypage-point">
					<p>적립금 : <fmt:formatNumber value="${member.memberPoint}" pattern="#,###"/> 원</p>
				</div>
				<div class="mypage-coupon">
					<p>쿠폰 : 총 ${couponCnt} 개</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>