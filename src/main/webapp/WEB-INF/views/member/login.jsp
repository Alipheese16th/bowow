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
	<link href="${conPath}/css/login.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	<c:if test="${not empty loginResult}">
		<script>
			alert("${loginResult}");
		</script>
	</c:if>
	<c:if test="${not empty member}">
		<script>
			location.href="${conPath}/main.do";
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content-form">
		<div class="login-title">로그인</div>
		<div class="login-wrap">
			<form action="login.do" method="post">
			<input type="hidden" name="after" value="${empty param.after ? 'main.do':param.after}">
			
			<c:if test="${not empty param.productCode}">
				<input type="hidden" name="productCode" value="${param.productCode}">
			</c:if>
			
			<c:if test="${not empty param.noticeNum}">
				<input type="hidden" name="noticeNum" value="${param.noticeNum}">
			</c:if>
			
				<table>
					<tr>
						<td><input type="text" name="memberId" class="focusB" placeholder="아이디를 입력해주세요."></td>
					</tr>
					<tr>
						<td>
							<input type="password" name="memberPw" class="focusB" placeholder="비밀번호를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td style="text-align:right;display: block;">
							<a href="${conPath}/findId.do" style="font-size:12px; color:#000;">아이디 찾기</a><span class="find-style"></span>
							<a href="${conPath}/findPw.do" style="font-size:12px; color:#000;">비밀번호 찾기</a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btnStyle1">로그인</button>
							<button type="button" class="btnStyle2" onclick="location='${conPath }/join.do'">회원가입</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>