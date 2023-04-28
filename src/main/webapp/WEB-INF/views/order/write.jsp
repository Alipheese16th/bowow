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
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div class="container">
		
		<h1>주문서 작성</h1>
		<c:forEach var="cartNum" items="${cartNumList}">
			${cartNum}
			<hr>
		</c:forEach>
		
		
		
	</div>
	<jsp:include page="../main/footer.jsp"/>

</body>
</html>