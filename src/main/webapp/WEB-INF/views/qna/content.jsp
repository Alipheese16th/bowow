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
		body {min-width: 1400px; text-align: center;}
		h1 {font-size: 2em; height: 100px; line-height: 100px;}
		a {color: black; text-decoration: none;}
		.write {
			background-color: #BE8D6E; color: #fff;
			font-size: 1.2em;
		}
		.write:hover {background-color: gray;}
		.write a {
			color: #fff;
		}
		.btn {
			width: 200px;
		}
		b {color: red;}
		tr:hover {cursor: pointer;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<c:set var="success" value="1"/>
	<c:set var="fail" value="0"/>
	<c:if test="${modifyOResult eq success }">
		<script>alert('수정 성공');</script>
	</c:if>
	<c:if test="${modifyOResult eq fail }">
		<script>
			alert('수정 실패');
			history.back();
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<h1>${contentQna.qnaNum }번 글(작성자 : ${contentQna.memberId })</h1>
	<table class="table table-hover">
	<tr>
		<th>No</th>
		<td>${contentQna.qnaNum }</td>
	</tr>
	<tr>
		<th>이미지</th>
		<td></td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${contentQna.qnaTitle }</td>
	</tr>
	<tr>
		<th>본문</th>
		<td>${contentQna.qnaContent }</td>
	</tr>
	<tr>
	  	<td colspan="2">
	  		<div class="gap-2 mx-auto">
				<button class="btn write" type="button" onclick="location.href='${conPath }/qna/modify.do?qnaNum=${param.qnaNum }&pageNum=${param.pageNum}'">수정하기</button>
				<button class="btn write" type="button" onclick="location.href='${conPath }/qna/reply.do?qnaNum=${param.qnaNum }&pageNum=${param.pageNum}'">답변하기</button>
				<button class="btn write" type="button" onclick="location.href='${conPath }/qna/delete.do?qnaNum=${param.qnaNum }&pageNum=${param.pageNum}'">삭제하기</button>
				<button class="btn write" type="button" onclick="location.href='${conPath }/qna/list.do?pageNum=${param.pageNum}'">목록가기</button>
			</div>
	  	</td>
	  </tr>
	</table>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>