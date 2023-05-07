<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/mypage_orderDetail.css" rel="stylesheet">
	<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">
	<style>
		.mypage-content .detail-ordercode>span{
			font-size:13px;
			color:rgb(102,102,102);
		}
		.mypage-content .detail-ordercode>span a{
			color:#be8d6e;
		}
		.mypage-content .detail-ordercode .svg-icon{
			display: inline-block;
		    width: 20px;
		    height: 20px;
		    vertical-align: top;
		}
		.mypage-content .detail-ordercode span .st0{
			fill:#be8d6e;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
	<jsp:include page="../main/header.jsp"/>
		<div class="mypage-content">
			<div class="content-detail">
				<div class="detail">
					<h2>주문 내역 상세</h2>
				</div>
				<div class="detail-ordercode">
					<span>
						배송 또는 상품에 문제가 있나요?
						<a href="${conPath}/inquiry/list.do">
							1:1 문의하기
							<span class="svg-icon">
								<svg id="Layer_1" style="enable-background:new 0 0 64 64;" version="1.1" viewBox="0 0 64 64" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
								<g>
									<g id="Icon-Chevron-Left" transform="translate(237.000000, 335.000000)">
										<polyline class="st0" id="Fill-35" points="-210.9,-289 -212.9,-291 -201.1,-302.7 -212.9,-314.4 -210.9,-316.4 -197.1,-302.7-210.9,-289"/>
									</g>
								</g>
								</svg>
							</span>
						</a>
					</span>
				</div>
				<div class="mypage-content-line"></div>
				<div class="mypage-content-wrap">
					<div class="right-txt">
						<table>
							<tr>
								<td class="pimg">상품이미지</td>
								<td class="pname">상품명</td>
								<td class="pqty">수량</td>
								<td class="pcost">가격</td>
								<td class="pnow">배송상태</td>
							</tr>
							<c:forEach items="${orderDetail}" var="order">
									<tr>
										<td style="cursor:text;">
											<a href="${conPath}/product/content.do?productCode=${order.productCode}"><img src="${conPath}/productImage/${order.image}" style="width:50px;height:50px;"></a>
										</td>
										<td style="text-align: left;">
											<a href="${conPath}/product/content.do?productCode=${order.productCode}">${order.productName}</a><br>								
											<c:if test="${order.sizeNum ne 0 or order.colorNum ne 0}">
												[옵션 :
												<c:forEach items="${colorList}" var="color">
													<c:if test="${color.colorNum eq order.colorNum}">
														<span class="colorNum" id="${order.colorNum}">
															${color.productColor} /
														</span>
													</c:if>
												</c:forEach>
												<c:forEach items="${sizeList}" var="size">
													<c:if test="${size.sizeNum eq order.sizeNum}">
														<span class="sizeNum" id="${order.sizeNum}">
															${size.productSize}
														</span>
													</c:if>
												</c:forEach>
												]
											</c:if>												
										</td>
										<td>${order.qty}</td>
										<td style="font-weight:700;">
											<c:if test="${order.productDiscount != 0}">
												<span style="text-decoration:line-through; font-weight:500;">
													<fmt:formatNumber value="${order.productPrice * order.qty}" pattern="#,###"/></span>원<br>
												<fmt:formatNumber value="${order.cost}" pattern="#,###"/>원
											</c:if>
											<c:if test="${order.productDiscount eq 0}">
												
											<fmt:formatNumber value="${order.cost}" pattern="#,###"/>원
											</c:if>
											
										</td>
										<td>
											배송완료
											<button onclick="location.href='${conPath}/review/write.do?productCode=${order.productCode}&orderCode=${order.orderCode}'">구매후기</button>
										</td>
									</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- 결제정보 -->
				<div class="detail" style="margin-top:30px;">
					<h2>결제정보</h2>
				</div>
				<div class="mypage-content-line"></div>
				<div class="mypage-content-wrap">
					<div class="right-txt secP">
					<c:set var="ship" value="3000"/>
						<table>
								<tr>
									<th class="row">총 주문금액</th>
									<td style="cursor:text;font-weight:600; color:#666;">
										<fmt:formatNumber  value="${sumPrice+totaldiscount}" pattern="#,###"/>원
									</td>
								</tr>
								<tr>
									<th class="row">배송비</th>
									<td>
										<fmt:formatNumber value="${ship}" pattern="#,###"/>원</td>
								</tr>
								<tr>
									<th class="row">총 할인금액</th>
									<td style="font-weight:500;">
											<c:set var="coupon" value="${(sumPrice+totaldiscount)-(contentorder.totalPrice-ship)-totaldiscount}"/>
											<fmt:formatNumber value="${totaldiscount+coupon}" pattern="#,###"/>원 (상품할인 : <fmt:formatNumber value="${totaldiscount}"/>원 ,
											 쿠폰사용 : <fmt:formatNumber value="${coupon}"/>원)
									</td>	
								</tr>
								<tr>
									<th class="row">결제금액</th>
									<td style="font-weight:700;font-size:16px;">
										<fmt:formatNumber value="${contentorder.totalPrice}" pattern="#,###"/>원
									</td>
								</tr>
						</table>
					</div>
				</div>
				<!-- 주문정보 -->
				<div class="detail" style="margin-top:30px;">
					<h2>주문정보</h2>
				</div>
				<div class="mypage-content-line"></div>
				<div class="mypage-content-wrap">
					<div class="right-txt secP">
						<table>
							<tr>
								<th class="row">주문번호</th>
								<td>${contentorder.orderCode}</td>
							</tr>
							<tr>
								<th class="row">주문일자</th>
								<td>${contentorder.orderDate}</td>
							</tr>
							<tr>
								<th class="row">주문자</th>
								<td>
									${contentorder.orderName}
								</td>
							</tr>
							<tr>
								<th class="row">주문처리상태</th>
								<td>배송완료</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="detail" style="margin-top:30px;">
					<h2>배송정보</h2>
				</div>
				<div class="mypage-content-line"></div>
				<div class="mypage-content-wrap" style="margin-bottom:50px;">
					<div class="right-txt secP">
						<table>
							<tr>
								<th class="row">받는분</th>
								<td>${contentorder.orderName}</td>
							</tr>
							<tr>
								<th class="row">우편번호</th>
								<td>${contentorder.orderPost}</td>
							</tr>
							<tr>
								<th class="row">주소</th>
								<td>${contentorder.orderAddr1}${contentorder.orderAddr2 }</td>
							</tr>
							<tr>
								<th class="row">연락처</th>
								<td>${contentorder.orderTel}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<p style="text-align:right; margin-bottom:70px;">
				<button onclick="history.back();" class="mypage_btn">
					주문목록으로가기
					<span>
						<svg id="Layer_1" style="enable-background:new 0 0 64 64;" version="1.1" viewBox="0 0 64 64" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
						<g>
							<g id="Icon-Chevron-Left" transform="translate(237.000000, 335.000000)">
								<polyline class="st0" id="Fill-35" points="-210.9,-289 -212.9,-291 -201.1,-302.7 -212.9,-314.4 -210.9,-316.4 -197.1,-302.7-210.9,-289"/>
							</g>
						</g>
						</svg>
					</span>
				</button>
			</p>
		</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>