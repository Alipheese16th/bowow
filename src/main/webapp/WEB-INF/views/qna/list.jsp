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
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<h1>QnA</h1>
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
		  		<td style="text-align: left">
		  			${qna.qnaTitle }
		  		</td>
		  		<td>${qna.qnaContent }</td>
		  		<td>
		  			<fmt:formatDate value="${qna.qnaDate }" pattern="yy/MM/dd"/>
		  		</td>
		  		<td>${qna.qnaIp }</td>
			</tr>
		</c:forEach>
	  </c:if>
	  <tr><td colspan="6"></td>WRITE</tr>
	</table>
	<div>
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/qna/list.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end=${paging.endPage }>
			<c:if test="${paging.currentPage == i }">
				<b>[ ${i } ]</b>
			</c:if>
			<c:if test="${paging.currentPage != i }">
				[ <a href="${conPath }/qna/list.do?pageNum=${i }">${i }</a>]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/qna/list.do?pageNum=${paging.endPage+1}">다음</a> } ]
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>