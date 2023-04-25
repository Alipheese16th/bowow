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
		h1 {
			text-align: center; height: 100px; line-height: 100px;
			min-width: 620px; font-size: 30px;
		}
		.form-control {border: 1px solid #BE8D6E;}
		label {font-size: 1.2em; font-weight: bold;}
		textarea {height: 300px;}
		.btn {
			background: #BE8D6E; font-size: 1.2em; border: 1px solid #BE8D6E;
			width: 200px;
		}
		.btn:hover {
			background: gray;
			border: 1px solid lightgray;
			font-weight: bold;
		}
		.input {
			text-align: center;
			min-width: 620px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<h1>${param.qnaNum }번 상품문의 게시판 수정</h1>
	<form action="${conPath }/qna/modify.do" method="post">
	<input type="hidden" name="pageNum" value="${param.pageNum }">
	<input type="hidden" name="qnaNum" value="${qna.qnaNum }">
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">제목</label>
			<input type="text" class="form-control" id="exampleFormControlInput1" value="${qna.qnaTitle }" required="required">
		</div>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" required="required">${qna.qnaContent }</textarea>
		</div>
		<!-- <div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">파일첨부</label>
			<input type="file" class="form-control" id="exampleFormControlInput1">
		</div> -->
		<div class="input">
			<input class="btn btn-primary" type="submit" value="수정하기">
			<input class="btn btn-primary" type="reset" value="취소하기">
			<input class="btn btn-primary" type="button" value="목록가기" onclick="location.href='${conPath}/qna/list.do?pageNum=${param.pageNum }'">
		</div>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>