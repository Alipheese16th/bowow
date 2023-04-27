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
		.accordion {
			min-width: 600px;
			width: 1000px; text-align: center;
			margin: 0 auto 50px;
		}
		h1 {
			font-size: 2.7em; height: 100px;
			line-height: 100px;
		}
		/* h1 {
			text-align: center; height: 100px; 
			line-height: 100px; font-size: 30px;
		} */
		.paging {text-align: center;}
	</style>	
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$( function() {
			$( "#accordion" ).accordion({
				heightStyle: "content"
			});
		} );
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<div class="faq">
		<h1>자주 묻는 질문</h1>
		<c:if test="${totCntFaq != 0 }">
			<div id="accordion">
				<c:forEach var="faq" items="${faqList }">
					<h3>${faq.faqTitle }</h3>
					<div>
						<p>${faq.faqContent }</p>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
	
	<%-- <div class="accordion" id="accordionPanelsStayOpenExample">
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button name="faqTitle" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
					${faqList.faqTitle }
				</button>
			</h2>
			<div name="faqContent" id="panelsStayOpen-collapseOne" class="accordion-collapse collapse">
				<div class="accordion-body">
					${faqList.faqContent }
				</div>
			</div>
		</div>
	</div> --%>
	<%-- <div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='${conPath }/faq/list.do?pageNum=${paging.startPage-1}'">
				<
			</button>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${paging.currentPage == i }">
				<button type="button" class="btn btn-outline-secondary"><b>${i }</b></button>
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${conPath }/qna/list.do?pageNum=${i }'">
					${i }
				</button>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='${conPath }/qna/list.do?pageNum=${paging.endPage+1}'">
				>
			</button>
		</c:if>
	</div> --%>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>