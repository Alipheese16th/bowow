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
	<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">
	<style>
		body{font-family: 'Pretendard';}
		#content-form .login-wrap table td button:nth-child(1){
			width:100%;
			height:50px;
			border-radius: 5px;
			border:1px none;
			background:#f1f1f1;
			color:#000;
			font-size:16px;
			font-weight: 600;
			padding:0 10px;
			margin-top:10px;
		}
		#content-form .login-wrap table tr td input{
			margin-bottom:0px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			const patternName = /^[a-zA-Z가-힣]{1,}$/; // 이름 정규표현식 
			const patternMail = /^\w+@\w+(\.\w+){1,2}$/; // 이메일 정규표현식
			var memberName, memberEmail;
			$("#mname").keyup(function(){
				memberName = $(this).val();
				if(!memberName){
					$(".mnameResult").html("<p style='color:red;'>가입 시 등록한 이름을 입력해 주세요.</p>");
				}else if(!memberName.match(patternName)){
					$(".mnameResult").html("<p style='color:red;'>한글과 영문 대 소문자를 사용하세요.</p>");
				}else{
					$(".mnameResult").html("")
				}
			}); // 이름 keyup이벤트
			$("#memail").keyup(function(){
				memberEmail = $(this).val();
				if(!memberEmail){
					$(".memailResult").html("<p style='color:red;'>가입 시 등록한 이메일을 입력해 주세요.</p>");
				}else if(!memberEmail.match(patternMail)){
					$(".memailResult").html("<p style='color:red;'>이메일 형식으로 입력해 주세요.</p>");
				}else{
					$(".memailResult").html("");
				}
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content-form">
		<div class="login-title">아이디 찾기</div>
		<div class="login-wrap">
			<form action="findId.do" method="post">
			<input type="hidden" name="after" value="${empty param.after ? 'main.do':param.after}">
				<table>
					<tr>
						<td style="font-size:14px;">이름</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="memberName" id="mname" class="focusB" placeholder="이름을 입력해주세요.">
							<div class="mnameResult bottom"></div>
						</td>
					</tr>
					<tr>
						<td style="font-size:14px;">이메일</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="memberEmail" id="memail" class="focusB" placeholder="이메일을 입력해주세요.">
							<div class="memailResult bottom"></div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btnStyle2">확인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>