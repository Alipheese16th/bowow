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
	min-width: 1200px !important;
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
.lastorder{
	width:50%;
	margin:0 auto;
	background: #BE8D6E;
	color: white;
	font-size: 24px;
	font-weight: bold;
	height:50px;
	vertical-align:middle;
	cursor:pointer;
}

.mytable{
	width:80%;
	margin:50px auto;
	box-sizing:border-box;
	border-collapse: collapse;
}
.mytable th{
	font-weight:normal;
	text-align:left;
	padding:5px 0;
}
.mytable td{
	text-align:right;
	padding:5px 0;
}

</style>
</head>
<body>
	<input type="hidden" id="memberId" value="${member.memberId}">
	<jsp:include page="../main/header.jsp"/>
	
	<div class="container pb-5">
	
		<h3 class="text-center py-5">CART</h3>
		
		<c:if test="${empty cartList}">
		
			<div class="p-3">
				<h1 class="text-center py-5">상품이 존재하지 않습니다</h1>
				<hr class="pb-3">
				<div class="d-flex justify-content-between">
					<button type="button" class="btn mybtn" onclick="location.href='${conPath}/main.do'">메인 페이지</button>
					<button type="button" class="btn mybtn" onclick="location.href='${conPath}/product/list.do'">상품 추가하러 가기</button>
				</div>
			</div>
		
		</c:if>
		
		<c:if test="${not empty cartList}">
		
		<form action="${conPath}/cart/select.do" class="selectForm">
		
		<table class="table">
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" class="chkAll"></th>
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
				<c:set var="totalPrice" value="0"/>
				<c:set var="num" value="1"/>
				<c:forEach items="${cartList}" var="cart">
					<tr class="plist" id="${cart.productCode}">
						<td>
							<input type="checkbox" class="chk" name="cartNum" value="${cart.cartNum}">
							<input type="hidden" class="num" value="${num}">
						</td>
						<td>
							<img class="titleImg" src="${conPath}/productImage/${cart.image}">
						</td>
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
												<span class="sizeNum" id="${cart.sizeNum}">
													${size.productSize}
												</span>
											</c:if>
										</c:forEach>
										<c:forEach items="${colorList}" var="color">
											<c:if test="${color.colorNum eq cart.colorNum}">
												<span class="colorNum" id="${cart.colorNum}">
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
							<div class="d-flex justify-content-center">
								<input class="form-control form-control-sm qty" type="text" value="${cart.qty}" min="1" max="${cart.productStock}">
								<div class="d-flex flex-column justify-content-center">
									<img class="plus" src="${conPath}/img/up.gif">
									<img class="minus" src="${conPath}/img/down.gif">
								</div>
							</div>
							<div>
								<img class="change" src="${conPath}/img/change.gif">
							</div>
						</td>
						<td>-</td>
						<td>기본배송</td>
						<td>3000원</td>
						<td>
							<span class="cost" id="${cart.cost}">
								${cart.cost}원
							</span>
						</td>
						<td>
							<div class="d-flex flex-column">
								<input type="button" class="btn btn-outline-dark order" value="주문하기">
								<input type="button" class="btn btn-outline-dark delete" value="삭제">
							</div>
						</td>
					</tr>
				<c:set var="totalPrice" value="${totalPrice + cart.cost}"/>
				<c:set var="num" value="${num + 1}"/>
				</c:forEach><!-- 상품리스트 -->
				
				<tr>
					<td colspan="10" class="right">
						<div class="d-flex justify-content-between px-5 py-2">
							<span>
							[기본배송]
							</span>
							<span>
								상품구매금액 ${totalPrice}원 + 배송비 3000원 = 합계 : ${totalPrice + 3000}원
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="d-flex justify-content-between px-5 py-1">
			<div>
				<input type="submit" class="btn btn-outline-dark" name="submit" value="선택삭제">
				<input type="button" class="btn btn-outline-dark deleteAll" value="전체삭제">
			</div>
			<div>
				<input type="submit" class="btn btn-outline-dark selectOrder" name="submit" value="선택주문">
				<input type="button" class="btn btn-outline-dark orderAll" value="전체주문">
			</div>
		</div>
		
		</form>
		
		<table class="mytable">
			<tr>
				<th>주문금액</th><td>${totalPrice}원</td>
			</tr>
			<tr>
				<th>배송비</th><td>3,000원</td>
			</tr>
			<tr>
				<th>합계</th><td>${totalPrice + 3000}원</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="d-flex justify-content-center px-5 py-1 lastorder">
						주문하기
					</div>
				</td>
			</tr>
		</table>
		
		</c:if>
		
	</div>
	<jsp:include page="../main/footer.jsp"/>

<script>
	
	var memberId = $('#memberId').val();
	//var products = [];
	
	// 이미지나 상품명 누르면 상품상세보기로 이동
	$('.titleImg').click(function(){
		var productCode = $(this).parents('tr').attr('id');
		location.href = '${conPath}/product/content.do?productCode='+productCode;
	});
	$('.title').click(function(){
		var productCode = $(this).parents('tr').attr('id');
		location.href = '${conPath}/product/content.do?productCode='+productCode;
	});
	
/* 	/////// 체크박스 선택시 상품 객체배열로 저장 , 선택 해제시 객체배열에서 삭제
	$('.chk').change(function(){
		console.log($(this).val);
		var num = $(this).parents('.plist').find('.num').val();
		var productCode = $(this).parents('.plist').attr('id');
		var sizeNum = $(this).parents('.plist').find('.sizeNum').attr('id');
		var colorNum = $(this).parents('.plist').find('.colorNum').attr('id');
		var qty = $(this).parents('.plist').find('.qty').val();
		var cost = $(this).parents('.plist').find('.cost').attr('id');
		if($('.chk').is(':checked')){	// 체크박스 선택
			let product = {
				"num": num,
				"productCode": productCode,
				"sizeNum": sizeNum,
				"colorNum": colorNum,
				"qty": qty,
				"cost": cost
			}
			products.push(product);
			console.log(products);
		}else{	// 체크박스 해제
			products = products.filter(product => product.num !== num);		// 배열 수정
			console.log('배열바뀜');
			console.log(products);
		}
	});// 체크박스로직 */
	
	// 전체체크박스 선택시 전체선택
	$('.chkAll').change(function(){
		if($('.chkAll').is(':checked')){
			$('.chk').prop('checked',true);
		}else{
			$('.chk').prop('checked',false);
		}
	});
	
	///////// 상품 수량 업데이트
	$('.change').click(function(){
		var productCode = $(this).parents('.plist').attr('id');
		var qty = $(this).parents('.plist').find('.qty').val();
		var cartNum = Number($(this).parents('.plist').find('.chk').val());
		var parameter = '';
		parameter += 'cartNum='+cartNum+'&productCode='+productCode+'&qty='+qty;
		location.href='${conPath}/cart/updateCart.do?'+parameter;
	});
	$('.plus').click(function(){
		var productCode = $(this).parents('.plist').attr('id');
		var qty = Number($(this).parents('.plist').find('.qty').val()) + 1;
		var cartNum = Number($(this).parents('.plist').find('.chk').val());
		var parameter = '';
		parameter += 'cartNum='+cartNum+'&productCode='+productCode+'&qty='+qty;
		location.href='${conPath}/cart/updateCart.do?'+parameter;
	});
	$('.minus').click(function(){
		var productCode = $(this).parents('.plist').attr('id');
		var qty = Number($(this).parents('.plist').find('.qty').val()) - 1;
		var cartNum = Number($(this).parents('.plist').find('.chk').val());
		var parameter = '';
		parameter += 'cartNum='+cartNum+'&productCode='+productCode+'&qty='+qty;
		location.href='${conPath}/cart/updateCart.do?'+parameter;
	});
	//// 상품 하나 삭제버튼
	$('.delete').click(function(){
		var cartNum = Number($(this).parents('.plist').find('.chk').val());
		location.href='${conPath}/cart/deleteCart.do?cartNum='+cartNum;
	});
	//// 상품 하나 주문버튼
	$('.order').click(function(){
		var cartNum = Number($(this).parents('.plist').find('.chk').val());
		location.href='${conPath}/order/orderCart.do?cartNum='+cartNum;
	});
	//// 전체삭제 버튼
	$('.deleteAll').click(function(){
		location.href='${conPath}/cart/deleteAll.do?memberId='+memberId;
	});
	// 전체주문 버튼
	$('.orderAll').click(function(){
		$('.chk').prop('checked',true);
		$('.selectOrder').click();
	});
	// 선택이 하나도 없을경우 서브밋 금지
	$('.selectForm').submit(function(){
		if($('.chk:checked').length < 1){
			alert('선택된 상품이 없습니다');
			return false;
		}
	});
	// 맨아래 주문하기버튼
	$('.lastorder').click(function(){
		$('.chk').prop('checked',true);
		$('.selectOrder').click();
	});
	
</script>
</body>
</html>