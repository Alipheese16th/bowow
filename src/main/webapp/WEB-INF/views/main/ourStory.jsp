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

.heading{
	text-align:center;
	margin:40px auto;
	font-size:2rem;
}
.section{
	text-align:center;
	margin:0 auto;
}
.section ul{
	list-style:none;
}
</style>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>
	
	<div class="container">
		
		<h1 class="heading">OUR STORY</h1>
		
		<div class="section">
			
		   		<ul>
			   		<li class="text">
			           <h1 class="pt-3">
				              반려동물과 함께하는<br>
				              따뜻한 삶을 위한<br>
				              라이프 스타일 브랜드
			           </h1>
			           <p class="py-5" style="font-size:1.2rem;">     
				               저희는 강아지의 울음소리를 뜻하는 반려동물 용품 디자인 브랜드입니다.<br>
				               반려동물과 그의 가족이 함께 입고 나누는 커플템을 만들면서 여러분에게 행복을 선사하고 싶습니다.<br>
			          </p>
			       </li>
		           
		       		<li><img class="py-3" src="${conPath}/img/ourStory.jpg"></li>
		       
			       <li class="text">
			            <p class="py-5" style="font-size:1.2rem;">
				              함께 입고 나누며 기록하는 즐거움을 알아가는 여러분들이 있기에 BOWOW는 반려동물과 함께 하는 삶에 대해서 생각합니다.<br>
				              언제 어디서나 BOWOW를 더하면 따스함과 웃음이 넘쳐나도록<br>
				              여러분의 시간과 공간에 천천히 스며들며 사랑을 더하는 디자인을 만들겠습니다. 
			           </p>
			       </li>    
		       
		       		<li>
		    		<iframe class="py-3" width="1113" height="626" src="https://www.youtube.com/embed/huaqvpwERsI" title="YouTube video player" frameborder="0"></iframe>
    			    </li>
    			</ul>
			
		</div><!-- section -->
		
	</div><!-- container -->
	<jsp:include page="../main/footer.jsp"/>
	
</body>
</html>