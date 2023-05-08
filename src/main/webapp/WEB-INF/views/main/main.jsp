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
	<link href="${conPath}/css/main.css">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
	<style>
	    html,body {
	      position: relative;
	      height: 100%;
	      font-family: 'Pretendard';
	    }
		#content{height:auto; width:100%; margin:0 auto;}
			
	    .main-slide .swiper {
	      min-width:1250px;
	      height: 500px;
	    }
	    .swiper-slide {
	      text-align: center;
	      font-size: 18px;
	      background: #fff;
	      display: flex;
	      justify-content: center;
	      align-items: center;
	    }
	    .swiper-slide img {
	      display: block;
	      width: 100%;
	      height: 100%;
	      object-fit: cover;
	    }
	    .swiper-button-next, .swiper-button-prev{
	    	color:#ccc;
	    }
	    .swiper .swiper-slide .text-right{
	    	position: absolute;
		    top: 180px;
		    right: 300px;
		    color: black;
		    letter-spacing: 0.01em;
		    font-weight: 300;
		    text-align: left;
		    min-width: 300px;
	    }
	    .swiper .swiper-wrapper .bg-color{
	    	background:#f5f5f5;
	    }
	    .swiper .swiper-slide .text-right .sub-txt1{
	    	color: #888;
    		font-size: 20px;
    		font-weight: 400;
	    }
	    .swiper .swiper-slide .text-right .main-txt{
	    	color: #000;
		    font-size: 40px;
		    font-weight: 900;
		    padding: 10px 0 25px 0;
	    }
	    .swiper .swiper-slide .text-right .sub-txt2{
	    	color: #888;
			font-size: 20px;
			font-weight: 400;
	    }
	    .swiper-scrollbar-drag{
	    	background:#BE8D6E;
	    }
	    #content .new-product{
	    	margin-top:50px;
	    }
	    #content .new-product .newP-wrap{
	    	width:1250px;
	    	margin:0 auto;
	    	overflow: hidden;
	    }
	    #content .new-product .newP-wrap .p-title{
	    	width:1100px;
	    	margin:0 auto;
	    }
	    #content .new-product .newP-wrap .p-title h2{
	    	font-size: 25px;
		    font-weight: bold;
		    color: #333;
		    margin-bottom: 30px;
		    text-align: center;
	    }
	    /*new-p swiper*/
	    .new-product .swiper-slide {
	      background-size: cover;
	      background-position: center;
	      display:block;
	    }
	    .mySwiper2 {
	      height: 50%;
	      width: 500px;
	    }
	
	    .mySwiper3 {
	      height: 20%;
	      box-sizing: border-box;
	      padding: 10px 0;
	    }
	
	    .mySwiper3 .swiper-slide {
	      width: 200px;
	      display:table-cell;
	      height: 100%;
	      opacity: 0.4;
	    }
	
	    .mySwiper3 .swiper-slide-thumb-active {
	      opacity: 1;
	    }
	    .new-product .swiper-slide{
	    	width:450px;
	    }
	    .new-product .newp-sub .swiper{
	    	display: contents
	    }
	    .mySwiper3 .swiper-slide{
	    	width:50%;
	    }
	    .newp-sub{
	    	display: inline-block;
	    }
	    .newp-sub .swiper-slide{
	    	width:200px;
	    }
	    .newp-sub .swiper{
	    	width:800px;
	    }
	    .newp-sub .swiper-wrapper{
	    	display: table-cell;
	    }
	    .newp-sub .swiper-slide:nth-child(1), .newp-sub .swiper-slide:nth-child(5){
	    	float:left;
	    }
	    .best-product{
	    	margin-bottom:50px;
	    	margin-top:50px;
	    }
	    .best-product .bp-wrap{
    		width:1250px;
    		margin:0 auto;
    	}
	    .best-product .bp-wrap .swiper{
	      width: 100%;
	      height: 100%;
    	}
		.best-product .bp-wrap .swiper .swiper-slide{
			height:300px;
		}
		#content .best-product .bp-wrap .bp-title{
	    	width:1100px;
	    	margin:0 auto;
	    }
	    #content .best-product .bp-wrap .bp-title h2{
	    	font-size: 25px;
		    font-weight: bold;
		    color: #333;
		    margin-bottom: 30px;
		    text-align: center;
	    }
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<div class="main-slide">
			<!-- Swiper -->
		  <div class="swiper mySwiper">
		    <div class="swiper-wrapper">
		      <div class="swiper-slide bg-color">
		      	<div style="width:1250px;margin:0 auto;">
			      	<div class="text-right">
			      		<div class="sub-txt1">#PROMOTION</div>
			      		<div class="main-txt">WE LIVE IN A BIG PAWS TOWN!</div>
			      		<div class="sub-txt2">
			      			빅포우즈타운 23SS 신상 아이템을 할인된 가격으로!
			      		</div>
			      	</div>
						<a href="#"><img src="${conPath}/img/bannerimg1.jpeg" alt="메인1"></a>
					</div>
				</div>
		      <div class="swiper-slide bg-color">
		      	<div style="width:1250px;margin:0 auto;">
					<div class="text-right">
			      		<div class="sub-txt1">#PROMOTION</div>
			      		<div class="main-txt">똑같은 일상도 크리에이티브하게!</div>
			      		<div class="sub-txt2">
			      			크리쳐호텔 입점 기념 15% 할인 프로모션
			      		</div>
			      	</div>
			     	 <a href="#"><img src="${conPath}/img/bannerimg2.jpeg" alt="메인2"></a>
			     </div>
		     </div>
		      <div class="swiper-slide bg-color">
		      	<div style="width:1250px;margin:0 auto;">
			      	<div class="text-right">
			      		<div class="sub-txt1">#PROMOTION</div>
			      		<div class="main-txt">밸퍼슨 시즌오프 70% 할인!</div>
			      		<div class="sub-txt2">
			      			남들과는 다른 체형을 가진 친구들을 위한 특별한 옷!<br><br>
			      			*세일 제품 교환 및 반품 불가
			      		</div>
			      	</div>
			      	<a><img src="${conPath}/img/bannerImg3.jpeg" alt="메인3"></a>
			     </div>
		      </div>
		    </div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
		    <div class="swiper-scrollbar"></div>
		  </div>
		 </div><!-- main-slide -->
		 <div class="new-product">
		 	<div class="newP-wrap">
		 	<div class="p-title"><h2>가장 핫한 바우와우 베스트 상품</h2></div>
		 		<!-- Swiper -->
				<div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff; float:left; width:400px; margin-right:50px;" class="swiper mySwiper2">
					<div class="swiper-wrapper">
					  
					  <c:forEach items="${hotList}" var="product">
					      <div class="swiper-slide newp" style="width:450px;">
					        <a href="${conPath}/product/content.do?productCode=${product.productCode}">
					        	<img src="${conPath}/productImage/${product.image}"/>
					        </a>
					        <p style="font-size:14px;">
					        	${product.productName}
					        	<br>
					        	<c:if test="${product.productDiscount ne 0}">
					        		<span style="color:#BE8D6E">
										<del><small><fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원</small></del>
										<br>
										<fmt:formatNumber value="${product.productPrice-(product.productPrice*(product.productDiscount/100))}" pattern="#,###"/>원
					        		</span>
								</c:if>
								<c:if test="${product.productDiscount eq 0}">
									<span style="color:#BE8D6E">
										<fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원
					        		</span>
								</c:if>
					        </p>
					      </div>
					  </c:forEach>
				      
				      <%-- <div class="swiper-slide newp" style="width:450px;">
				        <a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/new2.jpeg"/></a>
				        <p style="font-size:14px;"> 멍랩 산책 와펜 - 친구 환영<br><span style="color:#BE8D6E">9,900원</span></p>
				      </div>
				      <div class="swiper-slide newp" style="width:450px;">
				         <a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/new3.jpeg"/></a>
				          <p style="font-size:14px;">그루밍잼 퓨어 테라피 이어 클리너 125ml<br><span style="color:#BE8D6E">21,000원</span></p>
				      </div>
				      <div class="swiper-slide newp" style="width:450px;">
				      	 <a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/new4.png"/></a>
				      	  <p style="font-size:14px;">SSFW 러브 워크 스트라이프 하네스 (블루)<br><span style="color:#BE8D6E">45,000원</span></p>
				      </div>
				      <div class="swiper-slide newp" style="width:450px;">
				      	 <a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/n1.jpeg"/></a>
				      	  <p style="font-size:14px;">바잇미 비비드 접이식 실리콘 보울 (5컬러)<br><span style="color:#BE8D6E">3,500원</span></p>
				      </div>
				      <div class="swiper-slide newp" style="width:450px;">
				      	 <a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/n2.jpeg"/></a>
				      	  <p style="font-size:14px;">SSFW 러브 워크 스트라이프 하네스 (블루)<br><span style="color:#BE8D6E">45,000원</span></p>
				      </div>
				     <div class="swiper-slide newp" style="width:450px;">
				      	 <a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/n4.png"/></a>
				      	  <p style="font-size:14px;">SSFW 러브 워크 스트라이프 하네스 (블루)<br><span style="color:#BE8D6E">45,000원</span></p>
				      </div>
				      <div class="swiper-slide newp" style="width:450px;">
				      	 <a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/n5.jpeg"/></a>
				      	  <p style="font-size:14px;">SSFW 러브 워크 스트라이프 하네스 (블루)<br><span style="color:#BE8D6E">45,000원</span></p>
				      </div> --%>
				      
				    </div>
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				  </div>
				  <div class="newp-sub">
					  <div thumbsSlider="" class="swiper mySwiper3">
					    <div class="swiper-wrapper">
					    
					      <c:forEach items="${hotList}" var="product">
						      <div class="swiper-slide newp" style="width:200px;">
						       	<img src="${conPath}/productImage/${product.image}"/>
						      </div>
					      </c:forEach>
					      
					     <%--  <div class="swiper-slide newp" style="width:200px;">
					        <img src="${conPath}/img/new2.jpeg"/>
					      </div>
					      <div class="swiper-slide newp" style="width:200px;">
					         <img src="${conPath}/img/new3.jpeg"/>
					      </div>
					      <div class="swiper-slide newp" style="width:200px;">
					         <img src="${conPath}/img/new4.png"/>
					      </div>
					      <div class="swiper-slide newp" style="width:200px;">
					         <img src="${conPath}/img/n1.jpeg"/>
					      </div>
					      <div class="swiper-slide newp" style="width:200px;">
					          <img src="${conPath}/img/n2.jpeg"/>
					      </div>
					      <div class="swiper-slide newp" style="width:200px;">
					        <img src="${conPath}/img/n4.png"/>
					      </div>
					      <div class="swiper-slide newp" style="width:200px;">
					         <img src="${conPath}/img/n5.jpeg"/>
					      </div> --%>
					      
					   </div>
					</div>
				</div>
			</div>
		 </div>
		 <div class="best-product">
		 <div class="bp-wrap">
		 <div class="bp-title"><h2>바우와우 신상 만나보세요</h2></div>
		 	 <!-- Swiper -->
			  <div class="swiper mySwiper4">
			    <div class="swiper-wrapper">
			      
			      <c:forEach items="${newList}" var="product" varStatus="i">
			      	
			      	<c:if test="${i.index eq 0}">
					    <div class="swiper-slide">
						    <div style="width:1100px;margin:0 auto;">
						    	<a href="${conPath}/product/content.do?productCode=${product.productCode}"><img src="${conPath}/productImage/${product.image}"></a>
						    </div>
					    </div>
			      	</c:if>
				    <c:if test="${i.index ne 0}">
					    <div class="swiper-slide">
					    	<a href="${conPath}/product/content.do?productCode=${product.productCode}"><img src="${conPath}/productImage/${product.image}"></a>
					    </div>
				    </c:if>
			      	
			      </c:forEach>
			      
			      <%-- <div class="swiper-slide">
			      	<a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/best3.jpeg"></a>
			      </div>
			      <div class="swiper-slide">
			      	<a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/best4.jpeg"></a>
			      </div>
			      <div class="swiper-slide">
			      	<a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/new5.jpeg"></a>
			      </div>
			      <div class="swiper-slide">
			      	<a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/new6.jpeg"></a>
			      </div>
			      <div class="swiper-slide">
			      	<a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/new7.jpeg"></a>
			      </div>
			      <div class="swiper-slide">
			      	<a href="${conPath}/product/content.do?productCode=P0001"><img src="${conPath}/img/new8.jpeg"></a>
			      </div> --%>
			      
			    </div>
			  </div>
		 	</div>
		 </div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<!-- Initialize Swiper -->
 	<script>
	    var swiper = new Swiper(".mySwiper", {
	      spaceBetween: 30,
	      effect: "fade",
	      loop : true,
	      loopAdditionalSlides : 1,
	      centeredSlides: true,
	      autoplay: {
	        delay: 4500,
	        disableOnInteraction: false,
	      },
	      pagination: {
	        el: ".swiper-pagination",
	        clickable: true,
	        type : 'bullets',
	      },
	      scrollbar: {
	          el: ".swiper-scrollbar",
	          hide: true,
	      },
          navigation: {
	          nextEl: ".swiper-button-next",
	          prevEl: ".swiper-button-prev",
	      },
	    });
	    var swiper3 = new Swiper(".mySwiper3", {
	        loop: true,
	        spaceBetween: 10,
	        slidesPerView: 6,
	        freeMode: true,
	        watchSlidesProgress: true,
	      });
	      var swiper2 = new Swiper(".mySwiper2", {
	        loop: true,
	        spaceBetween: 10,
	        navigation: {
	          nextEl: ".swiper-button-next",
	          prevEl: ".swiper-button-prev",
	        },
	        thumbs: {
	          swiper: swiper3,
	        },
	      });
	      var swiper4 = new Swiper(".mySwiper4", {
	          slidesPerView: 4,
	          spaceBetween: 30,
	          freeMode: true,
		      loop : true,
		      autoplay: {
			        delay: 3500,
			        disableOnInteraction: false,
			   },

	        });
  </script>
</body>
</html>