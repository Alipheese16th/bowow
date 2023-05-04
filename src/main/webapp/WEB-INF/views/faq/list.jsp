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
	<style>
		.faq {min-width: 1250px; text-align: center; padding: 0 525px;}
		.faq h1 {
			font-size: 2em; height: 100px; line-height: 100px; width: 700px;
			text-align: center; border-bottom: 1px solid #BE8D6E; margin-bottom: 50px;
		}
		.faq .write {
			background-color: #BE8D6E; color: #fff;
			font-size: 1.2em; margin: 30px 0;
		}
		.faq .write:hover {background-color: gray;}
		.faq .write a {
			color: #fff;
		}
		.faq .paging {margin: 30px 0 30px;}
		.faq .paging b {color: red;}
		.accordion-button {
		    display: block;
		    width: 700px;
		    font-size: 20px;
		    font-family: Arial, sans-serif;
		    background-color: #f2f2f2;
		    border-bottom: 1px #cccccc solid;
		    cursor: pointer;
		    transition: 1s;
		    height: 50px;
		    margin-bottom: 20px;
		}
		
		.accordion-container{
		    display: block;
		    width: 700px;
		    margin: auto;
		}
		
		.accordion-text-wrapper{
		    width: 700px;
		    max-height: 0;
		    overflow: hidden;
		    transition: max-height .6s ease-out;
		}
		
		.accordion-text{
		    font-size: 14px;
		    margin: 40px 10px 20px 10px;
		}
		
		
		.toggle{
		    max-height: 200px;
		}
		
		.cross{
		    width: 30px;
		    height: 30px;
		    background-image: url('https://cdn0.iconfinder.com/data/icons/feather/96/circle-cross-512.png');
		    background-size: cover;
		    transform: rotate(45deg);
		    transition: .5s ease-out;
		    position: absolute;
		    margin: 10px 10px;
		}
		
		.cross-active{
		    position: absolute;
		    margin: 56px 0 0 10px;
		    transform: rotate(0deg);
		    transition: .5s ease-out;
		    opacity: .4;
		}
		
		.active{
		    background: #bbb;
		    color: #fff;
		}
	</style>	
	<!-- <script>
		const clickTr = function(faqTitle) {
			location.href = "${conPath}/faq/content.do?faqTitle=" + faqTitle + '&pageNum=${paging.currentPage}';
		};
	</script> -->
</head>
<body>
	<c:set var="success" value="1"/>
	<c:set var="fail" value="0"/>
	<c:if test="${not empty writeFResult }"><script>alert('FAQ 글을 등록 하였습니다');</script></c:if>
	<c:if test="${not empty deleteFResult }"><script>alert('FAQ 글을 삭제 하였습니다');</script></c:if>
	<c:if test="${modifyFResult eq success }">
		<script>alert('FAQ 글을 수정 하였습니다');</script>
	</c:if>
	<c:if test="${modifyFResult eq fail }">
		<script>
			alert('FAQ 수정을 실패 하였습니다');
			history.back();
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp"/>
	
	<div class="faq">
		<h1>자주 묻는 질문(FAQ)</h1>
		<div class="accordion-container">
			<c:forEach var="faq" items="${faqList }">
				<tr onclick="clickTr(${faq.faqTitle})">
					<th>
					    <div class="accordion-button">
					    	${faq.faqTitle }<!-- <i id="cross" class="cross"></i> -->
					    </div>
					    <div class="accordion-text-wrapper">
					    	<p class="accordion-text">${faq.faqContent }</p>
					    	<c:if test="${not empty admin }">
							    <button class="btn write" type="button" onclick="location.href='${conPath}/faq/modify.do?faqTitle=${faq.faqTitle }'">수정</button>
							    <button class="btn write" type="button" onclick="location.href='${conPath}/faq/delete.do?faqTitle=${faq.faqTitle }'">삭제</button>
					    	</c:if>
					    </div>
					</th>
					<th>
					</th>
				</tr>
			</c:forEach>
			<c:if test="${not empty admin }">
				<button class="btn write" type="button" onclick="location.href='${conPath }/faq/write.do'">
					WRITE
				</button>
			</c:if>
		</div>
		
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
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='${conPath }/faq/list.do?pageNum=${i }'">
						${i }
					</button>
				</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='${conPath }/faq/list.do?pageNum=${paging.endPage+1}'">
					>
				</button>
			</c:if>
		</div> --%>
		
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
	
</body>
	<script>
		var accordionTab = document.querySelectorAll(".accordion-button");
		var buttons = [accordionTab[0], accordionTab[1], accordionTab[2], accordionTab[3], accordionTab[4], accordionTab[5], accordionTab[6], accordionTab[7], accordionTab[8], accordionTab[9]];
	
		buttons.forEach(function(item){
		    item.addEventListener("click", function(){
		        var text = this.nextElementSibling;
		        var cross = this.firstChild;
		        text.classList.toggle("toggle");
		        cross.classList.toggle("cross-active");
		        this.classList.toggle("active");
		    });
		});
		const clickTr = function(faqTitle) {
			location.href = "${conPath}/faq/content.do?faqTitle=" + faqTitle + '&pageNum=${paging.currentPage}';
		};
	</script>
</html>