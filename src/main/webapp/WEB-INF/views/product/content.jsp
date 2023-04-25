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
.imageArea, .infoArea, .titleImage{
	width:600px;
	height:600px;
}
.infoLeft{
	text-align: left !important;
	padding-right: 50px;
}
.left{
	text-align: left !important;
}
.right{
	text-align: right !important;
}

.nav-tabs .nav-item .nav-link {
	background-color: #FFFFFF;
	color: #000000;
	border-color:#DDDDDD;
	border-collapse:collapse;
}
.nav-tabs .nav-item .nav-link.active {
	border-top:2px solid black;
}

.plus, .minus, .delete{
	display:block;
	height:11px;
}


</style>
</head>
<body>

	<jsp:include page="../main/header.jsp"/>
	
	<div class="container">
		
		
		<div class="d-flex justify-content-center mt-5">
			
			<div class="imageArea">
				<c:forEach items="${imageList}" var="image">
					<c:if test="${image.type eq 'title'}">
						<img src="${conPath}/productImage/${image.image}" class="titleImage">
					</c:if>
				</c:forEach>
			</div>
			
			<div class="infoArea px-5">
				
				<div class="py-3">
					<h2>
						${product.productName}
					</h2>
				</div>
				
				<hr>
				
				<c:if test="${not empty product.productContent}">
					<div>
						<pre>${product.productContent}</pre>
					</div>
					<hr>
				</c:if>
				
				<table>
					
					<tr>
						<td class="infoLeft">
							판매가
						</td>
						<td class="price" id="${product.productPrice}">
							<c:if test="${product.productDiscount ne 0}">
								<del>${product.productPrice}원</del>
							</c:if>
							<c:if test="${product.productDiscount eq 0}">
								${product.productPrice}원
							</c:if>
						</td>
					</tr>
					<c:if test="${product.productDiscount ne 0}">
						<tr>
							<td class="infoLeft">
								할인판매가
							</td>
							<td class="disPrice" id="${product.productPrice - (product.productPrice * (product.productDiscount/100))}">
								<fmt:parseNumber value="${product.productPrice - (product.productPrice * (product.productDiscount/100))}" integerOnly="true"/>원
							</td>
						</tr>
					</c:if>
					<tr>
						<td class="infoLeft">
							배송비
						</td>
						<td>3000원</td>
					</tr>
					
					<c:if test="${not empty sizeList}">
						<tr>
							<td class="infoLeft">사이즈</td>
							<td>
								<select name="sizeNum" id="sizeList" class="form-select">
									<option value="0">사이즈를 고르세요</option>
									<c:forEach var="size" items="${sizeList}">
										<option value="${size.sizeNum}">${size.productSize}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</c:if>
					<c:if test="${not empty colorList}">
						<tr>
							<td class="infoLeft">색상</td>
							<td>
								<select name="colorNum" id="colorList" class="form-select">
									<option value="0">색상을 고르세요</option>
									<c:forEach var="color" items="${colorList}">
										<option value="${color.colorNum}">${color.productColor}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</c:if>
					
				</table>
				
				<hr>
				
				
				<form action="${conPath}/product/cart.do">
					<input type="hidden" name="productCode" value="${product.productCode}">
					
					<table class="w-100">
						<tbody id="result">
							<tr>
								<th class="w-50">이름</th>
								<th>수량</th>
								<th>가격</th>
							</tr>
							
						</tbody>
						<tbody>
							<tr>
								<td colspan="3" class="right pt-3">
									총 상품금액 <span id="total"></span>원
								</td>
							</tr>
						</tbody>
					</table>
				
					<input type="button" class="btn btn-dark" value="장바구니 담기">
					<input type="button" class="btn btn-outline-dark" value="즉시 구매하기">
				</form>
				
				
				
			</div><!-- infoArea -->
			
		</div><!-- d-flex -->
		
		
		
		<ul class="nav nav-tabs d-flex justify-content-center my-5">
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link active rounded-0" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proDetail" class="text-center">
		
			<c:forEach items="${imageList}" var="image">
				<c:if test="${image.type eq 'content'}">
					<p>
						<img src="${conPath}/productImage/${image.image}">
					</p>
				</c:if>
			</c:forEach>
		
		</div>
		
		<ul class="nav nav-tabs d-flex justify-content-center my-5">
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0 active" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proInfo">

			<h5>상품결제정보</h5>
			고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.
			확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.  
			<br>
			<br>
			무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.  
			주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.
			
			<h5>배송정보</h5>
			<div>
				<strong>배송 방법</strong>
				택배
			</div>
			<div>
				<strong>배송 지역</strong>
				전국 지역
			</div>
			<div>
				<strong>배송 비용</strong>
				3000원
			</div>
			<div>
				<strong>배송 기간</strong>
				1~5일
			</div>
			<div>
				<strong>배송 안내</strong>
				<br>
				 - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.
				 고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 
				 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.
			</div>
			
			<h5>교환 및 반품</h5>
			
			교환 및 반품안내<br>
			+ 교환 및 반품시 본 안내서를 작성하신 후 택배박스에 동봉해주시기 바랍니다.<br>
			   (한진택배 (1588-0011) 이용시 왕복 배송비 5,000원 동봉, 타 택배 이용시 선불 결제 후 2,500원 동봉)<br>
			+ 반품 신청시 수령 후 48시간 이내로 연락, 7일 이내로 제품이 반품지에 도착해야 교환 및 반품이 가능합니다.<br>
			+ 입점사에 따라 정책이 달라 교환 및 반품은 구매하신 입점처에서만 가능합니다.<br>
			<br>
			교환 및 반품이 불가한 경우<br>
			+ 택배 수령 후 1주일이 경과한 제품<br>
			+ 세탁 및 케이스, 택, 라벨을 제거 및 훼손하신 제품<br>
			+ 세일 및  프로모션을 통해 구매하신 제품(사전 공지)<br>
			
			
		</div>
		
		<ul class="nav nav-tabs d-flex justify-content-center my-5">
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0 active" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proReview">
			
			<h5>Review</h5>
			<div class="d-flex justify-content-end">
				<button type="button" class="btn btn-outline-dark">WRITE</button>
				<button type="button" class="btn btn-outline-dark">LIST</button>
			</div>
			<table>
				<tr><td>1</td></tr>
				<tr><td>2</td></tr>
				<tr><td>3</td></tr>
			</table>
		
		</div>
		
		<ul class="nav nav-tabs d-flex justify-content-center my-5">
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0 active" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proQna">
		
			<h5>상품 문의</h5>
		
		</div>
		
		
	</div>
	
	<jsp:include page="../main/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	
	var size = 0;
	var color = 0;
	var sizeName;
	var colorName;
	var price = Number($('.price').attr('id'));
	var disPrice = Number($('.disPrice').attr('id'));
	var totQty = 0;
	var total = 0;
	var num = 0;
	
	if(!$('.disPrice').length){ // 할인판매가가 존재하지 않는다면 
		disPrice = price;
	}
	
	$('#total').text(0); // 총 상품금액 초기화 ( 0원 )
	
	const getProductBoth = function(size, color, sizeName, colorName){
		var product = $('<tr>'
				+'<td class="d-flex justify-content-between align-items-center">'
				+'${product.productName} - '+sizeName+' '+colorName
				+'<img class="delete" src="${conPath}/img/delete.gif">'
				+'</td>'
				+'<td>'
				+'<div class="d-flex">'
				+'<input type="number" class="qty" name="qty" value="1" min="1" max="${product.productStock}">'
				+'<div class="d-flex flex-column justify-content-center">'
				+'<img class="plus" src="${conPath}/img/up.gif">'
				+'<img class="minus" src="${conPath}/img/down.gif">'
				+'</div>'
				+'</div>'
				+'</td>'
				+'<td class="obj">'
				+'<input type="hidden" class="num" value="'+num+'">'
				+'<input type="hidden" name="sizeNum" value="'+size+'">'
				+'<input type="hidden" name="colorNum" value="'+color+'">'
				+'<input type="hidden" class="pre" value="1">'
				+'<span class="price">'+price+'</span>원'
				+'</td>'
				+'</tr>');
		num++;
		return product;
	};
	const getProductSize = function(size){
		var product = $('<tr>'
				+'<td>사이즈:'+size+'</td>'
				+'<td>'
				+'<input type="hidden" class="num" value="'+num+'">'
				+'<input type="number" class="qty" name="qty" value="1" min="1" max="${product.productStock}">'
				+'<a href="#none" class="plus"><img src="${conPath}/img/up.gif"></a>'
				+'<a href="#none" class="minus"><img src="${conPath}/img/down.gif"></a>'
				+'<input type="hidden" class="pre" value="1">'
				+'<a href="#none" class="delete"><img src="${conPath}/img/delete.gif"></a>'
				+'</td>'
				+'<td><span class="price">'+price+'</span>원</td>'
				+'</tr>');
		num++;
		return product;
	};
	const getProductColor = function(color){
		var product = $('<tr>'
				+'<td>색상:'+color+'</td>'
				+'<td>'
				+'<input type="hidden" class="num" value="'+num+'">'
				+'<input type="number" class="qty" name="qty" value="1" min="1" max="${product.productStock}">'
				+'<a href="#none" class="plus"><img src="${conPath}/img/up.gif"></a>'
				+'<a href="#none" class="minus"><img src="${conPath}/img/down.gif"></a>'
				+'<input type="hidden" class="pre" value="1">'
				+'<a href="#none" class="delete"><img src="${conPath}/img/delete.gif"></a>'
				+'</td>'
				+'<td><span class="price">'+price+'</span>원</td>'
				+'</tr>');
		num++;
		return product;
	};
	const getProductNo = function(){
		var product = $('<tr>'
				+'<td>옵션없음</td>'
				+'<td>'
				+'<input type="hidden" class="num" value="'+num+'">'
				+'<input type="number" class="qty" name="qty" value="1" min="1" max="${product.productStock}">'
				+'<input type="button" class="plus" value="+">'
				+'<input type="button" class="minus" value="-">'
				+'<input type="hidden" class="pre" value="1">'
				+'</td>'
				+'<td><span class="price">'+price+'</span>원</td>'
				+'</tr>');
		num++;
		return product;
	};
	
	var products = [];	// 상품 배열
	
	if($('#sizeList').length){
		
		if($('#colorList').length){	// 사이즈,색상 둘다 존재
			console.log('둘다 존재');
		
			$('#sizeList').change(function(){
				size = $(this).val();
				sizeName = $("#sizeList option:checked").text();
				console.log(sizeName);

				if(size != 0 && color != 0){
					
					let product = products.find(product => product.size === size && product.color === color);	// 해당조건의 상품찾기
					if(product){
						console.log('이미 해당 옵션의 상품이 존재할경우');
						console.log(product);
						alert('중복된 상품입니다');
						return;
						/* products = products.filter((product) => !(product.size === size && product.color === color));
						console.log('바뀐 배열:'+products); */  // 해당 상품만 제거
						
					}else{
						product = {
							"num": num,
							"size": size,
							"color": color,
							"qty": 1,
							"price": price
						}
						products.push(product);
						console.log(products);
						
						$('#result').append(getProductBoth(size, color, sizeName, colorName));
						totQty = totQty + 1;
						$('#total').text(totQty * disPrice);
					}
				
					
					
				}
			});
			
			$('#colorList').change(function(){
				color = $(this).val();
				colorName = $("#colorList option:checked").text();
				console.log(colorName);

				if(size != 0 && color != 0){
					
					let product = products.find(product => product.size === size && product.color === color);
					if(product){
						console.log('이미 해당 옵션의 상품이 존재할경우');
						console.log(product);
						alert('중복된 상품입니다');
						return;
						/* products = products.filter((product) => !(product.size === size && product.color === color));
						console.log('바뀐 배열:'+products); */  // 해당 상품만 제거
						
					}else{
						product = {
							"num": num,
							"size": size,
							"color": color,
							"qty": 1,
							"price": price
						}
						products.push(product);
						console.log(products);
						
						$('#result').append(getProductBoth(size, color, sizeName, colorName));
						totQty = totQty + 1;
						$('#total').text(totQty * disPrice);
					}
				}
			});
			
			
		}else{						// 사이즈만 존재
			console.log('사이즈만 존재');
			$('#sizeList').change(function(){
				size = $(this).val();
				if(size != 0){
					$('#result').append(getProductSize(size));
					totQty = totQty + 1;
					$('#total').text(totQty * disPrice);
				}
			});
		}
	
	}else if($('#colorList').length){	// 사이즈는 없고 색상이 존재
		console.log('색상만 존재');
		$('#colorList').change(function(){
			color = $(this).val();
			if(color != 0){
				$('#result').append(getProductColor(color));
				totQty = totQty + 1;
				$('#total').text(totQty * disPrice);
			}
		});
		
	}else{							// 둘다 미존재
		console.log('둘다 없음');
		$('#result').append(getProductNo());
		totQty = totQty + 1;
		$('#total').text(totQty * disPrice);
		
	}
	
	

	/////////////////////////////////////////////////////////////////// 상품의 수량 증가 혹은 감소 버튼
	$(document).on("click",".plus",function(){
		
		var num = Number($(this).parents().find('.num').val());
		
		console.log(num);
		let product = products.find(product => product.num === num);
		console.log(product.qty);
		product.qty = product.qty + 1;
		console.log(products);
		
		$(this).parent().children('.qty').val(product.qty);
		$(this).parent().children('.pre').val(product.qty);
		totQty = totQty + 1;
		$('#total').text(totQty * disPrice);
		$(this).parents('tr').find('.price').text(product.qty * price);
		
	});
	$(document).on("click",".minus",function(){
		
		var num = Number($(this).parent().children('.num').val());
		
		console.log(num);
		let product = products.find(product => product.num === num);
		console.log(product.qty);
		if(product.qty -1 < 1){
			alert('최소 수량은 1개 이상입니다');
			return;
		}
		product.qty = product.qty - 1;
		console.log(products);
		
		$(this).parent().children('.qty').val(product.qty);
		$(this).parent().children('.pre').val(product.qty);
		totQty = totQty - 1;
		$('#total').text(totQty * disPrice);
		$(this).parents('tr').find('.price').text(product.qty * price);
	});
	
	
	////////////////////////////////////////////////////// 상품의 수량 변경을 직접적으로 입력
	$(document).on("change",".qty",function(){
		
		if($(this).val() < 1){
			alert('최소 수량은 1개 이상입니다');
			$(this).val(1);
		}
		
		var num = Number($(this).parent().children('.num').val());
		console.log(num);
		let product = products.find(product => product.num === num);
		
		var pre = product.qty;
		console.log('원래 수량 : ' + pre);
		console.log(products);
		
		var after = $(this).val();
		console.log('바뀐 수량 : ' + after);
		
		totQty = totQty + (after - pre);
        console.log('총수량 : ' + totQty);
        
        $('#total').text(totQty * disPrice);
        $(this).parent().children('.pre').val(after);
        product.qty = after;
        $(this).parents('tr').find('.price').text(product.qty * price);
	});

	

	
</script>

</body>
</html>