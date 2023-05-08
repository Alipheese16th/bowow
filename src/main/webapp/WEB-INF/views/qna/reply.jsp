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
		.qna .form-control {border: 1px solid #BE8D6E;}
		.qna label {font-size: 1.2em; font-weight: bold; margin-right: 600px;}
		.qna textarea {height: 300px;}
		.qna .btn {
			background: #BE8D6E; font-size: 1.2em; border: 1px solid #BE8D6E;
			width: 200px;
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
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<div class="qna">
		<h1>${param.qnaNum }번 상품문의 답변 작성</h1>
		<form action="${conPath }/qna/reply.do" method="post">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="qnaNum" value="${param.qnaNum }">
			<input type="hidden" name="qnaGroup" value="${qna.qnaGroup }">
			<input type="hidden" name="qnaStep" value="${qna.qnaStep }">
			<input type="hidden" name="qnaIndent" value="${qna.qnaIndent }">
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">답변 제목</label>
				<input type="text" name="qnaTitle" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해주세요" required="required">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">답변 내용</label>
				<textarea name="qnaContent" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용을 입력해주세요" required="required" style="max-height: 500px;"></textarea>
			</div>
			<!-- <div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">파일첨부</label>
				<input type="file" class="form-control" id="exampleFormControlInput1">
			</div> -->
			<div class="input">
				<input class="btn btn-primary" type="submit" value="답변달기">
				<input class="btn btn-primary" type="reset" value="취소하기">
				<input class="btn btn-primary" type="button" value="목록가기" onclick="location.href='${conPath}/qna/list.do?pageNum=${param.pageNum }'">
			</div>
		</form>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>