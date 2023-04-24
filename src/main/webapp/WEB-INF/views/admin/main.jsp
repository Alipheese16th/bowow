<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<style>
		* {
			margin: 0 auto;
			text-align: center;
		}
		.wrap {
			min-width: 600px;
		}
		.pagename h1 {
			text-align: left;
			margin: 50px 0 50px 125px;
		}
		.btn {
			background: #BE8D6E;
			border: 1px solid #BE8D6E;
			color: white;
		}
		.btn:hover {
			background: #BE8D6E;
			color: black;
		}
		.card {
			border: 1px solid #BE8D6E;
			width: 300px;
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
			min-width: 580px;
			max-width: 580px;
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
			height: 300px;
			border: 1px solid #BE8D6E;
			border-radius: 5px;
		}
		.box1 {
			min-width: 680px;
			height: 440px;
			margin-top: 50px;
			margin-right: 20px;
		}
		.box2 {
			min-width: 400px;
			height: 440px;
			margin-top: 50px;
			margin-left: 20px;
		}
		.box3 {
			margin-top: 50px;
			margin-bottom: 50px;
			margin-right: 20px;
		}
		.box4 {
			margin-top: 50px;
			margin-bottom: 50px;
			margin-left: 20px;
		}
		.box5 {
			margin-right: 20px;
		}
		.box6 {
			margin-left: 20px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.js"></script>
</head>
<body>
	<div class="wrap">
		<div class="pagename">
			<h1>관리자 페이지</h1>
		</div>
		<div class="row">
		  <div class="col-5">
		    <div class="card">
		      <div class="card-body">
		        <h5 class="card-title">Register product</h5>
		        <a href="#" class="btn">상품등록</a>
		      </div>
		    </div>
		  </div>
		  <div class="col-5">
		    <div class="card">
		      <div class="card-body">
		        <h5 class="card-title">Register for Notice</h5>
		        <a href="#" class="btn">공지사항 추가하기</a>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="row">
			<div class="box1 col-7">
				<h2>일일 매출 현황</h2>
				<hr>
				<canvas id="myChart1"></canvas>
				<a href="#">view ></a>
			</div>
			<div class="box2 col-3">
				<h2>카테고리별 매출 현황</h2>
				<hr>
				<canvas id="myChart2"></canvas>
				<a href="#">view ></a>
			</div>
			<div class="box3 col-3">
				공지사항
				<hr>
				<a href="#">
					view >
				</a>
			</div>
			<div class="box4 col-7">
				상담문의
				<hr>
				<a href="#">
					view >
				</a>
			</div>
			<div class="box5 col-7">
				1:1문의
				<hr>
				<a href="#">
					view >
				</a>
			</div>
			<div class="box6 col-3">
				자주 묻는 질문
				<hr>
				<a href="#">
					view >
				</a>
			</div>
		</div>
	</div>
	<!-- <script>
		const labels = [1,2,3,4,5,6,7];
		const data = {
		  labels: labels,
		  datasets: [{
		    label: 'My First dataset',
		    backgroundColor: 'rgb(255, 99, 132)',
		    borderColor: 'rgb(255, 99, 132)',
		    data: [5000, 10000, 3000, 2000, 20000, 30000, 60000, 45000],
		  },
		  {
		    label: 'kkk',
		    backgroundColor: 'rgb(255, 99, 132)',
		    borderColor: 'rgb(255, 99, 132)',
		    data: [4500, 20000, 5500, 9000, 15000, 10000, 35000, 45000],
		  }]
		};
		
		const config = {
		  type: 'line',
		  data,
		  options: {}
		};
		
		</script>
		<script>
		  const myChart = new Chart(
		    document.getElementById('myChart2'),
		    config
		  );
	</script> -->
	<!-- <script>
	var ctx = document.getElementById('myChart1');
	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ["1일","2일","3일","4일"],
			datasets: [{
				label: '2023년',
				data: [100, 350, 300, 600],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)'
				],
				borderWidth: 2
			}]
		},
	});
	</script> -->
	<script>
	  var labels = [
		    '1일', '2일', '3일', '4일', '5일',
		    '6일', '7일', '8일', '9일', '10일',
		    '11일', '12일', '13일', '14일', '15일',
		  ];
	  let data2023 = {
	      label: '2023년',
	     backgroundColor: 'rgba(54, 162, 235, 0.5)',
	      /* backgroundColor: '#BE8D6E', */
	      borderColor: 'rgba(255, 99, 132, 0.5)',
	      data: [7000, 5000, 5000, 2000, 20000, 30000, 45000, 2000, 11000, 9000, 32000, 21000, 50000, 29000, 39000],
	 };   

	  var data = {
		    labels: labels,
		    datasets: [data2023]
	 };

	  var config = {
	    type: 'line',
	    data: data,
	    options: {
	      maintainAspectRatio :false
	    }
	  };

	var myChart = new Chart(
	    document.getElementById('myChart1'),
	    config
	 );
	</script>
	<script>
		var data = {
			  labels: [
			    'fashion',
			    'food',
			    'toy',
			    'walking',
			    'clean'
			  ],
			  datasets: [{
			    label: 'My First Dataset',
			    data: [300, 50, 100, 70, 80],
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>