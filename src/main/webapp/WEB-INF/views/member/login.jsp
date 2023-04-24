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
	<style>
		#content{
		height:800px;width:100%;}
	</style>
</head>
<body>
	<jsp:forward page="../main/header.jsp"/>
	가나다라마바사아자차카타파하
	<div id="content"></div>
	<jsp:forward page="../main/footer.jsp"/>
	
</body>
</html>