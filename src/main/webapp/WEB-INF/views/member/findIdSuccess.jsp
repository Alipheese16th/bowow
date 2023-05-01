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
	<link href="${conPath}/css/findSuccess.css" rel="stylesheet">
	<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">
	<style>
		
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	<c:if test="${not empty member}">
		<script>
			location.href="${conPath}/main.do";
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content-form">
		<div class="findId-wrap">
			<div class="findId-title">고객님의 BOWOW 계정을 찾았습니다.
				<div class="findId-sub">아이디 확인 후 로그인해 주세요.</div>
			</div>
			<div class="id-content">
				<img src="${conPath}/img/user-icon.png" alt="회원아이콘">
				<div class="user-id">${idResult}</div>
			</div>
			<div class="btn-wrap">				
				<button onclick="location.href='${conPath}/login.do'" class="btnStyle1">로그인</button>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>