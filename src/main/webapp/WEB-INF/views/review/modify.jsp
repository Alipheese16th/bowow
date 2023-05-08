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
	<link href="${conPath}/css/reviewWrite.css" rel="stylesheet">
	<link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
	<link href="${conPath}/css/star-rating.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="${conPath}/css/theme.css" media="all" rel="stylesheet" type="text/css" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="${conPath}/js/star-rating.min.js" type="text/javascript"></script>
	<script src="${conPath}/js/theme.js" type="text/javascript"></script>
	<script>
		$(document).ready(function(){
			$(".rphoto").change(function(){
				setImagFromFile(this, "#preview");
			});
			function setImagFromFile(input, expression){
				if(input.files && input.files[0]){
					var reader = new FileReader();
					reader.onload = function(e){
						$(expression).attr("src", e.target.result);
						$(expression).css("width", "100%").css("height","100%");
						$("img.image").css("display", "none");
						$(".upload_file").css("border", "none");
					}
					reader.readAsDataURL(input.files[0]);
				}
			} // file첨부
			$("form").submit(function(){
				var rtitle = $(".rtitle").val();
				var rcontent = $(".rcontent").val();
				if(rtitle==""){
					alert("리뷰작성시 제목을 입력해주세요.");
					$("#title").focus();
					return false;
				}else if(rcontent==""){
					alert("리뷰작성시 본문을 입력해주세요.");
					$("#content").focus();
					return false;
				}
			});
		    $('.kv-ltr-theme-svg-star').rating({
		        hoverOnClear: false,
		        theme: 'krajee-svg',
		        min:0,
		        max:5,
		        step:1,
		        size:'lg',
		        stars:5,
		        starCaptions:{
		        	0: 'Zero Star',
		        	1: 'One Star',
		        	2: 'Two Stars',
		        	3: 'Three Stars',
		        	4: 'Four Stars',
		        	5: 'Five Stars'
		        	},
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
	</script>
</head>
<body>
	<c:if test="${empty member}">
		<script>
			alert("로그인 후 이용해주세요.");
			location.href="${conPath}/login.do?after=review/write.do&productCode=${param.productCode}&orderCode=${param.orderCode}";
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div>
		<div id="review-form">
			<div class="review-title">리뷰 수정하기</div>
				<div class="review-wrap">
					<form action="${conPath}/review/modify.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="pageNum" value="${param.pageNum}">
					<input type="hidden" name="reviewNum" value="${contentReview.reviewNum}">
					<input type="hidden" name="category" value="${param.category}">
					<input type="hidden" name="schWord" value="${param.schWord}">
						<table>
							<tr>
								<td colspan="2" style="text-align:center;">
									<img src="${conPath}/productImage/${reviewProduct.image}" style="width:100px; height:100px; vertical-align:middle">
									<span style="margin-left:20px; font-size:18px;">
										${reviewProduct.productName}
										<c:forEach items="${orderDetail}" var="order">
											<c:if test="${param.productCode eq order.productCode}">
											<c:if test="${order.sizeNum ne 0 or order.colorNum ne 0}">
													[옵션 :
												<c:forEach items="${colorList}" var="color">
													<c:if test="${color.colorNum eq order.colorNum }">
														${color.productColor} / 
													</c:if>
												</c:forEach>
												<c:forEach items="${sizeList}" var="size">
													<c:if test="${size.sizeNum eq order.sizeNum}">
														${size.productSize}
													</c:if>
												</c:forEach>
												]
												</c:if>	
											</c:if>
										</c:forEach>
									</span>
								</td>
							</tr>
							<tr>
								<th>이번 상품 어땠나요?</th>
								<td>
									<input type="number" id="input-1-ltr-star-xs"  class="kv-ltr-theme-svg-star rating-loading" value="${contentReview.reviewScore}" min="0" max="5" dir="ltr" data-size="lg" name="reviewRating">
								</td>
							</tr>
							<tr>
								<th>사진을 첨부해주세요(선택)</th>
								<td class="file-left">
										<div class="upload_file">
											<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image">
												<img src="" id="preview">
										</div>
									<input type="file" name=rImage class="rphoto" accept="image/*">원 첨부파일 : ${contentReview.reviewImage}
								</td>
							</tr> 
							<tr>
								<th><label for="title">리뷰제목</label></th>
								<td>
									<input type="text" name="reviewTitle" class="rtitle focusB" id="title" value="${contentReview.reviewTitle }">
								</td>
							</tr>
							<tr>
								<th><label for="content">리뷰를 남겨주세요</label></th>
								<td>
									<textarea name="reviewContent" id="content" rows="12" cols="90" class="rcontent focusB"><c:out value="${contentReview.reviewContent}"/></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<button type="submit" class="btnStyle">수정</button>
									<button type="reset" class="btnStyle btn2" onclick="history.back();">이전</button>
									<button type="button" class="btnStyle btn2" onclick="location.href='${conPath}/review/list.do?pageNum=${param.pageNum}'">목록</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>