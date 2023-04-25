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
		h1 {font-size: 2.7em; height: 100px; line-height: 100px;}
		a {color: black; text-decoration: none;}
		.write {
			background-color: #BE8D6E; color: #fff;
			font-size: 1.2em;
		}
		.write:hover {background-color: gray;}
		.write a {
			color: #fff;
		}
		b {color: red;}
		tr:hover {cursor: pointer;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		const clickTr = function(qnaNum) {
			location.href = "${conPath}/qna/content.do?qnaNum=" + qnaNum + '&pageNum=${paging.currentPage}';
		};
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<h1>상품문의 게시판</h1>
	<table class="table table-hover">
	  <tr>
	  	<th>No</th><th>이미지</th><th>제목</th><th>본문</th><th>작성일</th><th>IP</th>
	  </tr>
	  <c:if test="${totCntQna eq 0 }">
		<tr><td colspan="6">해당 페이지의 글이 없습니다</td>
	  </c:if>
	  <c:if test="${totCntQna != 0 }">
		<c:forEach var="qna" items="${qnaList }">
			<tr onclick="clickTr(${qna.qnaNum})">
				<td>${qna.qnaNum }</td>
				<td>${qna.qnaImage }</td>
		  		<td style="text-align: center">
		  			${qna.qnaTitle }
		  		</td>
		  		<td>${qna.qnaContent }</td>
		  		<td>
		  			<fmt:formatDate value="${qna.qnaDate }" pattern="yyyy-MM-dd"/>
		  		</td>
		  		<td>${qna.qnaIp }</td>
			</tr>
		</c:forEach>
	  </c:if>
	  <tr>
	  	<td colspan="6">
	  		<div class="d-grid gap-2 col-4 mx-auto">
				<button class="btn write" type="button">
					<a href="${conPath }/qna/write.do?pageNum=${paging.currentPage}">
						WRITE
					</a>
				</button>
			</div>
	  	</td>
	  </tr>
	</table>
	<div>
		<c:if test="${paging.startPage > paging.blockSize }">
			<button type="button" class="btn btn-outline-secondary">
				<a href="${conPath }/qna/list.do?pageNum=${paging.startPage-1}"><</a>
			</button>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${paging.currentPage == i }">
				<button type="button" class="btn btn-outline-secondary"><b>${i }</b></button>
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<button type="button" class="btn btn-outline-secondary">
					<a href="${conPath }/qna/list.do?pageNum=${i }">${i }</a>
				</button>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			<button type="button" class="btn btn-outline-secondary">
				<a href="${conPath }/qna/list.do?pageNum=${paging.endPage+1}">></a>
			</button>
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>