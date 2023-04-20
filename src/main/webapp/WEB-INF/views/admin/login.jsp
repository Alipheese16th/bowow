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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"></script>
	<style>
		/* .gradient-custom {
			background: linear-gradient(to right, rgba(350, 110, 81, 1), rgba(150, 88, 106, 1))
		} */
		body {
			margin: 0 auto;
			background: linear-gradient(to right, rgba(350, 110, 81, 1), rgba(150, 88, 106, 1))
		}
		.wrap {
			margin: 300px auto 0 auto;
			width: 500px;
		}
		.content {
			text-align: center;
		}
		.card-body {
			background: #BE8D6E;
			border-radius: 10px;
		}
		.card-title {
			padding: 60px 0 30px 0;
		}
		.card-text {
			margin-bottom: 30px;
		}
		input {
			margin-bottom: 20px;
			width: 350px;
			height: 50px;
			border-radius: 10px;
			font-size: 1.2em;
			padding-left: 10px;
		}
		.member {
			text-align: right;
			margin-right: 30px;
			color: lightgray;
			margin-bottom: 30px;
		}
		.member a {
			color: #654;
		}
		.btn {
			background-color: #654;
			width: 300px;
			font-weight: bold;
			font-size: 1.3em;
			margin-bottom: 60px;
		}
		.btn:hover {
			background-color: gray;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<div class="wrap">
		<div class="content">
		  <div class="card-body">
		  	<form action="${coaPath }/login.do" method="post">
			    <h5 class="card-title" style="font-weight: bold; font-size: 1.8em;">관리자 로그인</h5>
			    <p class="card-text">아이디와 비밀번호를 입력해주세요</p>
			    <div class="id">
			    	<input type="text" name="mid" placeholder="아이디">
			    </div>
			    <div class="pw">
			    	<input type="password" name="mpw" placeholder="비밀번호">
			    </div>
			    <div class="member">
			    	<a href="">회원사이트로 가기</a>
			    </div>
			    <input type="submit" value="로그인" class="btn">
			    <!-- <a href="#" class="btn">로그인</a> -->
		  	</form>
		  </div>
		</div>
	</div>
	<!-- <section class="vh-100 gradient-custom">
	  <div class="container py-5 h-100">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div style="min-width:450px; max-width:450px;">
	        <div class="card text-white" style="border-radius: 1rem; background-color: #BE8D6E;">
	          <div class="card-body p-5 text-center">
	
	            <div class="mb-md-5 mt-md-4">
	
	              <h2 class="fw-bold mb-2 text-uppercase">관리자 로그인</h2>
	              <p class="text-white-50 mb-5">아이디와 비밀번호를 입력해주세요</p>
	
	              <div class="form-outline form-white mb-4">
	                <input type="email" id="typeEmailX" class="form-control form-control-lg" placeholder="아이디" />
	              </div>
	
	              <div class="form-outline form-white mb-4">
	                <input type="password" id="typePasswordX" class="form-control form-control-lg" placeholder="비밀번호" />
	              </div>
	
	              <p class="small mb-5 pb-lg-2" style="text-align:right">
	              	<a class="text-white-50" href="#!">회원 사이트 가기</a>
	              </p>
	
	              <button class="btn btn-outline-light btn-lg px-5" type="submit">로그인</button>
	
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section> -->
</body>
</html>