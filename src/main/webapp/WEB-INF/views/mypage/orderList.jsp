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
	<link href="${conPath}/css/mypage_orderList.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$("tr td > .oCode").click(function(){
				var orderCode = Number($(this).text());
				if(!isNaN(orderCode)){
					location.href="${conPath}/mypage/orderDetail.do?orderCode="+orderCode+"&pageNum=${paging.currentPage}";
				}
			})
		});
	</script>
</head>
<body>
	<c:if test="${empty member}">
		<script>
			alert("여기아니");
			history.back();
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<jsp:include page="../mypage/mypage_top.jsp"/>
		<div class="mypage-content">
		<jsp:include page="../mypage/mypage_left.jsp"/>
		<div class="mypage-content-right">
			<div class="content-detail">
				<div class="detail">
					<h2>주문내역</h2>
					<span style="margin-left: 20px;color: #ccc;font-size: 15px;">최대 지난 3년간의 주문 내역까지 확인할 수 있어요</span>
				</div>
				<div class="detail">
					<select>
						<option></option>
						<option></option>
					</select>
				</div>
			</div>
			<div class="mypage-content-line"></div>
			<div class="mypage-right-view">
				<div class="right-wrap">
					<div class="right-txt">
						<table>
							<tr>
								<td>주문번호</td>
								<td>&nbsp;&nbsp;&nbsp;</td>
								<td>상품명</td>
								<td>&nbsp;&nbsp;&nbsp;</td>
								<td>결제금액</td>
								<td>결제상태</td>
							</tr>
							<c:if test="${paging.totCnt eq 0}">
								<tr><td colspan="7">해당페이지에 글이 없습니다.</td></tr>
							</c:if>
							<c:if test="${paging.totCnt != 0}">
							<c:set var="code" value=""/>
							<c:forEach items="${orderList}" var="order">
								<c:if test="${code !=  order.orderCode}">
									<tr>
										<td style="cursor:text;">
											${order.orderDate}<br>
											<span class="oCode">${order.orderCode}</span>
										</td>
										<td>
											<a href="${conPath}/product/content.do?productCode=${order.productCode}"><img src="${conPath}/productImage/${order.image}" style="width:50px;height:50px;"></a>
										</td>
										<td style="text-align: left;">
											<a href="${conPath}/product/content.do?productCode=${order.productCode}" style="color:#515151;">
												${order.productName}
												<c:if test="${order.cnt > 1}">
													외 ${order.cnt-1}건
												</c:if>
											</a>
										</td>
										<td>&nbsp;&nbsp;&nbsp;</td>
										<td style="font-weight:700;">
											<fmt:formatNumber value="${order.totalPrice}" pattern="#,###"/>원
										</td>
										<td>배송완료</td>
									</tr>
								</c:if>
								<c:set var="code" value="${order.orderCode}"/>
							</c:forEach>
							</c:if>
						</table>
						<div class="paging">
							<a href="${conPath}/mypage/orderList.do?pageNum=1" class="first">1</a>
							<c:if test="${paging.startPage > paging.blockSize}">
								<a href="${conPath}/mypage/orderList.do?pageNum=${paging.startPage-1}" class="prev">이전</a>
							</c:if>
							<c:if test="${paging.blockSize >= paging.startPage}">
								<a class="prev">1</a>
							</c:if>
							<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
								<c:if test="${i eq paging.currentPage}">
									<a class="now">${i }</a>
								</c:if>
								<c:if test="${i != paging.currentPage }">
									<a href="${conPath}/mypage/orderList.do?pageNum=${i}" class="move">${i}</a>
								</c:if>
							</c:forEach>
							<c:if test="${paging.endPage < paging.pageCnt}">
								<a href="${conPath}/mypage/orderList.do?pageNum=${paging.endPage+1}" class="next"></a>
							</c:if>
							<c:if test="${paging.endPage eq paging.pageCnt}">
								<a class="next"></a>
							</c:if>
							<a href="${conPath}/mypage/orderList.do?pageNum=${paging.pageCnt}" class="last">마지막페이지</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>