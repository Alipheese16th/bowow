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
		.faq {min-width: 1400px;}
		.faq h1 {text-align: center; height: 100px; line-height: 100px;}
		.faq .form-label {left: 0;}
		.faq .form-control {border: 1px solid #BE8D6E;}
		.faq label {font-size: 1.2em; font-weight: bold;}
		.faq textarea {height: 300px;}
		.faq .btn {
			background: #BE8D6E; font-size: 1.2em;
			width: 200px; margin-bottom: 20px; text-align: center;
		}
		.faq .btn:hover {
			background: gray;
			border: 1px solid lightgray;
			font-weight: bold;
		}
		.faq .input {text-align: center; min-width: 620px;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- bootstrap-select -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/css/bootstrap-select.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/bootstrap-select.min.js"></script>
</head>
<body>
	<c:if test="${empty admin }">
		<script>
			alert('접근 제한 페이지 입니다');
			history.back();
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp"/>
	
	<div class="faq">
		<h1>FAQ 게시판 작성</h1>
		 
		<form action="${conPath }/faq/write.do" method="post">
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">제목</label>
				<input type="text" name="faqTitle" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해주세요" required="required">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">내용</label>
				<textarea name="faqContent" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용을 입력해주세요" required="required"></textarea>
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