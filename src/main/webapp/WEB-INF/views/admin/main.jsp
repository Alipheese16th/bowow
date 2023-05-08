<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.111.3">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">
	<link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script>
		var date = new Date();
		var calendarYear = date.getFullYear();
		var calendarMonth = date.getMonth() + 1;
		var calendarToday = date.getDate();
		var monthLastDate = new Date(calendarYear, calendarMonth, 0);
		
		
		// 달력 월의 마지막 일
		var calendarMonthLastDate = monthLastDate.getDate();
		// 달력 이전 월의 마지막 일
		var prevMonthLastDate = new Date(calendarYear, calendarMonth - 1, 0);
		// 달력 현재 요일
		var calendarMonthTodayDay = date.getDate();
		
		
		var arWeek = ["", "", "", "", "", "", "", "", "", "", "", "", "", "",""];
		var weekDay = calendarToday;
		for (var index = 14; index >= calendarToday-15; index--) {
			weekDay--;
			if (weekDay == 0) {
				weekDay = prevMonthLastDate.getDate();
			}
			arWeek[index] = weekDay;
		}
	</script>
	<style>
		* {
			margin: 0 auto;
			text-align: center;
			font-family: 'Pretendard';
		}
		.maincontent{
			margin-left:280px;
			min-width:1200px;
		}
		
		.pagename h1 {
			text-align: left;
			margin: 50px 0 50px 250px;
		}
		
		.card {
			border: 1px solid #BE8D6E;
			width: 300px;
			text-align: right;
		}
		.box {
			width: 344px; height: 94px;
			color: white;
			border-radius: 10px;
			display: block;
		}
		.box a {
			color: white;
		}
		.chart {
			width: 580px;
		}
		#myChart1 {
			min-width: 650px;
			max-width: 950px;
			max-height: 300px;
		}
		#myChart2 {
			max-height: 300px;
			margin-bottom: 15px;
		}
		hr {
			color: black;
			background-color: black;
		}
		h2 {
			padding-top: 20px;
		}
		.box1, .box2, .box3, .box4, .box5, .box6 {
			height: 400px;
			border: 1px solid #BE8D6E;
			border-radius: 5px;
			margin-bottom: 50px;
		}
		.box1 {
			min-width: 680px;
			height: 440px;
			margin-top: 50px;
			/* margin: 50px 20px 0 0; */
		}
		.box2 {
			min-width: 400px;
			height: 440px;
			margin-top: 50px;
			/* margin-left: 20px; */
		}
		/* .box3, .box5 {
			margin: 0 20px 0 0;
		} */
		.box4 {
			min-width: 660px;
			/* margin-left: 20px; */
		}
		/* .box6 {
			margin-left: 20px;
		} */
		.accordion-button{
		    display: block;
		    width: 375px;
		    margin-right: 1000px;
		    font-size: 20px;
		    font-family: Arial, sans-serif;
		    background-color: #f2f2f2;
		    border-bottom: 1px #cccccc solid;
		    cursor: pointer;
		    transition: 1s;
		    height: 50px;
		    margin-bottom: 10px;
		}
	
		.accordion-container{
		    display: block;
		    width: 400px;
		    margin: 15px auto;
		}
	
		.accordion-text-wrapper{
		    width: 200px;
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
	
		.bd-placeholder-img {
	    	font-size: 1.125rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        user-select: none;
		}

		@media (min-width: 768px) {
	        .bd-placeholder-img-lg {
	          font-size: 3.5rem;
	        }
		}

		.b-example-divider {
	        width: 100%;
	        height: 3rem;
	        background-color: rgba(0, 0, 0, .1);
	        border: solid rgba(0, 0, 0, .15);
	        border-width: 1px 0;
	        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
		}

		.b-example-vr {
	        flex-shrink: 0;
	        width: 1.5rem;
	        height: 100vh;
		}

		.bi {
	        vertical-align: -.125em;
	        fill: currentColor;
		}

		.nav-scroller {
	        position: relative;
	        z-index: 2;
	        height: 2.75rem;
	        overflow-y: hidden;
        }

		.nav-scroller .nav {
	        display: flex;
	        flex-wrap: nowrap;
	        padding-bottom: 1rem;
	        margin-top: -1px;
	        overflow-x: auto;
	        text-align: center;
	        white-space: nowrap;
	        -webkit-overflow-scrolling: touch;
		}

		.btn-bd-primary {
	        --bd-violet-bg: #712cf9;
	        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	
	        --bs-btn-font-weight: 600;
	        --bs-btn-color: var(--bs-white);
	        --bs-btn-bg: var(--bd-violet-bg);
	        --bs-btn-border-color: var(--bd-violet-bg);
	        --bs-btn-hover-color: var(--bs-white);
	        --bs-btn-hover-bg: #6528e0;
	        --bs-btn-hover-border-color: #6528e0;
	        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	        --bs-btn-active-color: var(--bs-btn-hover-color);
	        --bs-btn-active-bg: #5a23c8;
	        --bs-btn-active-border-color: #5a23c8;
		}
		.bd-mode-toggle {
        	z-index: 1500;
		}
		.flex-shrink-0 {
      		margin: 0;
		}
		.mb-1 {width: 200px;}
		.btn-toggle {width: 200px; text-align: right;}
		.table, form-select{
			color: #BE8D6E;
			border-color:#BE8D6E;
		}
		.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
			color: #BE8D6E;
			border-color:#BE8D6E;
		}
		.table-striped > tbody > tr:nth-child(2n+1):hover, .table-striped > tbody > tr:nth-child(2n+1):hover {
			background-color: #BE8D6E;
		}
		.table-striped > tbody > tr:nth-child(2n):hover, .table-striped > tbody > tr:nth-child(2n):hover {
			background-color: #BE8D6E;
		}
		.table-striped > tbody > tr:nth-child(2n):hover > td, .table-striped > tbody > tr:nth-child(2n):hover > th {
		    color:white;
		}
		.table-striped > tbody > tr:nth-child(2n+1):hover > td, .table-striped > tbody > tr:nth-child(2n+1):hover > th {
		    color:white;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.js"></script>
	<script>
		const clickQ = function(qnaNum) {
			location.href = "${conPath}/qna/content.do?qnaNum=" + qnaNum + '&pageNum=${paging.currentPage}';
		};
		const clickN = function(noticeNum) {
			location.href = "${conPath}/notice/content.do?noticeNum=" + noticeNum + '&pageNum=${paging.currentPage}';
		};
		const clickI = function(inquiryNum) {
			location.href = "${conPath}/inquiry/reply.do?inquiryNum=" + inquiryNum;
		};
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<div class="wrap">
		<%-- <c:forEach var="category" items="${categorySales}">
			${category.category } / ${category.sumTotal } 
		</c:forEach> --%>
		<jsp:include page="side.jsp"/>
			
			<div class="maincontent">
			<div class="row">
			
				<div class="box1 col-6">
					<h2>일일 매출 현황</h2>
					<hr>
					<canvas id="myChart1"></canvas>
					<a href="#">view ></a>
				</div>
				<div class="box2 col-5">
					<h2>카테고리별 매출 현황</h2>
					<hr>
					<canvas id="myChart2"></canvas>
					<a href="#">view ></a>
				</div>
				
			</div>
			
			<div class="row">
			
				<div class="box3 col-5">
					<h2>공지사항</h2>
					<hr>
					<table class="table table-striped mx-2">
						<thead>
							<tr class="text-center">
								<th><i class="bi bi-justify"></i> 번호</th>
								<th class="text-start"><i class="bi bi-chat-dots-fill"></i> 제목</th>
								<th><i class="bi bi-person-fill"></i> 작성자</th>
								<th><i class="bi bi-calendar3"></i> 날짜</th>
								<th><i class="bi bi-fire"></i> 조회수</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:if test="${noticeList.size() eq 0}">
								<tr><td colspan="5">해당 페이지의 글이 없습니다</td></tr>
							</c:if>
							<c:if test="${noticeList.size() ne 0}">
								<c:forEach var="notice" items="${noticeList}" begin="0" end="4">
								
								<tr onclick="clickN(${notice.noticeNum})">
									<td class="text-center">${notice.noticeNum}</td>
									<td class="w-50">
										${notice.noticeTitle}
									</td>
									<td class="text-center">${notice.adminId}</td>
									<td class="text-center">
										<fmt:formatDate value="${notice.noticeDate}" pattern="yy/MM/dd"/>
									</td>
									<td class="text-center">${notice.noticeHit}</td>
									
								</tr>
								
								</c:forEach>
							
							</c:if>
						</tbody>
					</table>
					<a href="${conPath }/notice/list.do">
						view >
					</a>
				</div>
				<div class="box4 col-6">
					<h2>상담문의</h2>
					<hr>
					<table class="table table-hover">
					  <tr>
					  	<th>No</th><th>이미지</th><th>제목</th><th>본문</th><th>작성일</th><th>IP</th><th>조회수</th>
					  </tr>
					  <c:if test="${totCntQna eq 0 }">
						<tr><td colspan="7">해당 페이지의 글이 없습니다</td>
					  </c:if>
					  <c:if test="${totCntQna != 0 }">
						<c:forEach var="qna" items="${qnaList }" begin="0" end="3">
							<tr onclick="clickQ(${qna.qnaNum})">
								<td>${qna.qnaNum }</td>
								<td>
									<img src="${conPath }/productImage/${qna.image}" style="width: 35px;">
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
					<a href="${conPath }/qna/list.do">
						view >
					</a>
				</div>
			
			</div>
			
			<div class="row">
				<div class="box5 col-6">
					<h2>1:1문의</h2>
					<hr>
					<table class="table table-striped table-hover">
			            <thead>
			                <tr>
			                    <th>작성자</th>
			                    <th>제목</th>
			                    <th>내용</th>
			                    <th>이메일</th>
			                </tr>
			            </thead>
			            <tbody>
			                <c:forEach var="inquiry" items="${inquiryList }" varStatus="status" begin="0" end="4">
				            	<c:if test="${member.memberId eq inquiry.memberId or not empty admin}">
				                    <tr onclick="clickI(${inquiry.inquiryNum})">
				                        <td><c:out value="${inquiry.inquiryNum }"/></td>
				                        <td><c:out value="${inquiry.memberId }"/></td>
				                        <td><c:out value="${inquiry.inquiryTitle }"/></td>
				                        <td><c:out value="${inquiry.inquiryContent }"/></td>
				                        <td><c:out value="${inquiry.inquiryEmail }"/></td>
				                    </tr>
				            	</c:if>
			                </c:forEach>
			            </tbody>
			        </table>
					<hr>
					<a href="${conPath}/inquiry/list.do">
						view >
					</a>
				</div>
				<div class="box6 col-5">
					<h2>자주 묻는 질문</h2>
					<hr>
					<table class="table table-striped table-hover">
			            <thead>
			                <tr>
			                    <th>제목</th>
			                    <th>내용</th>
			                </tr>
			            </thead>
			            <tbody>
			                <c:forEach var="faq" items="${faqList }" varStatus="status" begin="0" end="3">
				                    <tr>
				                        <td><c:out value="${faq.faqTitle }"/></td>
				                        <td><c:out value="${faq.faqContent }"/></td>
				                    </tr>
			                </c:forEach>
			            </tbody>
			        </table>
					<%-- <div class="accordion-container">
						<c:forEach var="faq" items="${faqList }" begin="0" end="3">
							<tr onclick="clickTr(${faq.faqTitle})">
								<th>
								    <div class="accordion-button">
								    	${faq.faqTitle }<!-- <i id="cross" class="cross"></i> -->
								    </div>
								    <div class="accordion-text-wrapper">
								    	<p class="accordion-text">${faq.faqContent }</p>
								    </div>
								</th>
								<th>
								</th>
							</tr>
						</c:forEach>
					</div> --%>
					<a href="${conPath }/faq/list.do">
						view >
					</a>
				</div>
			</div>
			
		</div>
	</div>
	
	<script>
	var sale = new Array();
	let dataSales = ${dateSales};
	let length = dataSales.length;
	for(let i=0 ; i<15-length ; i++){
		sale.push(0);
	}
	dataSales.forEach(function(item, idx){
		sale.push(item);
	});
	  var labels = arWeek;
	  let data2023 = {
	      label: calendarYear + '년',
		  backgroundColor: 'rgba(54, 162, 235, 0.5)',
	      borderColor: 'rgba(55, 110, 132, 0.5)',
	      // data: [7000, 5000, 5000, 2000, 20000, 30000, 45000, 2000, 11000, 9000, 32000, 21000, 50000, 29000, 39000],
	      data: sale
	 };   
	console.log(data2023.data);
	  var data = {
		    labels: labels,
		    datasets: [data2023]
	 };

	  var config = {
	    type: 'line',
	    data: data,
	    options: {
	    	responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
	    }
	  };

	var myChart = new Chart(
	    document.getElementById('myChart1'),
	    config
	 );
	</script>
	<script>
		var temp =  '${categorySales}' // '[fashion, ...]'
		var categorySales = temp.substring(1, temp.length-1).split(',');
		var data = {
			  labels: categorySales,
			  datasets: [{
			    label: 'My First Dataset',
			    data: ${categorySumTotal},
			    backgroundColor: [
			      'rgb(255, 99, 132)',
			      'rgb(54, 162, 235)',
			      'rgb(255, 205, 86)',
			      'rgb(25, 105, 80)',
			      'rgb(95, 155, 100)'
			    ],
			    hoverOffset: 4
			  }]
	  };  

	  var config = {
	    type: 'doughnut',
	    data: data,
	    options: {
	      maintainAspectRatio :false
	    }
	};

	var myChart = new Chart(
	    document.getElementById('myChart2'),
	    config
	  );
	</script>
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
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>