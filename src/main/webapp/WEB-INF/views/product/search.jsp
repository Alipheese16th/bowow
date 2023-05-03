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

.pagination > li > a{
    background-color: white;
    color: #5A4181;
}

.pagination > li > a:focus,
.pagination > li > a:hover,
.pagination > li > span:focus,
.pagination > li > span:hover{
    color: #5a5a5a;
    background-color: #eee;
    border-color: #ddd;
}

.pagination > .active > a{
    color: white;
    background-color: #444444 !Important;
    border: solid 1px #444444 !Important;
}

.pagination > .active > a:hover{
    background-color: #444444 !Important;
    border: solid 1px #444444;
}

.card img, .card-title, .card-text{
	cursor:pointer;
}


.search-view{
	border:1px solid #000;
	position: relative;
    font-size: 25px;
    width: 100%;
    outline: none;
    border: 0;
    line-height: 40px;
    overflow: hidden;
    background-color: rgba(255,255,255,1);
}

.search-view input[type='text']{
	outline: none;
    font-size: 100%;
    font-family: 'Noto Sans KR', sans-serif;
    color: #111111;
    vertical-align: middle;
    width:50%;
    padding:10px;
    border:none;
    border-bottom:2px solid #000;
    position:relative;
}
.searchP{
	width:30px;
	height:30px;
	text-align:center;
	margin-left:20px;
	font-size: 0px;
	border:none;
	background:url("../img/search.png")center no-repeat;
	background-size:30px;
}

</style>
</head>
<body>
	
	<jsp:include page="../main/header.jsp"/>
	
	<div class="container py-5">
	
		<h3 class="text-center">SEARCH</h3>
		
		<div class="search-view py-5">
			<form action="${conPath}/product/search.do" class="d-flex justify-content-center">
				<input type="text" name="searchName">
				<input type="submit" class="searchP">
			</form>
		</div>
		
		<p class="text-center pb-5">총 ${paging.totCnt}개의 상품이 검색되었습니다.</p>
		
		
		<div class="d-flex justify-content-evenly">
			
			<c:forEach items="${productList}" var="product" varStatus="i">
			<c:if test="${product.productUsed eq 'Y'}">
			
				<div class="card border-0 rounded-0" id="${product.productCode}" style="width: 18rem;">
				  <img src="${conPath}/productImage/${product.image}" class="card-img-top rounded-0">
				  <div class="card-body">
				    <h5 class="card-title pb-1 mb-0">${product.productName}</h5>
				    <p class="card-text">${product.productPrice}원</p>
				  </div>
				</div>
				
				<c:if test="${i.count%4 eq 0}">
				
				</div>
				<div class="d-flex justify-content-evenly">
				
				</c:if>
				
			</c:if>
			</c:forEach>
		
		</div>
		
		
		<!-- 페이지 네비게이션 시작 -->
		<nav aria-label="Page navigation example pt-5 mt-5">
		  <ul class="pagination pagination-sm justify-content-center">
		  	<c:if test="${paging.startPage <= paging.blockSize }">
			    <li class="page-item disabled">
				    <a class="page-link">
				    <span aria-hidden="true">&laquo;</span>
				    </a>
			    </li>
	   	 	</c:if>
	   	 	<c:if test="${paging.startPage > paging.blockSize }">
			    <li class="page-item">
				    <a class="page-link" href="${conPath}/product/search.do?searchName=${param.searchName}&pageNum=${paging.startPage-1}">
				    <span aria-hidden="true">&laquo;</span>
				    </a>
			    </li>
	    	</c:if>
	   	 	
	   	 	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
	   	 		<c:if test="${i eq paging.currentPage }">
					<li class="page-item active"><a class="page-link">${i}</a></li>
				</c:if>
	   	 		<c:if test="${i ne paging.currentPage }">
					<li class="page-item"><a class="page-link" href="${conPath}/product/search.do?searchName=${param.searchName}&pageNum=${i}">${i}</a></li>
				</c:if>
	   	 	
	   	 	</c:forEach>
	   	 	
	   	 	<c:if test="${paging.endPage < paging.pageCnt }">
				<li class="page-item">
					<a class="page-link" href="${conPath}/product/search.do?searchName=${param.searchName}&pageNum=${paging.endPage+1}">
					<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
	   	 	<c:if test="${paging.endPage >= paging.pageCnt }">
				<li class="page-item disabled">
					<a class="page-link">
					<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		    
		  </ul>
		</nav>
		<!-- 페이지 네비게이션 끝 -->
		
	</div>
	
	<jsp:include page="../main/footer.jsp"/>

<script>
	$(function(){
		
		$('.card img, .card-title, .card-text').click(function(){
			var productCode = $(this).parents('.card').attr('id');
			location.href = '${conPath}/product/content.do?productCode='+productCode;
		});
		
	});
</script>

</body>
</html>