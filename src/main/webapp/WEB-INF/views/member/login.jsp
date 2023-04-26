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
</head>
<body>
	<c:if test="${joinResult eq 1}">
		<script>
			alert("${mDto} 회원가입 감사합니다.");
		</script>
	</c:if>
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
						<td colspan="2">
							<button type="submit" class="btnStyle">로그인</button>
							<button type="button" class="btnStyle" onclick="location='${conPath }/join.do'">회원가입</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>