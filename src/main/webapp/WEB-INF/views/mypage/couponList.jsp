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
	<c:if test="${empty member}">
		<script>
			alert("로그인 후 이용해주세요");
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
					<h2>쿠폰내역</h2>
				</div>
				<div class="detail">
				</div>
			</div>
			<div class="mypage-content-line"></div>
			<div class="mypage-right-view">
				<div class="right-wrap">
					<div class="right-txt">
						<table>
							<tr>
								<td>쿠폰번호</td>
								<td>쿠폰명</td>
								<td>쿠폰가격</td>
							</tr>
							<c:if test="${couponCnt eq 0}">
								<tr><td colspan="7">사용가능한 쿠폰이 없습니다.</td></tr>
							</c:if>
							<c:if test="${couponCnt != 0}">
								<c:forEach items="${couponList}" var="coupon">
									<tr>
										<td>${coupon.couponNum}</td>
										<td>${coupon.couponName}</td>
										<td><fmt:formatNumber value="${coupon.couponDiscount}" pattern="#,###"/>원</td>
									</tr>
								</c:forEach>	
							</c:if>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>