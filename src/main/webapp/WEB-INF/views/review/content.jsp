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
	<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">
	<link href="${conPath }/css/reviewContent.css" rel="stylesheet" type="text/css">
	<style>
		#review-form .review-wrap .product{
			text-align: center;
		    border-top: 1px solid #ddd;
		    border-bottom: 1px solid #ddd;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
	<link href="${conPath}/css/star-rating.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="${conPath}/css/theme.css" media="all" rel="stylesheet" type="text/css" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="${conPath}/js/star-rating.min.js" type="text/javascript"></script>
	<script src="${conPath}/js/theme.js" type="text/javascript"></script>
	<script>
		$(document).ready(function(){
		 $('.kv-ltr-theme-svg-star').rating({
		        hoverOnClear: false,
		        theme: 'krajee-svg',
		        min:0,
		        max:5,
		        step:1,
		        size:'md',
		        stars:5,
		        displayOnly:true,
		        showCaption:true,
		        starCaptions: function(val) {
	        		if (val==0) {
	        			return '0';
	        		}else if(val==1){
	        		    return '아쉬워요. 다음 번엔 더 좋은 상품 부탁 드려요.';
	        		} else if(val==2) {
	        		    return '예상보다 좀 아쉬워요.';
	        		}else if(val==3){
	        			return '무난한 상품이에요.';
	        		}else if(val==4){
	        			return '만족해요. 기대 이상이에요!';
	        		}else if(val==5){
	        			return '매우 만족해요! 좋은 상품 감사합니다.';
	        		}
	        	}
			});
		});
	 	function modifyComment(commentNum, pageNum, reviewNum, commentPageNum){
	 		$.ajax({
	 			url : '${conPath}/review/rcommentModify.do',
	 			data : {'commentNum':commentNum,'pageNum':pageNum, 'commentPageNum':commentPageNum},
	 			type : 'get',
	 			dataType : 'html',
	 			success : function(data, status){
	 				$(".comment"+commentNum).html(data);
	 			}
	 		});
	 	}
	</script>
</head>
<body>
	<c:if test="${not empty rcommentResult}">
		<script>alert("${rcommentResult}");</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
		<div>
			<div id="review-form">
				<div class="review-title">REVIEW</div>
				<div class="review-wrap">
					<!-- ${contentReview} ${param.reviewNum} ${param.pageNum} 들어옴 -->
					<table>
						<tr>
							<td class="product">
								<img src="${conPath }/productImage/${contentReview.image}" alt="${contentReview.image }사진" style="width:150px; height:150px;vertical-align:middle">
 								<div style="display: inline-table; margin-left:20px;text-align: left;font-size: 18px;font-weight: 400;">
 									<span>${contentReview.productName}</span><br>
 									<span style="display:block;margin-top:7px;"><fmt:formatNumber value="${contentReview.productPrice}" pattern="#,###"/>원</span>
 								</div>
							</td>
						</tr>
						<tr>
							<td class="title">
								<span>${contentReview.reviewTitle }</span>
							</td>
						</tr>
						<tr>
							<td class="name">
								${contentReview.memberName} 고객님 | <fmt:formatDate value="${contentReview.reviewDate }" type="date" pattern="yyyy.MM.dd"/>
								<input type="number" id="input-1-ltr-star-xs"  class="kv-ltr-theme-svg-star rating-loading" min="0" max="5" dir="ltr" data-size=md name="reviewRating" value="${contentReview.reviewScore}">
							</td>
						</tr>
						<tr>
							<td class="rphotView">
								<c:if test='${not empty contentReview.reviewImage}'>
									<img src="${conPath }/reviewImage/${contentReview.reviewImage}" alt="${contentReview.reviewImage }사진" style="max-width: 700px;">
								</c:if>
								<c:if test='${empty contentReview.reviewImage}'>
									<img src="${conPath }/productImage/${contentReview.image}" alt="${contentReview.image }사진" style="max-width: 700px;">
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="content">
								${contentReview.reviewContent }
							</td>
						</tr> 
					</table>
					<!-- 댓글 리스트 시작 -->
					<h4 style="margin-bottom:10px;font-weight:400;margin-top:50px;">댓글 <b>${comPaging.totCnt}</b></h4>
					<c:if test="${empty rcommentList}">등록된 댓글이 없습니다.</c:if>
					<c:forEach items="${rcommentList}" var="rcomment">
					<div class="comments" style="border-top:1px solid #ddd;">
						<div class="comment${rcomment.commentNum} comment-box" style="padding:12px 20px;">
							<div class="comment-id" style="font-size:14px;font-weight:600;margin-bottom:4px;position: relative;">
								${rcomment.memberId}
								<c:if test="${member.memberId eq rcomment.memberId }">
									<button type="button" class="btn" onclick="modifyComment(${rcomment.commentNum},${param.pageNum},${contentReview.reviewNum},${comPaging.currentPage})" style="position:absolute;right:40px;color:#222;font-size:13px;background:none;">수정</button>
									<span style="position: absolute;right: 32px;width: 1px;height: 11px;background-color: #222;top: 5px;"></span>
									<a onclick="location.href='${conPath}/review/rcommentDelete.do?commentNum=${rcomment.commentNum}&reviewNum=${contentReview.reviewNum}&pageNum=${param.pageNum}&commentPageNum=${comPaging.currentPage}'" class="btn" style="color:#222;position:absolute;right:0;font-size:13px;">삭제</a>
								</c:if>
							</div>
							<p style="font-size:14px;margin-bottom:4px; color:#222;"><span style="line-height:17px;">${rcomment.commentContent}</span></p>
							<div class="comment-date">
								<div style="color:#888;">
									<span style="vertical-align: middle;">${rcomment.commentDate}</span>
									
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<div class="paging">
						<c:if test="${comPaging.startPage > comPaging.blockSize}">
							<a href="${conPath}/review/content.do?reviewNum=${param.reviewNum}&pageNum=${param.pageNum}&commentPageNum=${comPaging.startPage-1}" class="prev">이전</a>
						</c:if>	
						<c:forEach var="i" begin="${comPaging.startPage}" end="${comPaging.endPage}">
							<c:if test="${i eq comPaging.currentPage}">
								<b>${i}</b>
							</c:if>
							<c:if test="${i != comPaging.currentPage}">
								<a href="${conPath}/review/content.do?reviewNum=${param.reviewNum}&pageNum=${param.pageNum}&commentPageNum=${i}">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${comPaging.endPage < comPaging.pageCnt}">
							<a href="${conPath}/review/content.do?reviewNum=${param.reviewNum}&pageNum=${param.pageNum}&commentPageNum=${comPaging.endPage+1}" class="next">다음</a>
						</c:if>					
					</div>
					<c:if test="${not empty member }">
					<div class="comment-wrap">
						<form action="${conPath}/review/rcommentWrite.do" method="post">
							<input type="hidden" name="reviewNum" value="${param.reviewNum}">
							<input type="hidden" name="pageNum" value="${param.pageNum}">
							<input type="hidden" name="memberId" value="${member.memberId}">
							<div class="comment-inbox" style="border:2px solid #ddd;border-radius:5px;padding:12px 20px;">
								<span style="display:block;margin-bottom:10px;font-weight:600;font-size:14px;">${member.memberId}</span>
								<textarea rows="2" cols="5" name="commentContent" placeholder="댓글을 남겨보세요" style="width:100%;border:0;"></textarea>
								<div style="color:#888;text-align:right;padding-top:10px;">
									<input type="submit" value="등록" class="btn" style="background-color:#fff;">
								</div>
							</div>
						</form>
					</div>
					</c:if>
					<div class="review-btn" style="text-align: center;">  
						<c:if test="${member.memberId eq contentReview.memberId}">
							<button type="button" class="btnStyle" onclick="location.href='${conPath}/review/modify.do?reviewNum=${contentReview.reviewNum }&pageNum=${param.pageNum}&productCode=${contentReview.productCode}'">수정</button>
							<button type="button" class="btnStyle btn2" onclick="location.href='${conPath}/review/delete.do?reviewNum=${contentReview.reviewNum}&pageNum=${param.pageNum}'">삭제</button>
						</c:if>
						<button type="button" class="btnStyle btn2" onclick="location.href='${conPath}/review/list.do?pageNum=${param.pageNum}'">목록</button>
					</div>
					<c:if test="${empty member}">
						<p style="text-align: right;">댓글 작성 권한이 없습니다.
						<button onclick="location.href='${conPath}/login.do?after=review/content.do?reviewNum=${param.reviewNum}'" class="loginBtn">로그인</button></p>
					</c:if>
				</div>
			</div>
		</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>