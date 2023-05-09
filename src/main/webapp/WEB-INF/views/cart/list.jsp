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
<link href="${conPath}/css/cart_list.css" rel="stylesheet">
</head>
<body>
	<c:if test="${empty member}">
		<script>
			alert('로그인이 취소되었습니다. 다시 로그인해주십시오');
			location.href='${conPath}/login.do?after=cart/list.do';
		</script>
	</c:if>
	<input type="hidden" id="memberId" value="${member.memberId}">
	<jsp:include page="../main/header.jsp"/>
	
	<div class="container pb-5">
	
		<h1 class="heading">CART</h1>
		
		<c:if test="${empty cartList}">
		
			<div class="emp p-3">
				<h2 class="text-center py-5">상품이 존재하지 않습니다</h2>
				<hr class="pb-3">
				<div class="d-flex justify-content-between">
					<button type="button" class="btn btn-myColor" onclick="location.href='${conPath}/main.do'">메인 페이지</button>
					<button type="button" class="btn btn-myColor" onclick="location.href='${conPath}/product/list.do'">상품 추가하러 가기</button>
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
								<del>
									<fmt:formatNumber value="${cart.productPrice}" pattern="#,###"/>원
								</del>
								<br>
								<fmt:formatNumber value="${cart.productPrice - (cart.productPrice * (cart.productDiscount/100))}" pattern="#,###"/>원
							</c:if>
							<c:if test="${cart.productDiscount eq 0}">
								<fmt:formatNumber value="${cart.productPrice}" pattern="#,###"/>원
							</c:if>
						</td>
						<td>
							<div class="d-flex justify-content-center mb-1">
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
						<td>3,000원</td>
						<td>
							<span class="cost" id="${cart.cost}">
								<fmt:formatNumber value="${cart.cost}" pattern="#,###"/>원
							</span>
						</td>
						<td>
							<div class="d-flex flex-column justify-content-center align-items-center">
								<button type="button" class="btn btn-myColor w-75 order mb-1">주문하기</button>
								<button type="button" class="btn btn-outline-myColor w-75 delete">삭제</button>
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
								상품구매금액 <fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원 
								+ 배송비 3,000원 
								= 합계 : <fmt:formatNumber value="${totalPrice + 3000}" pattern="#,###"/>원
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="d-flex justify-content-between px-5 py-3">
			<div>
				<input type="submit" class="btn btn-outline-myColor" name="submit" value="선택삭제">
				<input type="button" class="btn btn-myColor deleteAll" value="전체삭제">
			</div>
			<div>
				<input type="submit" class="btn btn-outline-myColor selectOrder" name="submit" value="선택주문">
				<input type="button" class="btn btn-myColor orderAll" value="전체주문">
			</div>
		</div>
		
		</form>
		
		<table class="table mytable">
			<tr>
				<th>주문금액</th><td><fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</td>
			</tr>
			<tr>
				<th>배송비</th><td>3,000원</td>
			</tr>
			<tr>
				<th class="border-0">합계</th><td class="border-0"><fmt:formatNumber value="${totalPrice + 3000}" pattern="#,###"/>원</td>
			</tr>
			<tr>
				<td colspan="2" class="border-0">
					<div class="d-flex justify-content-center lastorder">
						주문하기
					</div>
				</td>
			</tr>
		</table>
		
		</c:if>
		
	</div>
	<jsp:include page="../main/footer.jsp"/>

<script src="${conPath}/js/cart_list.js"></script>
</body>
</html>