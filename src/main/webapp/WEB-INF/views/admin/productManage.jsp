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
	min-width: 1000px;
	margin-left:280px;
	font-family: 'Pretendard';
}

.pagination > li > a:focus,
.pagination > li > a:hover,
.pagination > li > span:focus,
.pagination > li > span:hover{
    color: white;
    background-color: #BE8D6E;
    border-color: #BE8D6E;
}
.pagination > li > a{
    background-color: white;
    color: #BE8D6E;
}
.pagination > .disabled > a{
    color: #BE8D6E;
    background-color: white;
}
.pagination > .active > a{
    color: white;
    background-color: #BE8D6E;
    border-color: #BE8D6E;
}
.pagination > .active > a:hover{
    background-color: #9E6D4E;
}
.mybtn{
	background: #white;
	color: #BE8D6E;
	border-color:#BE8D6E;
}
.mybtn:hover{
	background: #BE8D6E;
	color: white;
}
.listImage{
	width:20px;
	height:20px;
}
.table tr td:not(.left){
	text-align:center;
}
.table tr td{
	vertical-align: middle;
}
</style>
</head>
<body>
	<c:if test="${not empty modifyResult}">
		<script>
			alert('${modifyResult}');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div class="container">
		
		<jsp:include page="side.jsp"/>
		
		<h1 class="my-5 text-center">상품 검색 조회 및 수정 삭제</h1>
		
		
		<form action="${conPath}/product/manage.do" class="d-flex justify-content-center formp">
			<input type="text" name="searchName" class="form-control w-25 qp"> &nbsp;
			<input type="hidden" name="pageNum" class="pageNum" value="${paging.currentPage}">
			<input type="submit" value="검색" class="btn mybtn">
		</form>
		
		<p class="text-center pb-5">총 ${paging.totCnt}개의 상품이 검색되었습니다.</p>
		
		<table class="table table-striped mx-2">
			<thead>
				<tr class="text-center">
					<th>대표이미지</th>
					<th>상품코드</th>
					<th>카테고리</th>
					<th>상품명</th>
					<th>가격</th>
					<th>할인율</th>
					<th>등록일</th>
					<th>재고</th>
					<th>조회수</th>
					<th>상태</th>
					<th>판매여부</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:if test="${productList.size() eq 0}">
					<tr><td colspan="5">해당 페이지의 글이 없습니다</td></tr>
				</c:if>
				<c:if test="${productList.size() ne 0}">
					<c:forEach var="product" items="${productList}">
						<tr>
							<td class="pimage"><img class="listImage" src="${conPath}/productImage/${product.image}"></td>
							<td>${product.productCode}</td>
							<td>${product.category}</td>
							<td class="left ptitle">${product.productName}</td>
							<td>${product.productPrice}</td>
							<td>${product.productDiscount}</td>
							<td>
								<fmt:formatDate value="${product.productDate}" pattern="yy/MM/dd"/>
							</td>
							<td>${product.productStock}</td>
							<td>${product.productHit}</td>
							<td>
								<c:if test="${product.productUsed eq 'Y'}">판매중</c:if>
								<c:if test="${product.productUsed eq 'N'}">판매정지</c:if>
							</td>
							<td>
								<button type="button" class="btn mybtn change" id="${product.productCode}">전환</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		
		<!-- 페이지 네비게이션 시작 -->
		<nav aria-label="Page navigation example pt-5 mt-5">
		  <ul class="pagination pagination-sm justify-content-center">
		  	<c:if test="${paging.startPage <= paging.blockSize}">
			    <li class="page-item disabled">
				    <a class="page-link">
				    <span aria-hidden="true">&laquo;</span>
				    </a>
			    </li>
	   	 	</c:if>
	   	 	<c:if test="${paging.startPage > paging.blockSize}">
			    <li class="page-item">
				    <a class="page-link" href="${conPath}/product/manage.do?searchName=${param.searchName}&pageNum=${paging.startPage-1}">
				    <span aria-hidden="true">&laquo;</span>
				    </a>
			    </li>
	    	</c:if>
	   	 	
	   	 	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
	   	 		<c:if test="${i eq paging.currentPage}">
					<li class="page-item active"><a class="page-link">${i}</a></li>
				</c:if>
	   	 		<c:if test="${i ne paging.currentPage}">
					<li class="page-item"><a class="page-link" href="${conPath}/product/manage.do?searchName=${param.searchName}&pageNum=${i}">${i}</a></li>
				</c:if>
	   	 	
	   	 	</c:forEach>
	   	 	
	   	 	<c:if test="${paging.endPage < paging.pageCnt}">
				<li class="page-item">
					<a class="page-link" href="${conPath}/product/manage.do?searchName=${param.searchName}&pageNum=${paging.endPage+1}">
					<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
	   	 	<c:if test="${paging.endPage >= paging.pageCnt}">
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
$('.formp').submit(function(){
	var qp = $('.qp').val();
	if(qp.trim() == ''){
		alert('빈칸은 검색할 수 없습니다');
		return false;
	}
});

$('.ptitle, .pimage').css('cursor','pointer').click(function(){
	var productCode = $(this).parents('tr').find('.change').attr('id');
	var searchName = $('.qp').val();
	var pageNum = $('.pageNum').val();
	location.href = "${conPath}/product/modify.do?productCode="+productCode+'&searchName='+searchName+'&pageNum='+pageNum;
});

$('.change').click(function(){
	var productCode = $(this).attr('id');
	var searchName = $('.qp').val();
	var pageNum = $('.pageNum').val();
	location.href='${conPath}/product/change.do?productCode='+productCode+'&searchName='+searchName+'&pageNum='+pageNum;
});

</script>
</body>
</html>