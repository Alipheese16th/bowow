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

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="${conPath}/js/summernote.js"></script>
<style>
.container{
	min-width: 1300px !important;
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
				
				<div>
					<form action="${conPath}/product/insert.do" method="post">
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
				
			</div>
			
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>

</body>
</html>