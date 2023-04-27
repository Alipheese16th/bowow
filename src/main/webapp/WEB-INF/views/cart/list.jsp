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
}
.titleImg{
	width:80px;
	height:80px;
	cursor:pointer;
}
.title{
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

</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<div class="container pb-5">
	
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
					<tr class="plist" id="${cart.productCode}">
						<td><input type="checkbox"></td>
						<td><img class="titleImg" src="${conPath}/productImage/${cart.image}"></td>
						<td class="left">
							<div class="d-flex flex-column title">
								<span>
									${cart.productName}
								</span>
								<span>
									<c:if test="${cart.sizeNum ne 0 or cart.colorNum ne 0}">
										[옵션 :
										<c:forEach items="${sizeList}" var="size">
											<c:if test="${size.sizeNum eq cart.sizeNum}">
												${size.productSize}
											</c:if>
										</c:forEach>
										<c:forEach items="${colorList}" var="color">
											<c:if test="${color.colorNum eq cart.colorNum}">
												${color.productColor}
											</c:if>
										</c:forEach>
										]
									</c:if>
								</span>
							</div>
						</td>
						<td>
							<c:if test="${cart.productDiscount ne 0}">
								<del>${cart.productPrice}원</del>
								<br>
								<fmt:parseNumber value="${cart.productPrice - (cart.productPrice * (cart.productDiscount/100))}" integerOnly="true"/>원
							</c:if>
							<c:if test="${cart.productDiscount eq 0}">
								${cart.productPrice}원
							</c:if>
						</td>
						<td>
							<div class="d-flex">
								<input type="text" class="qty" name="qty" value="${cart.qty}" size="1" min="1" max="${cart.productStock}">
								<div class="d-flex flex-column justify-content-center">
									<img class="plus" src="${conPath}/img/up.gif">
									<img class="minus" src="${conPath}/img/down.gif">
								</div>
							</div>
						</td>
						<td>-</td>
						<td>기본배송</td>
						<td>3000원</td>
						<td>${cart.cost}원</td>
						<td>
							<div class="d-flex flex-column">
								<button type="button" class="btn btn-outline-dark">주문하기</button>
								<button type="button" class="btn btn-outline-dark">삭제</button>
							</div>
						</td>
					</tr>
					
				</c:forEach><!-- 상품리스트 -->
				
				<tr>
					<td colspan="10" class="right">
						<div class="d-flex justify-content-between px-5 py-2">
							<span>
							[기본배송]
							</span>
							<span>
								상품구매금액 152,000 + 배송비 3000원 = 합계 : 155,000원
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="d-flex justify-content-between px-5 py-1">
			<div>
				<button type="button" class="btn btn-outline-dark">선택삭제</button>
				<button type="button" class="btn btn-outline-dark">전체삭제</button>
			</div>
			<div>
				<button type="button" class="btn btn-outline-dark">선택주문</button>
				<button type="button" class="btn btn-outline-dark">전체주문</button>
			</div>
		</div>
		
		<div class="d-flex justify-content-between px-5 py-1">
			<span>
				주문금액
			</span>
			<span>
				152,000원
			</span>
		</div>
		<div class="d-flex justify-content-between px-5 py-1">
			<span>
				배송비
			</span>
			<span>
				3,000원
			</span>
		</div>
		<hr>
		<div class="d-flex justify-content-between  px-5 py-1">
			<span>
				합계
			</span>
			<span>
				155,000원
			</span>
		</div>
		<div class="d-flex justify-content-center px-5 py-1">
			<button type="button" class="btn btn-dark w-75">주문하기</button>
		</div>
		
	</div>
	<jsp:include page="../main/footer.jsp"/>

<script>
	
	$('.titleImg').click(function(){
		var productCode = $(this).parents('tr').attr('id');
		location.href = '${conPath}/product/content.do?productCode='+productCode;
	});
	$('.title').click(function(){
		var productCode = $(this).parents('tr').attr('id');
		location.href = '${conPath}/product/content.do?productCode='+productCode;
	});
	
	//////////////////////////////////// 상품 수량 업데이트
	$('.plus').click(function(){
		
	});
	
	$('.minus').click(function(){
		
	});
	
	
</script>
</body>
</html>