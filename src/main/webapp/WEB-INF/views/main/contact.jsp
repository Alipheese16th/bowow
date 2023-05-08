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
.contain{
	font-family: 'Pretendard';
	width:100%;
}

.heading{
	text-align:center;
	margin:40px auto;
	font-size:2rem;
}
.imgarea{
	width:50%;
}
.textarea{
	width:50%;
}
iframe{
	border:0; 
	width:100%;
	height:750px;
}

</style>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>
	
	<div class="contain d-flex">
		
<!-- 		<h1 class="heading">CONTACT</h1> -->
		
		
		<div class="imgarea">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1581.4723717818583!2d126.93872353893309!3d37.556365619343644!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9890cc37f7a9%3A0x66f62c68cb1dab51!2z7J207KCg7JWE7Lm0642w66-47Lu07ZOo7YSw7ZWZ7JuQIOyLoOy0jOy6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1683449046953!5m2!1sko!2skr" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
		
		<div class="textarea d-flex align-items-center">
		
        	<div class="w-100 mx-5 ps-2">
		        <h1 class="pb-4">
		        	CONTACT
		        </h1>
		        <span style="font-size:1.2rem;">
			                서울특별시 서대문구 104-48 은하빌딩
		        </span>
		        <br>
		        02-393-4321
		        <br>
		       <p class="pt-2" style="font-weight:lighter">
		       	Your dog loves you and we love you,too!
		       </p>
        	</div>
        	
       </div>
		
		
	</div><!-- container -->
	<jsp:include page="../main/footer.jsp"/>
	
</body>
</html>