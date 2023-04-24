<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../main/header.jsp"/>

<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.container{
	min-width: 1500px !important;
}
.titleImage, .content{
	width:600px;
	height:600px;
}

</style>
</head>
<body>
	
	<div class="container">
		
		
		<div class="d-flex justify-content-center">
			
			<c:forEach items="${imageList}" var="image">
				<c:if test="${image.type eq 'title'}">
					<img src="${conPath}/productImage/${image.image}" class="titleImage">
				</c:if>
			</c:forEach>
			
			
			<div class="infoArea">
				
				<div class="py-3">
					${product.productName}
				</div>
				
				<table>
					
					<tr>
						<td>판매가</td>
						<td>${product.productPrice}</td>
					</tr>
					<tr>
						<td>할인판매가</td>
						<td>${product.productPrice - (product.productPrice * (product.productDiscount/100))}</td>
					</tr>
					<tr>
						<td>배송비</td>
						<td>3000원</td>
					</tr>
					
					<tr>
						<td>사이즈</td>
						<td>
							<select>
								<option></option>
							</select>
						</td>
					</tr>
					<tr>
						<td>색상</td>
						<td>
							<select>
								<option></option>
							</select>
						</td>
					</tr>
					
					
				</table>
				
				
				
				
				
				
			</div>
			
		</div>
		
		
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proDetail">
		
			<h1 id="1asdf">1asdf</h1>
		
		</div>
		
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proInfo">
		
			<h1 id="2asdf">2asdf</h1>
		
		</div>
		
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proReview">
		
			<h1 id="3asdf">3asdf</h1>
		
		</div>
		
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proQna">
		
			<h1 id="4asdf">4asdf</h1>
		
		</div>
		
		
	</div>
	<jsp:include page="../main/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>