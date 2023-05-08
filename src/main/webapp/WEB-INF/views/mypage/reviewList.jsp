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
					<h2>리뷰내역</h2>
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
								<td>글번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>날짜</td>
								<td>조회수</td>
							</tr>
							<c:if test="${paging.totCnt eq 0}">
								<tr><td colspan="7">작성한 리뷰 내역이 없습니다.</td></tr>
							</c:if>
							<c:if test="${paging.totCnt != 0}">
							<c:set var="code" value=""/>
							<c:forEach items="${memberWriteR}" var="review">
									<tr>
										<td style="cursor:text;">
											${review.reviewNum}
										</td>
										<td>
											${review.reviewTitle}
										</td>
										<td style="text-align: left;">
											${review.memberId }
										</td>
										<td style="font-weight:700;">
											${review.reviewDate}
										</td>
										<td>
											${review.reviewHit}
										</td>
									</tr>
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