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
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<style>

.container{
	min-width: 1300px !important;
	font-family: 'Pretendard';
}
.heading{
	text-align:center;
	text-weight:bold;
	width:1250px;
	margin:60px auto;
	padding-top:30px;
	padding-bottom:30px;
	background: #fff;
    border-top: 3px solid #be8D6e;
}
.table{
	box-sizing:border-box;
	border: 1px solid #DDDDDD;
	border-collapse: collapse;
	margin:0 auto;
	width:1250px;
}

.plist .titleImg{
	width:80px;
	height:80px;
	cursor:pointer;
}
.plist .title{
	cursor:pointer;
}
.plist td, th{
	vertical-align:middle;
	text-align:center;
}
.left{
	text-align:left;
}

.right{
	text-align:right;
}

.plist .qty{
	width:40px;
	height:20px !important;
}
.mybtn{
	background: #BE8D6E;
	color: white;
	font-size: 24px;
	font-weight: bold;
}

.mytable{
	width:625px;
	margin:50px auto;
	box-sizing:border-box;
	border: 1px solid #be8D6e;
	border-collapse: collapse;
}
.mytable th{
	background : #be8D6e;
	color:white;
	border: 1px solid #FFFFFF;
	width: 30%;
	height: 50px;
	padding:5px;
}
.mytable td{
	text-align:left;
	height: 50px;
	padding:5px;
	border: 1px solid #be8D6e;
	padding-left:15px;
}

</style>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>
	
	<div class="container">
		
		<h1 class="heading">주문 결과</h1>
		
		<table class="table">
			<thead>
				<tr>
					<th scope="col">이미지</th>
					<th scope="col">상품정보</th>
					<th scope="col">판매가</th>
					<th scope="col">수량</th>
					<th scope="col">적립금</th>
					<th scope="col">배송구분</th>
					<th scope="col">배송비</th>
					<th scope="col">합계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderDetail}" var="product">
					<tr class="plist" id="${product.productCode}">
						<td>
							<img class="titleImg" src="${conPath}/productImage/${product.image}">
						</td>
						<td class="left">
							<div class="d-flex flex-column title">
								<span>
									${product.productName}
								</span>
								<span>
									<c:if test="${product.sizeNum ne 0 or product.colorNum ne 0}">
										[옵션 :
										<c:forEach items="${sizeList}" var="size">
											<c:if test="${size.sizeNum eq product.sizeNum}">
												<span class="sizeNum" id="${size.sizeNum}">
													${size.productSize}
												</span>
											</c:if>
										</c:forEach>
										<c:forEach items="${colorList}" var="color">
											<c:if test="${color.colorNum eq product.colorNum}">
												<span class="colorNum" id="${color.colorNum}">
													${color.productColor}
												</span>
											</c:if>
										</c:forEach>
										]
									</c:if>
								</span>
							</div>
						</td>
						<td>
							<c:if test="${product.productDiscount ne 0}">
								<del>${product.productPrice}원</del>
								<br>
								<fmt:parseNumber value="${product.productPrice - (product.productPrice * (product.productDiscount/100))}" integerOnly="true"/>원
							</c:if>
							<c:if test="${product.productDiscount eq 0}">
								${product.productPrice}원
							</c:if>
						</td>
						<td>
							<div class="d-flex justify-content-center">
								${product.qty}
							</div>
						</td>
						<td>-</td>
						<td>기본배송</td>
						<td>3000원</td>
						<td>
							<span class="cost" id="${product.cost}">
								${product.cost}원
							</span>
						</td>
					</tr>
				</c:forEach><!-- 상품리스트 -->
			</tbody>
		</table>
		
		<table class="mytable">
			<tr>
				<th>주문번호</th><td>${order.orderCode}</td>
			</tr>
			<tr>
				<th>주문시간</th><td>${order.orderDate}</td>
			</tr>
			<tr>
				<th>결제금액</th><td>${order.totalPrice}원</td>
			</tr>
			<tr>
				<th>배송받을사람</th><td>${order.orderName}</td>
			</tr>
			<tr>
				<th>우편번호</th><td>${order.orderPost}</td>
			</tr>
			<tr>
				<th>기본주소</th><td>${order.orderAddr1}</td>
			</tr>
			<tr>
				<th>상세주소</th><td>${order.orderAddr2}</td>
			</tr>
			<tr>
				<th>전화번호</th><td>${order.orderTel}</td>
			</tr>
		</table>
		
	</div>
	<jsp:include page="../main/footer.jsp"/>
<script>

// 이미지나 상품명 누르면 상품상세보기로 이동
$('.titleImg').click(function(){
	var productCode = $(this).parents('tr').attr('id');
	location.href = '${conPath}/product/content.do?productCode='+productCode;
});
$('.title').click(function(){
	var productCode = $(this).parents('tr').attr('id');
	location.href = '${conPath}/product/content.do?productCode='+productCode;
});

</script>
</body>
</html>