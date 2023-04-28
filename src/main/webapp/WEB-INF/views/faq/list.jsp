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
		.accordion-button{
		    display: block;
		    width: 700px;
		    font-size: 30px;
		    font-family: Arial, sans-serif;
		    background-color: #f2f2f2;
		    border-bottom: 1px #cccccc solid;
		    cursor: pointer;
		    transition: 1s;
		    height: 50px;
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
	
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<%-- <div class="faq">
		<h1>자주 묻는 질문(FAQ)</h1>
		<div class="table">
			<table>
				<tr>
					<th>제목</th>
					<th>내용</th>
				</tr>
				<c:if test="${totCntFaq eq 0 }">
					<tr><td colspan="2">해당 페이지의 글이 없습니다</td></tr>
				</c:if>
				<c:if test="${totCntFaq != 0 }">
					<c:forEach var="faq" items="${faqList }">
						<tr onclick="clickTr(${qna.qnaNum})">
							<td>${faq.faqTitle }</td>
					  		<td>${faq.faqContent }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div> --%>
		<div class="accordion-container">
		    <div class="accordion-button">dd<i id="cross" class="cross"></i></div>
		    <div class="accordion-text-wrapper"><p class="accordion-text">Lorem ipsum dolor sit amet, vix mandamus expetenda adolescens te, vivendo ponderum per ea. Ullum tincidunt dissentiet pro at. Usu atqui paulo soleat in, no est vide iisque quaerendum, ipsum antiopam in vix. Ex cum cibo quodsi luptatum, eu utamur intellegat usu.
		        Eligendi assueverit te sit, ad putant iuvaret disputando ius. Ipsum maluisset ne vim, dicta decore semper his in. Mel justo labores an, mea at diam impedit percipit. Ut cum adipisci necessitatibus, illum neglegentur an vel, alii elit hendrerit in per. Te cum volumus reprimique, no omnesque accusata consectetuer vel, ex dico wisi exerci sea. His legimus graecis ea. Duo cu possim persius indoctum, mea vidit salutandi id.</p></div>
		    <div class="accordion-button">dd<i id="cross" class="cross"></i></div>
		    <div class="accordion-text-wrapper"><p class="accordion-text">Lorem ipsum dolor sit amet, vix mandamus expetenda adolescens te, vivendo ponderum per ea. Ullum tincidunt dissentiet pro at. Usu atqui paulo soleat in, no est vide iisque quaerendum, ipsum antiopam in vix. Ex cum cibo quodsi luptatum, eu utamur intellegat usu.
		        Eligendi assueverit te sit, ad putant iuvaret disputando ius. Ipsum maluisset ne vim, dicta decore semper his in. Mel justo labores an, mea at diam impedit percipit. Ut cum adipisci necessitatibus, illum neglegentur an vel, alii elit hendrerit in per. Te cum volumus reprimique, no omnesque accusata consectetuer vel, ex dico wisi exerci sea. His legimus graecis ea. Duo cu possim persius indoctum, mea vidit salutandi id.</p></div>
		    <div class="accordion-button">dd<i id="cross" class="cross"></i></div>
		    <div class="accordion-text-wrapper"><p class="accordion-text">Lorem ipsum dolor sit amet, vix mandamus expetenda adolescens te, vivendo ponderum per ea. Ullum tincidunt dissentiet pro at. Usu atqui paulo soleat in, no est vide iisque quaerendum, ipsum antiopam in vix. Ex cum cibo quodsi luptatum, eu utamur intellegat usu.
		        Eligendi assueverit te sit, ad putant iuvaret disputando ius. Ipsum maluisset ne vim, dicta decore semper his in. Mel justo labores an, mea at diam impedit percipit. Ut cum adipisci necessitatibus, illum neglegentur an vel, alii elit hendrerit in per. Te cum volumus reprimique, no omnesque accusata consectetuer vel, ex dico wisi exerci sea. His legimus graecis ea. Duo cu possim persius indoctum, mea vidit salutandi id.</p></div>
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
	
	<jsp:include page="../main/footer.jsp"/>
	
</body>
	<script>
		var accordionTab = document.querySelectorAll(".accordion-button");
		var buttons = [accordionTab[0], accordionTab[1], accordionTab[2]];
	
		buttons.forEach(function(item){
		    item.addEventListener("click", function(){
		        var text = this.nextElementSibling;
		        var cross = this.firstChild;
		        text.classList.toggle("toggle");
		        cross.classList.toggle("cross-active");
		        this.classList.toggle("active");
		    });
		});
		const clickTr = function(qnaNum) {
			location.href = "${conPath}/qna/content.do?qnaNum=" + qnaNum + '&pageNum=${paging.currentPage}';
		};
	</script>
</html>