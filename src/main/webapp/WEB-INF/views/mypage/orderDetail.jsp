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
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">
	<style>
		html,body{
			font-family: 'Pretendard';
		}
		.mypage-content *{
			margin:0;
			padding:0;
			box-sizing:border-box;
			font-family: 'Pretendard';
		}
		a{
			text-decoration: none;
			color:#ccc;
		}
		li{
			list-style: none;
		}
		ul{
			margin:0;
			padding:0;
		}
		.mypage-content{
			width: 1250px;
    		margin: 0 auto;
    		position: relative;
		}
		.mypage-content .content-detail {
			position: relative;
		    width: 100%;
		    margin: 0 0 10px 0;
		    text-align: center;
		}
		.mypage-content .content-detail .mypage-content-line{
			display: flex;
		    flex-direction: row;
		    width: 100%;
		    -webkit-box-align: center;
		    align-items: center;
		    border-bottom: 1px solid #ccc;
		}
		
		/*table*/
		.mypage-content-wrap .right-txt table{
			width:100%;
			margin:0 auto;
			border-collapse: collapse
		}
		.mypage-content-wrap .right-txt table tr{
			border-bottom:1px solid #ddd;
		}
		.mypage-content-wrap .right-txt table tr:first-child td{
			font-weight:500;
			color:#000;
		}
		.mypage-content-wrap .right-txt table tr td{
		    text-align: center;
		    padding: 15px 10px 15px 30px;
		    font-weight: 500;
		    vertical-align: center;
		    font-size:14px;
		    color:#515151;
		    cursor:pointer;
		}
		.mypage-content-wrap .right-txt table tr td > .oCode{
			background:#be8d6e;
			color:#fff;
			padding:0px 5px; 
			border-radius:3px;
			cursor:pointer;
			display:inline-block;
			margin-top:2px;
			letter-spacing: 1px;
		}
		.mypage-content-wrap .right-txt table tr .left{
			text-align:left;
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
						<a href="#">1:1 문의하기<img alt="화살표이미지"></a>
					</span>
				</div>
				<div class="mypage-content-line"></div>
				<div class="mypage-content-wrap">
					<div class="right-txt">
						<table>
							<tr>
								<td>상품이미지</td>
								<td>상품명</td>
								<td>수량</td>
								<td>가격</td>
								<td>배송상태</td>
							</tr>
							<c:forEach items="${orderDetail}" var="order">
									<tr>
										<td style="cursor:text;">
											<a href="${conPath}/product/content.do?productCode=${order.productCode}"><img src="${conPath}/productImage/${order.image}" style="width:50px;height:50px;"></a>
										</td>
										<td scope="col" style="text-align: left;">
											${order.productName}
										</td>
										<td>${order.qty}</td>
										<td style="font-weight:700;">
											<fmt:formatNumber value="${order.cost}" pattern="#,###"/>원
										</td>
										<td>배송완료</td>
									</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="detail">
					<h2>결제정보</h2>
				</div>
				<div class="mypage-content-wrap">
					<div class="right-txt">
						<table>
							<tr>
								<td>결제정보</td>
								<td style="cursor:text;">
									${contentorder.totalPrice}
								</td>
								<td style="text-align: left;">
									${contentorder.productName}
								</td>
								
								<td style="font-weight:700;">
									<fmt:formatNumber value="${contentorder.totalPrice}" pattern="#,###"/>원
								</td>
								<td>배송완료</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="detail">
					<h2>주문정보</h2>
				</div>
				<div class="mypage-content-wrap">
					<div class="right-txt">
						<table>
							<tr>
								<td>결제정보</td>
								<td style="cursor:text;">
									${contentorder.totalPrice}
								</td>
								<td style="text-align: left;">
									${contentorder.productName}
								</td>
								
								<td style="font-weight:700;">
									<fmt:formatNumber value="${contentorder.totalPrice}" pattern="#,###"/>원
								</td>
								<td>배송완료</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="detail">
					<h2>배송정보</h2>
				</div>
				<div class="mypage-content-wrap">
					<div class="right-txt">
						<table>
							<tr>
								<td>결제정보</td>
								<td style="cursor:text;">
									${contentorder.totalPrice}
								</td>
								<td style="text-align: left;">
									${contentorder.productName}
								</td>
								
								<td style="font-weight:700;">
									<fmt:formatNumber value="${contentorder.totalPrice}" pattern="#,###"/>원
								</td>
								<td>배송완료</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>