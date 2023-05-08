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
	<link href="${conPath}/css/reviewList.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
	<link href="${conPath}/css/star-rating.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="${conPath}/css/theme.css" media="all" rel="stylesheet" type="text/css" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="${conPath}/js/star-rating.min.js" type="text/javascript"></script>
	<script src="${conPath}/js/theme.js" type="text/javascript"></script>
	<script>
		$(document).ready(function(){
			$("tr").click(function(){
				let reviewNum = Number($(this).children().eq(0).text().trim());
				if(!isNaN(reviewNum)){
					location.href="${conPath}/review/content.do?reviewNum="+reviewNum+"&pageNum=${paging.currentPage}";
				}
			});
			$('.kv-ltr-theme-svg-star').rating({
			        hoverOnClear: false,
			        theme: 'krajee-svg',
			        min:0,
			        max:5,
			        step:1,
			        size:'sm',
			        stars:5,
			        displayOnly:true,
			        showCaption:false,
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="review-wrap">
		<div class="review-title">REVIEW</div>
		<div class="review-top">
			<div class="reviewTotCnt">총 <b>${paging.totCnt}</b>개</div>
			<div>
				<form action="${conPath}/review/list.do">
					<select name="category">
						<option value=""
							<c:if test="${param.category eq ''}">selected="selected"</c:if>>
							전체
						</option>
						<option value="fashion"
							<c:if test="${param.category eq 'fashion'}">selected="selected"</c:if>>
							패션
						</option>
						<option value="toy"
							<c:if test="${param.category eq 'toy'}">selected="selected"</c:if>>
							장난감
						</option>
						<option value="food"
							<c:if test="${param.category eq 'food'}">selected="selected"</c:if>>
							음식
						</option>
						<option value="walking"
							<c:if test="${param.category eq 'walking'}">selected="selected"</c:if>>
							산책
						</option>
						<option value="clean"
							<c:if test="${param.category eq 'clean'}">selected="selected"</c:if>>
							청결
						</option>
					</select>
					<input type="text" name="schWord" value="${param.schWord}">
					<input type="submit" value="검색">
				</form>
			</div>
		</div>
		<div class="review-content">
			<table>
				<tr style="display:none;">
					<td>글번호</td>
				</tr>
				<c:if test="${paging.totCnt eq 0 }">
					<tr><td>작성된 상품리뷰가 없습니다.</td></tr>
				</c:if>
				<c:if test="${paging.totCnt != 0 }">
				<c:forEach var="review" items="${reviewList}">
					<tr>
						<td style="display:none;">${review.reviewNum}</td>
						<td>
							<div class="review-row">
								<div class="review_view">
									<div class="reviewImage">
										<c:if test='${not empty review.reviewImage}'>
											<img src="${conPath }/reviewImage/${review.reviewImage}" alt="${review.reviewImage }사진">
										</c:if>
										<c:if test='${empty review.reviewImage}'>
											<img src="${conPath }/productImage/${review.image}" alt="${review.image }사진">
										</c:if>
									</div>
									<div class="review-txt">
										<div class="reviewrating">
											<input type="number" id="input-1-ltr-star-xs"  class="kv-ltr-theme-svg-star rating-loading" min="0" max="5" dir="ltr" data-size="sm" name="reviewRating" value="${review.reviewScore}">
										</div>
										<div class="reviewTitle">
											<h3>${review.reviewTitle}</h3>
										</div>
										<div class="reviewContent">
											<div>
												${review.reviewContent}
											</div>
										</div>
										<div class="reviewName">
											${review.memberName} | <fmt:formatDate value="${review.reviewDate }" pattern="yyyy.MM.dd"/>
										</div>
										<div class="product">
											<div class="productimg">
												<img src="${conPath}/productImage/${review.image }" alt="${review.image}">
											</div>
											<div class="productName">
												${review.productName }
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
				</c:if>
			</table>
			<div class="paging">
				<a href="${conPath }/review/list.do?pageNum=1" class="first"></a>
				<c:if test="${paging.blockSize < paging.startPage}">
					<a href="${conPath }/review/list.do?pageNum=${paging.startPage-1}" class="prev"></a>
				</c:if>
				<c:if test="${paging.blockSize >= paging.startPage }">
					<a class="prev"></a>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
					<c:if test="${i eq paging.currentPage}">
						<a class="now">${i }</a>
					</c:if>
					<c:if test="${i != paging.currentPage }">
						<a href="${conPath }/review/list.do?pageNum=${i}" class="move">${i }</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage < paging.pageCnt }">
					<a href="${conPath }/review/list.do?pageNum=${endPage+1}" class="next"></a>
				</c:if>
				<c:if test="${paging.endPage eq paging.pageCnt}">
					<a class="next"></a>
				</c:if>
					<a href="${conPath }/review/list.do?pageNum=${paging.pageCnt}" class="last"></a>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>