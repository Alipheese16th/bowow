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
	<link href="${conPath}/css/main.css">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<style>
		#content{height:800px; width:100%; margin:0 auto;}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content"></div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>