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
	<link href="${conPath}/css/footer.css" rel="stylesheet">
</head>
<body>
	<div id="footer">
	<div class="line"></div>
		<div class="footer-in">
			<div class="footer-top">
				<a href="#">홈</a>
				<a href="#">바우와우소개</a>
				<a href="#">이용약관</a>
				<a href="#">개인 정보 처리 방침</a>
				<a href="${conPath }/admin/login.do">관리자 페이지</a>
			</div>
			<div class="footer-content">
				<div class="footer-left">
					<p class="ftitle">고객만족센터</p>
					<p class="tel">021-5321-3333</p>
					<p style="font-size:13px; margin-top:20px;">
						10:00-18:00 주말, 공휴일 휴무<br>
						12:00-13:00 점심 시간
					</p>
				</div>
				<div class="footer-right">
					<div class="footer-right-content">
						<p class="ftitle">입금계좌 정보</p>
						<p style="font-size:13px;">신한     111-222-33333</p>
						<p style="font-size:13px;">예금주   주식회사바우와우컴퍼니</p>					
					</div>
					<div class="content-right">
						<p class="ftitle">바우와우 신촌점</p>
						<p style="font-size:13px;">서울특별시 서대문구 신촌동 신촌길 111-11 1층</p>
						<p style="font-size:13px;">12:00 - 21:00</p>					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>