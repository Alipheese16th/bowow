<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.container{
	min-width: 1300px !important;
	font-family: 'Pretendard';
}
.btn-outline-myColor{
	background-color:#FFFFFF;
	color:#BE8D6E;
	border:1px solid #BE8D6E;
}
.btn-outline-myColor:hover{
	background-color:#BE8D6E;
	color:white;
}
</style>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>
	
	<div class="container">
		
		<div class="d-flex justify-content-center text-center m-5 pt-5">
			    
			    <h1>
			    	<i class="bi bi-exclamation-triangle-fill"></i>
			    	죄송합니다<br>
			    	<br>
			    	현재 공사중입니다<br>
			    	불편을 드려 죄송합니다<br>
			    </h1>
			    
			    </div>
			    <div class="d-flex justify-content-center py-5 m-5">
				    <button type="button" class="btn btn-outline-myColor btn-lg" 
					    	onclick="history.back()">뒤로가기</button>
					    	&nbsp;  	&nbsp;  	&nbsp;
					<button type="button" class="btn btn-outline-myColor btn-lg" 
					    	onclick="location.href='${conPath}/main.do'">홈페이지</button>
			    </div>
			    
			    <div class="py-3"></div>
			    <div class="py-5"></div>
		
	</div>
	<jsp:include page="../main/footer.jsp"/>
	
</body>
</html>