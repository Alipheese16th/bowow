<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/styles.css" rel="stylesheet" />	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<style>
		.qna {width: 700px; text-align: center; margin: 0 auto;}
		.qna h1 {text-align: center; height: 100px; line-height: 100px;}
		.qna .select {text-align: center;}
		.qna .form-label {left: 0;}
		.qna .form-control {border: 1px solid #BE8D6E;}
		.qna label {font-size: 1.2em; font-weight: bold; margin-right: 600px;}
		.qna textarea {height: 200px;}
		.qna .btn {
			background: #BE8D6E; font-size: 1.2em;
			width: 200px; margin-bottom: 20px; text-align: center;
		}
		.qna .btn:hover {
			background: gray;
			border: 1px solid lightgray;
			font-weight: bold;
		}
		.qna .input {text-align: center; min-width: 620px;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- bootstrap-select -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/css/bootstrap-select.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/bootstrap-select.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.my-select').selectpicker();
			
			$('select').change(function() {
				var productCode = $(this).val();
				$('form.select').submit();
			});
		});
	</script>
</head>
<body>
	<c:if test="${empty member and empty admin }">
		<script>
			alert('로그인 후 작성이 가능합니다');
			location.href='${conPath}/login.do?after=qna/write.do';
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp"/>
	
	<div class="qna">
		<h1>상품문의 작성</h1>
		<div class="select">
			<form action="${conPath }/qna/write.do" method="get" class="select">
				<select id="selectId" name="selectCode" class="selectpicker my-select" data-live-search="true">
					<option>상품명을 입력해주세요</option>
					<c:forEach var="product" items="${productList }">
						<option value="${product.productCode }"
							<c:if test="${product.productCode eq param.selectCode}">selected="selected"</c:if>
						>
							${product.productName }
						</option>
					</c:forEach>
				</select>
			</form>
			
			<c:forEach var="product" items="${productList }">
				<c:if test="${product.productCode eq param.selectCode}">
					${product.productName }<br>
					<img src="${conPath }/productImage/${product.image}" style="width: 150px;">
				</c:if>
			</c:forEach>
			
			<%-- <c:if test="${empty product.image }">
				이미지 없음
			</c:if>
			<c:if test="${not empty product.image }">
				<img src="${conPath }/productImage/${product.image}">
			</c:if>
			 --%>
		</div>
		 
		<form action="${conPath }/qna/write.do" method="post">
			<c:forEach var="product" items="${productList }">
				<c:if test="${product.productCode eq param.selectCode}">
					<input type="hidden" name="productCode" value="${product.productCode}">
				</c:if>
			</c:forEach>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">제목</label>
				<input type="text" name="qnaTitle" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해주세요" required="required">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">내용</label>
				<textarea name="qnaContent" class="form-control" id="exampleFormControlTextarea1" rows="2" placeholder="내용을 입력해주세요" required="required" style="max-height: 500px;"></textarea>
			</div>
			<!-- <div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">파일첨부</label>
				<input type="file" class="form-control" id="exampleFormControlInput1">
			</div> -->
			<div class="input">
				<input class="btn btn-primary form-control" type="submit" value="작성하기">
			</div>
		</form>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>