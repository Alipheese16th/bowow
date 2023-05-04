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
		.qna {min-width: 1250px; text-align: center; padding: 0 250px;}
		.qna h1 {font-size: 2em; height: 100px; line-height: 100px;}
		.qna a {color: black; text-decoration: none;}
		.qna .write {
			background-color: #BE8D6E; color: #fff;
			font-size: 1.2em;
		}
		.qna .write:hover {background-color: gray;}
		.qna .write a {
			color: #fff;
		}
		.qna .paging {margin: 30px 0 30px;}
		.qna .paging b {color: red;}
		.qna tr:hover {cursor: pointer;}
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
	<c:set var="success" value="1"/>
	<c:set var="fail" value="0"/>
	
	<c:if test="${writeQResult eq -1 }">
		<script>
			alert('로그인이 끊어졌습니다 다시 로그인하세요');
			location.href='${conPath}/login.do?after=qna/list.do';
		</script>
	</c:if>
	<c:if test="${writeQResult eq fail }">
		<script>
			alert('qna작성 실패');
			history.back();
		</script>
	</c:if>
	
	<c:if test="${replyQResult eq success }">
		<script>alert('답변글이 작성되었습니다');</script>
	</c:if>
	<c:if test="${replyQResult eq fail }">
		<script>
			alert('답변 실패');
			history.back();
		</script>
	</c:if>
	<c:if test="${deleteQResult eq success }">
		<script>alert('글이 삭제되었습니다');</script>
	</c:if>
	<c:if test="${deleteQResult eq fail }">
		<script>
			alert('삭제 실패');
			history.back();
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp"/>
	
	<div class="qna">
		<h1>상품문의 게시판</h1>
		<form action="${conPath }/qna/list.do">
			<table class="table table-hover">
			  <tr>
			  	<th>No</th><th>이미지</th><th>제목</th><th>본문</th><th>작성일</th><th>IP</th><th>조회수</th>
			  </tr>
			  <c:if test="${totCntQna eq 0 }">
				<tr><td colspan="7">해당 페이지의 글이 없습니다</td></tr>
			  </c:if>
			  <c:if test="${totCntQna != 0 }">
				<c:forEach var="qna" items="${qnaList }">
					<tr onclick="clickTr(${qna.qnaNum})">
						<td>${qna.qnaNum }</td>
						<td>
							<c:if test="${empty qna.image }"></c:if>
							<c:if test="${not empty qna.image }">
								<img src="${conPath }/productImage/${qna.image}" style="width: 50px;">
							</c:if>
						</td>
				  		<td style="text-align: left;">
				  			<c:forEach var="i" begin="1" end="${qna.qnaIndent }">
				  				<c:if test="${i eq qna.qnaIndent }">
				  					<img src="${conPath }/img/re.png" width="20">
				  				</c:if>
				  				<c:if test="${i != qna.qnaIndent }"> &nbsp; &nbsp; </c:if>
				  			</c:forEach>
				  			${qna.qnaTitle }
				  		</td>
				  		<td>${qna.qnaContent }</td>
				  		<td>
				  			<fmt:formatDate value="${qna.qnaDate }" type="date" pattern="yyyy-MM-dd"/>
				  		</td>
				  		<td>${qna.qnaIp }</td>
				  		<td>${qna.qnaHit }</td>
					</tr>
				</c:forEach>
			  </c:if>
			</table>
			<select name="schItem">
				<option value="qnaTitle"
					<c:if test="${param.schItem eq 'qnaTitle' }">selected="selected"</c:if>
				>제목</option>
				<option value="qnaContent"
					<c:if test="${param.schItem eq 'qnaContent' }">selected="selected"</c:if>
				>내용</option>
			</select>
			<input type="text" name="schWord" value="${param.schWord }">
			<input type="submit" value="검색">
			<button class="btn write" type="button" onclick="location.href='${conPath }/qna/write.do'">
				WRITE
			</button>
		</form>
	  	<%-- <div class="d-grid gap-2 col-4 mx-auto">
			<button class="btn write" type="button">
				<a href="${conPath }/qna/write.do?pageNum=${paging.currentPage}">
					WRITE
				</a>
			</button>
		</div> --%>
		<div class="paging">
			<c:if test="${paging.startPage > paging.blockSize }">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${conPath }/qna/list.do?pageNum=${paging.startPage-1}&schItem=${param.schItem }&schWord=${param.schWord}'">
					<
				</button>
			</c:if>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${paging.currentPage == i }">
					<button type="button" class="btn btn-outline-secondary"><b>${i }</b></button>
				</c:if>
				<c:if test="${paging.currentPage != i }">
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='${conPath }/qna/list.do?pageNum=${i }&schItem=${param.schItem }&schWord=${param.schWord}'">
						${i }
					</button>
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${conPath }/qna/list.do?pageNum=${paging.endPage+1}&schItem=${param.schItem }&schWord=${param.schWord}'">
					>
				</button>
			</c:if>
		</div>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>