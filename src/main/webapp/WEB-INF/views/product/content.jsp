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

<jsp:include page="../main/header.jsp"/>

<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.container{
	min-width: 1500px !important;
}
.titleImage, .content{
	width:600px;
	height:600px;
}

</style>
</head>
<body>
	
	<div class="container">
		
		<div class="d-flex justify-content-center">
			
			<c:forEach items="${imageList}" var="image">
				<c:if test="${image.type eq 'title'}">
					<img src="${conPath}/productImage/${image.image}" class="titleImage">
				</c:if>
			</c:forEach>
			
			
			<div class="content">
				<p>asdfasfd</p>
				<p>asdfasfd</p>
				<p>asdfasfd</p>
				<p>asdfasfd</p>
			</div>
			
		</div>
		
		
		
		
		
		
	</div>
	<jsp:include page="../main/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>