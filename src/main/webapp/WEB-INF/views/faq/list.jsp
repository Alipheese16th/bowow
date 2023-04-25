<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/styles.css" rel="stylesheet" />	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<style>
		h1 {text-align: center; height: 100px; line-height: 100px;}
		.paging {
			text-align: center;
		}
	</style>	
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<h1>자주 묻는 질문</h1>
	<div class="accordion" id="accordionPanelsStayOpenExample">
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
					교환 배송료나 차액금은 어디서 결제하나요?
				</button>
			</h2>
			<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse">
				<div class="accordion-body">
					<strong>모든 상품의 교환 및 환불처리를 해드리고 있사오나 부득이 다음과 같은 경우는 교환 및 환불이 되지 않습니다.</strong><br><br>
					1. 제품 수령 후 7일이 지난 경우<br><br>
					2. 7일 이전이라도 제품을 사용하신 경우<br>
					(야외에서 사용을 목적으로 착용한 것뿐만이 아니라 실내나 차량 내부 등에서도 단순한 사이즈 확인을 넘어서는 착용을 하시어 육안과 후각으로도 쉽게 제품의 재판매에 문제가 있다고 확인되는 경우는 교환 및 환불이 되지 않습니다.)
					3. 제품의 테그(상표)를 훼손하거나 분실하신 경우<br>
					(테그의 유무가 가장 객관적인 제품의 사용여부 기준이 됩니다. 테그가 분실된 경우는 제품을 사용하고자 하는 목적으로 제거한 것으로 판단, 사용하신 것으로 분류되어 교환 및 환불이 불가능 합니다.)<br><br>
					4. 구매 내역이 확인 되지 않는 경우<br><br>
					5. 제품 원상태의 현저한 포장 훼손으로 제품 판매나 업체 반품 등에 문제가 있는 경우<br>
					(제품의 특성상 포장을 뜯은 것만으로도 제품의 가치가 떨어지거나 판매가 되지 않는 경우는 교환 및 환불이 되지 않습니다. - 내의류, 랜턴류, 칼 등)<br><br>
					6. 제품을 사용하지 않았으나 보관시의 부주의로 인하여 제품에 특정냄새가 배거나 오염이 된 경우
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
					환불이 되지 않았어요
			    </button>
			</h2>
			<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
				<div class="accordion-body">
					반송상품이 도착한 날에 바로 환불 처리를 해드리고 있습니다.<br>
					(즉시 처리가 불가한 특수한 경우는 제외)<br><br>
					하오나 결제 방식에 따라 은행사나 카드사 등의 처리 기간이 소요되기 때문에<br>
					아래와 같이 결제 종류에 따라 처리 기간을 확인하여 주시기 바랍니다.<br><br>
					카드 - 취소한 날로부터 5~7일 후 카드사 완전 취소<br>
					실시시간계좌이체 - 취소한 날로부터 2~3일 후 거래은행에서 송금<br>
					계좌입금 - 취소한 날의 다음 영업일 오전 10시 이후에 이니시스에서 자동송금<br>
					휴대폰소액결제 - 통신사 결제 금액에서 취소(통신비용으로 확인)<br><br>
					<strong>해외 카드의 경우 카드사로 직접 문의 바랍니다.</strong>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
					반품 시, 받은 박스로만 보내야 하나요?
			    </button>
			</h2>
			<div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
				<div class="accordion-body">
					반드시 바우와우 배송 박스에 반송하셔야 하는 것은 아닙니다. ^^<br><br>
					배송 받은 박스의 크기가 너무 큰데, 반송할 물건은 작은 경우<br>
					다른 박스에 포장하셔도 무방하오니 주변에서 구하실 수 있는 박스에 포장하셔서<br>
					안전하게 보내주시기 바랍니다.<br><br>
					<strong>단, 브랜드 박스에 운송장을 부착하거나 테이핑을 하여 반송하시면<br>
					처리가 불가하오니 이 점 유의하여 주시기 바랍니다.</strong>
				</div>
			</div>
		</div>
	</div>
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			<button type="button" class="btn btn-outline-secondary">
				<a href="${conPath }/qna/list.do?pageNum=${paging.startPage-1}"><</a>
			</button>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${paging.currentPage == i }">
				<button type="button" class="btn btn-outline-secondary"><b>${i }</b></button>
			</c:if>
			<c:if test="${paging.currentPage != i }">
				<button type="button" class="btn btn-outline-secondary">
					<a href="${conPath }/qna/list.do?pageNum=${i }">${i }</a>
				</button>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			<button type="button" class="btn btn-outline-secondary">
				<a href="${conPath }/qna/list.do?pageNum=${paging.endPage+1}">></a>
			</button>
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>