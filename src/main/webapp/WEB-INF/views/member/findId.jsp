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
		.confirm-btn{
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
		let mnameOk = false;
		let memail = false;
		$(document).ready(function(){
			const patternName = /^[a-zA-Z가-힣]{1,}$/; // 이름 정규표현식 
			const patternMail = /^\w+@\w+(\.\w+){1,2}$/; // 이메일 정규표현식
			var memberName, memberEmail;
			$("#mname").keyup(function(){
				//mnameOk = false;
				memberName = $(this).val();
				if(!memberName){
					$(".mnameResult").html("<p style='color:red;'>가입 시 등록한 이름을 입력해 주세요.</p>");
				}else if(!memberName.match(patternName)){
					$(".mnameResult").html("<p style='color:red;'>한글과 영문 대 소문자를 사용하세요.</p>");
				}else{
					$(".mnameResult").html("");
					mnameOk= true;
				}
				if(mnameOk &&  memail){
					$(".confirm-btn").css("background", "#BE8D6E").css("color", "#fff");
				}else{
					$(".confirm-btn").css("background", "#f1f1f1");
				}
			}); // 이름 keyup이벤트
			$("#memail").keyup(function(){
				//memail = false;
				memberEmail = $(this).val();
				if(!memberEmail){
					$(".memailResult").html("<p style='color:red;'>가입 시 등록한 이메일을 입력해 주세요.</p>");
				}else if(!memberEmail.match(patternMail)){
					$(".memailResult").html("<p style='color:red;'>이메일 형식으로 입력해 주세요.</p>");
				}else{
					$(".memailResult").html("");
					memail = true;
				}
				if(mnameOk &&  memail){
					$(".confirm-btn").css("background", "#BE8D6E").css("color", "#fff");
				}else{
					$(".confirm-btn").css("background", "#f1f1f1");
				}
			});
			$("form").submit(function(){
				var mnameResult = $(".mnameResult").text().trim();
				var memailResult = $(".memailResult").text().trim();
				if(!mnameResult == "" || !memberName){
					alert("이름을 입력해주세요.");
					$("#mname").focus();
					return false;
				}else if(!memailResult == ""|| !memberEmail){
					alert("이메일을 입력해주세요.");
					$("#memail").focus();
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<c:if test="${not empty param.asdf}">
		<script>
			alert('가입 시 입력하신 회원 정보가 맞는지 다시 한번 확인해 주세요.');
		</script>
	</c:if>
	<c:if test="${not empty member}">
		<script>
			location.href="${conPath}/main.do";
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content-form">
		<div class="login-title">아이디 찾기</div>
		<div class="login-wrap">
			<form action="findId.do" method="post" autocomplete="off">
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
							<button type="submit" class="confirm-btn">확인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>