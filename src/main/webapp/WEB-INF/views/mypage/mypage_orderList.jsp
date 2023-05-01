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
</head>
<body>
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
						<option>1</option>
						<option>2</option>
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
								<td>수량</td>
								<td>결제금액</td>
								<td>결제상태</td>
							</tr>
							<tr>
								<c:forEach var="order" items="${orderList}">
									<td>${order}</td>
								</c:forEach>
							</tr>
						</table>
						<div class="paging">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>