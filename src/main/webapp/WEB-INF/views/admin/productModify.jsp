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
<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="${conPath}/js/summernote.js"></script>
<style>
.container{
	min-width: 1000px;
	margin-left:280px;
	font-family: 'Pretendard';
}
.btn-outline-myColor{
	background-color:#FFFFFF;
	color:#BE8D6E;
	border:1px solid #BE8D6E;
}
.btn-outline-myColor:hover{
	background-color:#BE8D6E;
	color:white;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div class="container">
	
		<jsp:include page="side.jsp"/>
		
		<h1 class="my-5 text-center">상품 수정</h1>
		
		<div id="insertProduct">
			<form action="${conPath}/product/modify.do" method="post">
				<input type="hidden" name="productCode" value="${product.productCode}">
				<table class="table">
					<tr>
						<th>상품명</th>
						<td>
							<input type="text" name="productName" class="form-control" required="required" value="${product.productName}">
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<select name="category" class="form-select">
								<option <c:if test="${product.category eq 'fashion'}">selected="selected"</c:if> value="fashion">패션</option>
								<option <c:if test="${product.category eq 'food'}">selected="selected"</c:if> value="food">사료</option>
								<option <c:if test="${product.category eq 'toy'}">selected="selected"</c:if> value="toy">장난감</option>
								<option <c:if test="${product.category eq 'walking'}">selected="selected"</c:if> value="walking">산책</option>
								<option <c:if test="${product.category eq 'clean'}">selected="selected"</c:if> value="clean">목욕</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상품설명</th>
						<td>
							<textarea id="summernote" name="productContent">${product.productContent}</textarea>
						</td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td>
							<input type="number" name="productPrice" class="form-control" value="${product.productPrice}" required="required">
						</td>
					</tr>
					<tr>
						<th>상품할인율</th>
						<td>
							<input type="number" name="productDiscount" class="form-control" value="${product.productDiscount}">
						</td>
					</tr>
					<tr>
						<th>상품재고</th>
						<td>
							<input type="number" name="productStock" class="form-control" value="${product.productStock}" required="required">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit" class="btn btn-outline-myColor" value="상품 수정">
							<input type="button" class="btn btn-outline-myColor list" value="목록으로">
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<input type="hidden" class="pageNum" value="${param.pageNum}">
		<input type="hidden" class="searchName" value="${param.searchName}">
	</div><!-- container -->
	<jsp:include page="../main/footer.jsp"/>
<script>
$('.list').click(function(){
	var pageNum = $('.pageNum').val();
	var searchName = $('.searchName').val();
	location.href='${conPath}/product/manage.do?pageNum='+pageNum+'&searchName='+searchName;
});
</script>
</body>
</html>