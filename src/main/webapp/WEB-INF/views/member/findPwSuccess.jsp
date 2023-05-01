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
		body{font-family:'Pretendard';}
		#content-form{
			padding-top:100px;
			margin-bottom:60px;
			min-width:1250px;
			background:#fff;
			padding-bottom:80px;
			height:auto;
			min-height:100%;
			padding-bottom:110px;
			text-align: center;
		}
		#content-form .findPw-wrap{
		    max-width: 400px;
		    padding: 0px 30px 30px;
		    margin: auto;
		    position: relative;
		    background-color: white;
		}
		#content-form .findPw-wrap img{
	  		display: block;
		    width: 54px;
		    height: 54px;
		    margin: 0px auto 20px;
		 }
		#content-form .findPw-wrap .findPw-title{
		    font-weight: 400;
		    font-size: 18px;
		    line-height: 18px;
		}
		#content-form .findPw-wrap .findPw-title span{
		  	color:#BE8D6E;
		  	font-weight:600;
		}
		#content-form .findPw-wrap .findPw-sub{
		  	margin-top:14px;
		  	color: rgb(153, 153, 153);
			font-size:14px;
			font-weight:400;
		}
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
		<div class="findPw-wrap">
			<img src="${conPath}/img/mail-icon.png" alt="메일아이콘">
			<div class="findPw-title"><span>${memberEmail}</span>으로
				<div style="padding-top: 5px;">비밀번호가 발송 되었어요.</div>
			</div>
			<div class="pw-content">
				<p class="findPw-sub">5분 후에도 메일이 오지 않는다면<br> 스팸함을 확인해 주세요.</p>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>