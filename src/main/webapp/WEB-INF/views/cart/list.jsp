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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.container{
	min-width: 1500px !important;
}
.titleImg{
	width:80px;
	height:80px;
}
.md{
	vertical-align : middle;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<div class="container">
	
		<h3 class="text-center py-5">CART</h3>
		
		<table class="table">
			<thead>
				<tr>
					<th scope="col"><input type="checkbox"></th>
					<th scope="col">이미지</th>
					<th scope="col">상품정보</th>
					<th scope="col">판매가</th>
					<th scope="col">수량</th>
					<th scope="col">적립금</th>
					<th scope="col">배송구분</th>
					<th scope="col">배송비</th>
					<th scope="col">합계</th>
					<th scope="col">선택</th>
				</tr>
			</thead>
			<tbody>
				
				<c:forEach items="${cartList}" var="cart">
					<tr>
						<td class="md"><input type="checkbox"></td>
						<td class="md"><img class="titleImg" src="${conPath}/productImage/${cart.image}"></td>
						<td class="md">${cart.productName}</td>
						<td class="md">${cart.productPrice}, ${cart.productDiscount}</td>
						<td class="md">${cart.qty}</td>
						<td class="md">-</td>
						<td class="md">기본배송</td>
						<td class="md">3000</td>
						<td class="md">${cart.cost}</td>
						<td class="md">
							<div class="d-flex flex-column">
								<button type="button" class="btn btn-outline-dark">주문하기</button>
								<button type="button" class="btn btn-outline-dark">삭제</button>
							</div>
						</td>
					</tr>
					
				</c:forEach>
				
				
			</tbody>
		</table>
		
		
		
		
		
	</div>
	<jsp:include page="../main/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>