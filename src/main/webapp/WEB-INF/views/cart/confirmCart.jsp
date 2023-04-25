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
<style>
.container{
	min-width: 1500px !important;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div class="container">
		
		<h1>${result }</h1>
		
		${productCode}
		<br>
		<hr>
		<br>
		${memberId}
		<br>
		<hr>
		<br>
		<c:forEach items="${sizeNum}" var="size">
			${size} / 
		</c:forEach>
		
		<br>
		<hr>
		<br>
		<c:forEach items="${colorNum}" var="color">
			${color} / 
		</c:forEach>
		<br>
		<hr>
		<br>
		<c:forEach items="${qty}" var="q">
			${q} / 
		</c:forEach>
		
		
	</div>
	<jsp:include page="../main/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>