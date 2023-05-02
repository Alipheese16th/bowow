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
<!-- bootstrap-select -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${conPath}/css/ratingList.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/bootstrap-select.min.js"></script>
<style>
.container{
	min-width: 1535px !important;
	margin-left:280px;
	font-family: 'Pretendard';
}
</style>
</head>
<body>

	<c:if test="${not empty registerProductResult}">
		<script>
			alert('${registerProductResult}');
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp"/>
	<div class="container">
		<div class="row">
			<jsp:include page="side.jsp"/>
			
			<div class="col-9">
				<h1 class="my-5 text-center">상품 등록</h1>
				
				<div class="insertProduct">
					<form action="${conPath}/product/insertProduct.do" method="post">
						<table class="table">
							<tr>
								<th>상품명</th>
								<td>
									<input type="text" name="productName" class="form-control" required="required">
								</td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td>
									<select name="category" class="form-select">
										<option value="fashion">패션</option>
										<option value="food">사료</option>
										<option value="toy">장난감</option>
										<option value="walking">산책</option>
										<option value="clean">목욕</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>상품설명</th>
								<td>
									<pre><textarea id="summernote" name="productContent"></textarea></pre>
								</td>
							</tr>
							<tr>
								<th>상품가격</th>
								<td>
									<input type="number" name="productPrice" class="form-control" required="required">
								</td>
							</tr>
							<tr>
								<th>상품할인율</th>
								<td>
									<input type="number" name="productDiscount" class="form-control">
								</td>
							</tr>
							<tr>
								<th>상품재고</th>
								<td>
									<input type="number" name="productStock" class="form-control" required="required">
								</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center">
									<input type="submit" class="btn btn-primary" value="상품 등록하기">
								</td>
							</tr>
						</table>
					</form>
				</div>
				
				<h1 class="my-5 text-center">상품이미지 등록</h1>
				
				<div class="insertImage">
					<form action="${conPath}/product/insertImage.do" method="post" enctype="multipart/form-data">
						<table class="table">
							<tr>
								<th>상품</th>
								<td>
									<select name="productCode" class="selectpicker" data-live-search="true">
										<c:forEach var="product" items="${productList}">
											<option value="${product.productCode}"
												<c:if test="${product.productCode eq productCode}">
													selected="selected"
												</c:if>
											>${product.productName}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>타입</th>
								<td>
									<select name="type" class="form-select">
										<option value="content">본문이미지</option>
										<option value="title">대표이미지</option>
										<option value="subTitle">서브타이틀이미지</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>상품이미지파일</th>
								<td>
									<input type="file" name="imageTemp" class="form-control">
								</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center">
									<input type="submit" class="btn btn-primary" value="이미지 등록하기">
								</td>
							</tr>
						</table>
					</form>
				</div>
				
				
				
				
				
			</div><!-- col-9 -->
			
		</div><!-- row -->
	</div><!-- container -->
	<jsp:include page="../main/footer.jsp"/>

</body>
</html>