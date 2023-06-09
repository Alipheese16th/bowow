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
<!-- 별점기능 -->
<link href="${conPath}/css/star-rating.min.css" media="all" rel="stylesheet" type="text/css" />
<link href="${conPath}/css/theme.css" media="all" rel="stylesheet" type="text/css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="${conPath}/js/star-rating.min.js" type="text/javascript"></script>
<script src="${conPath}/js/theme.js" type="text/javascript"></script>
<!-- 플레스 슬라이더 -->
<link rel="stylesheet" href="${conPath}/css/flexslider.css" type="text/css" media="screen" />
<script defer src="${conPath}/js/jquery.flexslider.js"></script>
<!-- css -->
<link href="${conPath}/css/product_content.css" rel="stylesheet">
</head>
<body class="loading">

	<jsp:include page="../main/header.jsp"/>
	
	<div class="container">
		
		<div class="d-flex justify-content-center my-5">
		
		<!-- 타이틀 혹은 서브타이틀 이미지 갯수 구하기 -->
		<c:set var="carnum" value="${0}"/>
		<c:forEach var="img" items="${imageList}">
			<c:if test="${img.type ne 'content'}">
				<c:set var="carnum" value="${carnum + 1}"/>
			</c:if>
		</c:forEach>
		<input type="hidden" id="carnum" value="${carnum}">
		<script>
			console.log($('#carnum').val());
		</script>
			
			<div class="imageArea">
			
				<section class="slider">
					<div class="flexslider">
						<ul class="slides">
							
							<c:forEach items="${imageList}" var="image">
								<c:if test="${image.type eq 'title' or image.type eq 'subTitle'}">
								
									<li data-thumb="${conPath}/productImage/${image.image}">
								  	<img class="d-block titleImage" src="${conPath}/productImage/${image.image}">
								  	 </li>
								  	 
							    </c:if>
							</c:forEach>
							
						</ul>
					</div>
				</section>
				
			</div><!-- imageArea -->
			
			<div class="infoArea px-5">
			
				<div class="py-3">
					<h2 class="m-0 productName">
						${product.productName}
					</h2>
				</div>
				
				<hr>
				
				<c:if test="${not empty product.productContent}">
					<div>
						<pre>${product.productContent}</pre>
					</div>
					<hr>
				</c:if>
				
				<table class="table infotable">
					<tr>
						<td class="infoLeft">
							판매가
						</td>
						<td class="price" id="${product.productPrice}">
							<c:if test="${product.productDiscount ne 0}">
								<del><fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원</del>
							</c:if>
							<c:if test="${product.productDiscount eq 0}">
								<fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원
							</c:if>
						</td>
					</tr>
					<c:if test="${product.productDiscount ne 0}">
						<tr>
							<td class="infoLeft">
								할인판매가
							</td>
							<td class="disPrice" id="${product.productPrice - (product.productPrice * (product.productDiscount/100))}">
								<fmt:formatNumber value="${product.productPrice-(product.productPrice*(product.productDiscount/100))}" pattern="#,###"/>원
							</td>
						</tr>
					</c:if>
					<tr>
						<td class="infoLeft">
							배송비
						</td>
						<td>3,000원</td>
					</tr>
					
					<c:if test="${not empty sizeList}">
						<tr>
							<td class="infoLeft">사이즈</td>
							<td>
								<select name="sizeNum" id="sizeList" class="form-select">
									<option value="0">사이즈를 고르세요</option>
									<c:forEach var="size" items="${sizeList}">
										<option value="${size.sizeNum}">${size.productSize}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</c:if>
					<c:if test="${not empty colorList}">
						<tr>
							<td class="infoLeft">색상</td>
							<td>
								<select name="colorNum" id="colorList" class="form-select">
									<option value="0">색상을 고르세요</option>
									<c:forEach var="color" items="${colorList}">
										<option value="${color.colorNum}">${color.productColor}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</c:if>
					
				</table>
				
				<input type="hidden" id="productCode" value="${product.productCode}">
				<input type="hidden" id="memberId" value="${member.memberId}">
				
				<table class="table retable">
					<thead class="thth">
						<tr>
							<th class="w-50">이름</th>
							<th>수량</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody id="result">
					</tbody>
					<tbody>
						<tr class="border-bottom">
							<td colspan="3" class="right pt-3">
								총 상품금액 <span id="total"></span>원
							</td>
						</tr>
					</tbody>
				</table>
			
				<button type="button" class="btn btn-myColor" id="cart">장바구니 담기</button>
				<button type="button" class="btn btn-myColor" id="order">즉시 구매하기</button>
				
				
			</div><!-- infoArea -->
			
		</div><!-- d-flex -->
		
		
		<ul class="nav nav-tabs d-flex justify-content-center my-5">
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link active rounded-0" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proDetail" class="text-center">
		
			<c:forEach items="${imageList}" var="image">
				<c:if test="${image.type eq 'content'}">
					<p>
						<img class="contentImg" src="${conPath}/productImage/${image.image}">
					</p>
				</c:if>
			</c:forEach>
		
		</div>
		
		<ul class="nav nav-tabs d-flex justify-content-center my-5">
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0 active" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proInfo">

			<h5>상품결제정보</h5>
			고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.
			확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.  
			<br>
			<br>
			무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.  
			주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.
			<br>
			<br>
			<h5>배송정보</h5>
			<div>
				<strong>배송 방법</strong>
				택배
			</div>
			<div>
				<strong>배송 지역</strong>
				전국 지역
			</div>
			<div>
				<strong>배송 비용</strong>
				3000원
			</div>
			<div>
				<strong>배송 기간</strong>
				1~5일
			</div>
			<div>
				<strong>배송 안내</strong>
				<br>
				 - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.
				 고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 
				 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.
			</div>
			<br>
			<br>
			<h5>교환 및 반품</h5>
			
			교환 및 반품안내<br>
			+ 교환 및 반품시 본 안내서를 작성하신 후 택배박스에 동봉해주시기 바랍니다.<br>
			   (한진택배 (1588-0011) 이용시 왕복 배송비 5,000원 동봉, 타 택배 이용시 선불 결제 후 2,500원 동봉)<br>
			+ 반품 신청시 수령 후 48시간 이내로 연락, 7일 이내로 제품이 반품지에 도착해야 교환 및 반품이 가능합니다.<br>
			+ 입점사에 따라 정책이 달라 교환 및 반품은 구매하신 입점처에서만 가능합니다.<br>
			<br>
			교환 및 반품이 불가한 경우<br>
			+ 택배 수령 후 1주일이 경과한 제품<br>
			+ 세탁 및 케이스, 택, 라벨을 제거 및 훼손하신 제품<br>
			+ 세일 및  프로모션을 통해 구매하신 제품(사전 공지)<br>
			
		</div>
		
		<ul class="nav nav-tabs d-flex justify-content-center my-5">
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0 active" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proReview" class="mb-5">
		
			<h5 class="text-center m-0">상품 리뷰</h5>
			
			<!-- 게시판시작 -->
			<c:if test="${empty reviewList}">
				<p class="my-4 text-center h6">
				해당 상품의 상품 후기가 아직 없습니다.
				</p>
			</c:if>
			<c:if test="${reviewList.size() ne 0}">
				<table class="table">
					<tbody>
						<tr><td colspan="2"></td></tr>
						<c:forEach var="review" items="${reviewList}">
							<tr>
								<td style="width:260px; height:1px; padding:20px;">
									<div style="background-color:#f8f8f8; padding:15px; height:100%;">
										<div class="d-flex justify-content-between">
										<small>${review.memberName}(${review.memberId})</small>
										<small><fmt:formatDate value="${review.reviewDate}" pattern="yy/MM/dd"/></small>
										</div>
									</div>
								</td>
								<td style="padding:20px;">
									<div style="padding:15px;">
										<div class="d-flex justify-content-between">
											<div style="font-size:1.2rem;">
											${review.reviewTitle}
											</div>
											<div>
											<input type="number" id="input-1-ltr-star-xs"  class="kv-ltr-theme-svg-star rating-loading" min="0" max="5" dir="ltr" data-size="xs" name="reviewRating" value="${review.reviewScore}">
											</div>
										</div>
										<c:if test="${not empty review.reviewImage}">
											<img class="my-3" style="width:185px; height:185px;" src="${conPath}/reviewImage/${review.reviewImage}">
										</c:if>
										<pre class="m-0">${review.reviewContent}</pre>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</c:if>
			<!-- 게시판끝 -->
			
			<!-- 페이징 -->
			<c:if test="${rpaging.totCnt > rpaging.pageSize}">
		   <nav aria-label="Page navigation" class="my-4">
		  <ul class="pagination pagination-sm justify-content-center pb-2">
		  	<c:if test="${rpaging.startPage <= rpaging.blockSize}">
			    <li class="page-item disabled">
				    <a class="page-link">
				    <span aria-hidden="true">&laquo;</span>
				    </a>
			    </li>
		  	 	</c:if>
		  	 	<c:if test="${rpaging.startPage > rpaging.blockSize}">
			    <li class="page-item">
				    <a class="page-link" href="${conPath}/product/content.do?productCode=${product.productCode}&rpageNum=${rpaging.startPage-1}#proReview">
				    <span aria-hidden="true">&laquo;</span>
				    </a>
			    </li>
		   	</c:if>
		  	 	<c:forEach var="i" begin="${rpaging.startPage}" end="${rpaging.endPage}">
		  	 		<c:if test="${i eq rpaging.currentPage}">
					<li class="page-item active"><a class="page-link">${i}</a></li>
				</c:if>
		  	 		<c:if test="${i ne rpaging.currentPage}">
					<li class="page-item"><a class="page-link" href="${conPath}/product/content.do?productCode=${product.productCode}&rpageNum=${i}#proReview">${i}</a></li>
				</c:if>
		  	 	</c:forEach>
		  	 <c:if test="${rpaging.endPage < rpaging.pageCnt}">
				<li class="page-item">
					<a class="page-link" href="${conPath}/product/content.do?productCode=${product.productCode}&rpageNum=${rpaging.endPage+1}#proReview">
					<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		  	 	<c:if test="${rpaging.endPage >= rpaging.pageCnt}">
				<li class="page-item disabled">
					<a class="page-link">
					<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		    
		  </ul>
		</nav>
		</c:if>
		<!-- 페이징 끝 -->
			
		</div> <!-- div#proReview -->
		
		<ul class="nav nav-tabs d-flex justify-content-center my-5">
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proDetail">상품정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proInfo">구매정보</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0" href="#proReview">상품후기</a>
		  </li>
		  <li class="nav-item" style="width:200px;">
		    <a class="nav-link rounded-0 active" href="#proQna">상품문의</a>
		  </li>
		</ul>
		
		<div id="proQna" class="mb-5">
		
			<h5 class="text-center m-0">상품 문의</h5>
			
			<div class="d-flex justify-content-between py-3">
				<button type="button" class="btn btn-myColor goQnaWrite">WRITE</button>
				<button type="button" class="btn btn-myColor goQnaList">LIST</button>
			</div>
			
			<!-- 게시판시작 -->
			<c:if test="${empty qnaList}">
				<p class="my-4 text-center h6">
				해당 상품의 문의 글이 존재하지 않습니다.
				</p>
			</c:if>
			<c:if test="${qnaList.size() ne 0}">
				<table class="table">
					<!-- <thead class="thth">
						<tr class="text-center">
							<th>번호</th>
							<th class="text-start">제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead> -->
					<tbody>
						<c:forEach var="qna" items="${qnaList}">
							<tr>
								<td class="text-center" style="width:100px;">
								<small>${qna.qnaNum}</small>
								</td>
								<td style="width:600px;">
									<a href="${conPath}/qna/content.do?qnaNum=${qna.qnaNum}">
										${qna.qnaTitle}
									</a>
								</td>
								<td class="text-center">
								<small>${qna.memberName}(${qna.memberId})</small>
								</td>
								<td class="text-center">
									<small><fmt:formatDate value="${qna.qnaDate}" pattern="yy/MM/dd HH:mm"/></small>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<!-- 게시판끝 -->
			
			<!-- 페이징 -->
			<c:if test="${qpaging.totCnt > qpaging.pageSize}">
		   <nav aria-label="Page navigation" class="my-4">
		  <ul class="pagination pagination-sm justify-content-center pb-2">
		  	<c:if test="${qpaging.startPage <= qpaging.blockSize}">
			    <li class="page-item disabled">
				    <a class="page-link">
				    <span aria-hidden="true">&laquo;</span>
				    </a>
			    </li>
		  	 	</c:if>
		  	 	<c:if test="${qpaging.startPage > qpaging.blockSize}">
			    <li class="page-item">
				    <a class="page-link" href="${conPath}/product/content.do?productCode=${product.productCode}&qpageNum=${qpaging.startPage-1}#proQna">
				    <span aria-hidden="true">&laquo;</span>
				    </a>
			    </li>
		   	</c:if>
		  	 	<c:forEach var="i" begin="${qpaging.startPage}" end="${qpaging.endPage}">
		  	 		<c:if test="${i eq qpaging.currentPage}">
					<li class="page-item active"><a class="page-link">${i}</a></li>
				</c:if>
		  	 		<c:if test="${i ne qpaging.currentPage}">
					<li class="page-item"><a class="page-link" href="${conPath}/product/content.do?productCode=${product.productCode}&qpageNum=${i}#proQna">${i}</a></li>
				</c:if>
		  	 	</c:forEach>
		  	 <c:if test="${qpaging.endPage < qpaging.pageCnt}">
				<li class="page-item">
					<a class="page-link" href="${conPath}/product/content.do?productCode=${product.productCode}&qpageNum=${qpaging.endPage+1}#proQna">
					<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		  	 	<c:if test="${qpaging.endPage >= qpaging.pageCnt}">
				<li class="page-item disabled">
					<a class="page-link">
					<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		    
		  </ul>
		</nav>
		</c:if>
		<!-- 페이징 끝 -->
			
		</div><!-- div#proQna -->
		
	</div><!-- container -->
	
	<jsp:include page="../main/footer.jsp"/>
	<div class="d-none confirmResult"></div>
	<div class="card rounded-0 border-0" id="cartResult">
		<div class="header p-2">
			<h5 class="m-0">장바구니담기</h5>
		</div>
		<div class="content px-3 py-5">
			<p class="m-0">장바구니에 정상적으로 상품이 담겼습니다</p>
		</div>
		<div class="d-flex text-center">
			<a class="d-block w-50 caca p-3" href="${conPath}/cart/list.do">장바구니보기</a>
			<a class="d-block w-50 gogo p-3" id="cancel" href="#">쇼핑계속하기</a>
		</div>
	</div>

<!-- js -->
<script src="${conPath}/js/product_content.js" type="text/javascript"></script>
</body>
</html>