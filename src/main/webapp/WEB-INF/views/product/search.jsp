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
<link href="${conPath}/css/product_search.css" rel="stylesheet">
</head>
<body>
	
	<jsp:include page="../main/header.jsp"/>
	
	<div class="container">
	
		<h1 class="heading">SEARCH</h1>
		
		<div class="search-view py-5">
			<form action="${conPath}/product/search.do" class="d-flex justify-content-center mysearch">
				<input type="text" name="searchName" value="${param.searchName}" class="mysearchName">
				<input type="submit" class="searchP">
			</form>
		</div>
		
		<p class="text-center pb-5">총 ${paging.totCnt}개의 상품이 검색되었습니다.</p>
		
		
		<div class="d-flex justify-content-evenly d4d4">
		
			<c:forEach items="${productList}" var="product" varStatus="i">
				<c:if test="${i.index!=0 and i.index%4 eq 0}">
					</div>
					<div class="d-flex justify-content-evenly d4d4">
				</c:if>
				<!-- 상품 시작 -->
				<div class="card border-0 rounded-0" id="${product.productCode}" style="width: 18rem;">
				  <img src="${conPath}/productImage/${product.image}" class="card-img-top rounded-0">
				  <div class="card-body">
				    <h5 class="card-title pb-1 mb-0">${product.productName}</h5>
				    <p class="card-text">
				    	<span style="color:#BE8D6E">
				    	<c:if test="${product.productDiscount ne 0}">
							<del><small><fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원</small></del>
							<br>
							<fmt:formatNumber value="${product.productPrice-(product.productPrice*(product.productDiscount/100))}" pattern="#,###"/>원
						</c:if>
						<c:if test="${product.productDiscount eq 0}">
							<fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원
						</c:if>
				    	</span>
				    </p>
				  </div>
				</div>
				<!-- 상품 끝 -->
				
			</c:forEach>
		
		</div>
		
		<c:if test="${paging.totCnt > paging.pageSize}">
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
		</c:if>
		
	</div>
	
	<jsp:include page="../main/footer.jsp"/>

<script>
	$(function(){
		
		$('.card img, .card-title, .card-text').click(function(){
			var productCode = $(this).parents('.card').attr('id');
			location.href = '${conPath}/product/content.do?productCode='+productCode;
		});
		
	});
	
	$('.mysearch').submit(function(){
		var sname = $('.mysearchName').val();
		if(sname.trim() == ''){
			alert('빈칸은 검색할 수 없습니다');
			return false;
		}
	});
</script>

</body>
</html>