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
	<link href="${conPath}/css/mypage_left.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
 			var myleft = $(".mypage-content .mypage-content-left ul li a");
			$(myleft).click(function(){
				  $(myleft).removeClass("active");
				  $(this).addClass("active");
			}); 
		});
	</script>
</head>
<body>
	<div class="mypage-content-left">
		<!-- <div class="content-left-title">마이 바우와우</div> -->
		<ul>
			<li><a href="${conPath}/mypage/orderList.do" class="myleft">주문내역
					<span>
						<svg id="Layer_1" style="enable-background:new 0 0 64 64;" version="1.1" viewBox="0 0 64 64" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
						<g>
							<g id="Icon-Chevron-Left" transform="translate(237.000000, 335.000000)">
								<polyline class="st0" id="Fill-35" points="-210.9,-289 -212.9,-291 -201.1,-302.7 -212.9,-314.4 -210.9,-316.4 -197.1,-302.7-210.9,-289"/>
							</g>
						</g>
						</svg>
					</span>
				</a>
			</li>
			<li><a href="#" class="myleft">리뷰내역					
					<span>
						<svg id="Layer_1" style="enable-background:new 0 0 64 64;" version="1.1" viewBox="0 0 64 64" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
						<g>
							<g id="Icon-Chevron-Left" transform="translate(237.000000, 335.000000)">
								<polyline class="st0" id="Fill-35" points="-210.9,-289 -212.9,-291 -201.1,-302.7 -212.9,-314.4 -210.9,-316.4 -197.1,-302.7-210.9,-289"/>
							</g>
						</g>
						</svg>
					</span>
				</a>
			</li>
			<li><a href="#" class="myleft">상품문의					
					<span>
						<svg id="Layer_1" style="enable-background:new 0 0 64 64;" version="1.1" viewBox="0 0 64 64" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
						<g>
							<g id="Icon-Chevron-Left" transform="translate(237.000000, 335.000000)">
								<polyline class="st0" id="Fill-35" points="-210.9,-289 -212.9,-291 -201.1,-302.7 -212.9,-314.4 -210.9,-316.4 -197.1,-302.7-210.9,-289"/>
							</g>
						</g>
						</svg>
					</span>
				</a>
			</li>
			<li><a href="#" class="myleft">쿠폰					
					<span>
						<svg id="Layer_1" style="enable-background:new 0 0 64 64;" version="1.1" viewBox="0 0 64 64" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
						<g>
							<g id="Icon-Chevron-Left" transform="translate(237.000000, 335.000000)">
								<polyline class="st0" id="Fill-35" points="-210.9,-289 -212.9,-291 -201.1,-302.7 -212.9,-314.4 -210.9,-316.4 -197.1,-302.7-210.9,-289"/>
							</g>
						</g>
						</svg>
					</span>
				</a>
			</li>
			<li><a href="#" class="myleft">적립금					
					<span>
						<svg id="Layer_1" style="enable-background:new 0 0 64 64;" version="1.1" viewBox="0 0 64 64" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
						<g>
							<g id="Icon-Chevron-Left" transform="translate(237.000000, 335.000000)">
								<polyline class="st0" id="Fill-35" points="-210.9,-289 -212.9,-291 -201.1,-302.7 -212.9,-314.4 -210.9,-316.4 -197.1,-302.7-210.9,-289"/>
							</g>
						</g>
						</svg>
					</span>
				</a>
			</li>
			<li><a href="${conPath}/mypage/modify.do" class="myleft">개인정보수정					
					<span>
						<svg id="Layer_1" style="enable-background:new 0 0 64 64;" version="1.1" viewBox="0 0 64 64" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
						<g>
							<g id="Icon-Chevron-Left" transform="translate(237.000000, 335.000000)">
								<polyline class="st0" id="Fill-35" points="-210.9,-289 -212.9,-291 -201.1,-302.7 -212.9,-314.4 -210.9,-316.4 -197.1,-302.7-210.9,-289"/>
							</g>
						</g>
						</svg>
					</span>
				</a>
			</li>
		</ul>
	</div><!-- mypage-content-left -->
</body>
</html>