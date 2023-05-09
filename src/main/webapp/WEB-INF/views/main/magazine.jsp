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
	width:100%;
	min-width:1500px;
	font-family: 'Pretendard';
}
.contain .fisrtImg{
	overflow:hidden;
}
.contain img:hover{
	transform: scale(1.1);
  	transition: transform 1s;
}
.contain .firstText{
	padding:50px;
}
.contain .firstText h1{
	margin-bottom:10px;
	font-weight:normal;
	font-size:1.8rem;
}
.contain .firstText p{
	font-size:0.8rem;
	font-wegiht:300;
}
</style>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>
	
	<div class="contain">
		
		
		<div class="d-flex">
            <div class="fisrtImg w-50">
            	<img class="d-block w-100" style="height:600px;" src="//arrr.kr/web/product/medium/202205/447e333e20c556280da027c55875be6f.png">
            </div>
            <div class="firstText w-50" style="background-color:#84b8d1">
            	<h1 class="name hgg">
            	Bowow' lifestyle on the table
            	</h1>
            	<p>바우와우가 만드는 순수한 영양 테이블</p>
            </div>
        </div>
        
		<div class="d-flex">
            <div class="firstText w-50" style="background-color:#ffebcd">
            	<h1 class="name hgg">
            	여행하듯 산책하기<br>
            	함께 걷는 행복의 길
            	</h1>
            	<p>나만의 휴식공간에 동물친구와 함께</p>
            </div>
            <div class="fisrtImg w-50">
            	<img class="d-block w-100" style="height:600px;" src="//arrr.kr/web/product/medium/202202/08e1b94079edc6c443431f008d78a8ff.jpg">
            </div>
        </div>
        
		<div class="d-flex">
			<div class="fisrtImg w-50">
            	<img class="d-block w-100" style="height:600px;" src="//arrr.kr/web/product/medium/202107/35385294c454b6f920893b070530e618.jpg">
            </div>
            <div class="firstText w-50" style="background-color:#d6ebed">
            	<h1 class="name hgg">
            	애개육아,<br>
            	우리는 함께라서 행복한 걸요
            	</h1>
            	<p>
            		바우와우가 들려주는 특별한 이야기.<br>
            		연우 맘의 애개육아 라이프 스타일을 소개합니다.
            	</p>
            </div>
        </div>
        
		<div class="d-flex">
            <div class="firstText w-50" style="background-color:#e4f66d">
            	<h1 class="name hgg">
            	summer with po-ong bag
            	</h1>
            	<p>
            	싱그러운 여름을 맞이하는 포옹백의 S/S 룩북
            	</p>
            </div>
            <div class="fisrtImg w-50">
            	<img class="d-block w-100" style="height:600px;" src="//arrr.kr/web/product/medium/202106/aa30ba19099db36af014ab4e5b688c38.jpg">
            </div>
        </div>
        
		<div class="d-flex">
			<div class="fisrtImg w-50">
            	<img class="d-block w-100" style="height:600px;" src="//arrr.kr/web/product/medium/202101/5e8a21fee2ab3e65b08df3a9dacd74f4.jpg">
            </div>
            <div class="firstText w-50" style="background-color:#dbccb8">
            	<h1 class="name hgg">
            	반려동물과의 여행?<br>
            	별로 어렵지 않아요
            	</h1>
            	<p>
            	캡핑만렙 콘이네 가족의<br>
            	함께 여행 꿀팁
            	</p>
            </div>
        </div>
        
		<div class="d-flex">
            <div class="firstText w-50" style="background-color:#cfd5cb">
            	<h1 class="name hgg">
            	내겐 편안한 공간이<br>
            	아이들에겐 위험하다면?
            	</h1>
            	<p>
            	모두에게 편안한 공간을 만들기 위해<br>
            	바우와우가 생각한 것
            	</p>
            </div>
            <div class="fisrtImg w-50">
            	<img class="d-block w-100" style="height:600px;" src="//arrr.kr/web/product/medium/202101/81e2e9b2ae7f9275bb6da392a51a0eb3.jpg">
            </div>
        </div>
        
		<div class="d-flex">
			<div class="fisrtImg w-50">
            	<img class="d-block w-100" style="height:600px;" src="//arrr.kr/web/product/medium/202101/e23210b95305f6418eb47b4797bda512.jpg">
            </div>
            <div class="firstText w-50" style="background-color:#eedbcc">
            	<h1 class="name hgg">
            	이왕 해야 하는 외출이라면<br>
            	더 행복하게 할 수 있도록
            	</h1>
            	<p>
            	바우와우의 산책용품<br>
            	허밍 라인의 기획 이야기를 소개합니다.
            	</p>
            </div>
        </div>
		
		<div class="d-flex">
            <div class="firstText w-50" style="background-color:#e8e1c8">
            	<h1 class="name hgg">
            	Our Humming Collection
            	</h1>
            	<p>
            	즐거운 야외 활동에 필요한 아르르 허밍 라인을 소개할게요.
            	</p>
            </div>
            <div class="fisrtImg w-50">
            	<img class="d-block w-100" style="height:600px;" src="//arrr.kr/web/product/medium/202101/e01bfd6a5457733e7d83e90989107c6d.jpg">
            </div>
        </div>
		
		
		
	</div>
	<jsp:include page="../main/footer.jsp"/>
	
</body>
</html>