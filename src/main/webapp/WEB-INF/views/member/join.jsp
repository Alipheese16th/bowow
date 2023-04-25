<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link href="${conPath}/css/join.css" rel="stylesheet">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="${conPath}/js/address.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(document).ready(function(){
			$(".idconfirm").click(function(){
				var memberId = $("#id").val();
				$.ajax({
					url : '${conPath}/member.do',
					dataType : 'html',
					data: "method=memberIdConfirm&memberId="+memberId,
					success : function(data, status){
						$(".midResult").html(data);
					},
				});
			});
		});
	</script>
	<script>
	  $(function(){
	    $("#datepicker").datepicker({
	    	dateFormat: "yy-mm-dd",
	    	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    	dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
	    	changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
	    	changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
	    	showMonthAfterYear: true,
	    	yearSuffix: '년',
	    	showOtherMonths: true, // 현재 달이 아닌 달의 날짜도 회색으로 표시
	    	//minDate: '-100y',	 // 현재날짜로부터 100년이전까지 년을 표시한다.
	    	minDate: new Date(1950, 1 - 1, 1), // 1950년 1월1일을 최소 날짜로 세팅
	    	maxDate : 'y', // 현재 날짜 이전만 선택 가능
	    	yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 
	    });
	  } );
	</script>
		<script src="${conPath}/js/address.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content-form">
		<div class="join-title">회원가입</div>
		<div class="join-wrap">
			<div class="join-form-line">
				<span class="point">*</span>필수입력사항
			</div>
			<div class="join-form">
				<form action="join.do" method="post">
					<div class="join-row">
						<div class="join-form-wrap">
							<div class="join-form-title"><label for="id">아이디<span class="point">*</span></label></div>
							<div class="join-form-text">
								<input type="text" name="memberId" id="id" class="focusB" placeholder="아이디를 입력해주세요.">
								<div class="midResult bottom"></div>
							</div>
							<div class="join-form-btn">
								<button type="button" class="idconfirm">중복확인</button>
							</div>
						</div>
						<div class="join-form-wrap">
							<div class="join-form-title"><label for="pw">비밀번호<span class="point">*</span></label></div>
							<div class="join-form-text">
								<input type="password" name="memberPw" id="pw" class="focusB" placeholder="비밀번호를 입력해주세요.">
								<div class="mpwResult bottom"></div>
							</div>
							<div class="join-form-btn"></div>
						</div>
						<div class="join-form-wrap">
							<div class="join-form-title"><label for="pwChk">비밀번호확인<span class="point">*</span></label></div>
							<div class="join-form-text">
								<input type="password" name="memberPwchk" id="pwChk" class="focusB" placeholder="비밀번호를 다시 한번 입력해주세요.">
								<div class="mpwChkResult bottom"></div>
							</div>
							<div class="join-form-btn"></div>
						</div>
						<div class="join-form-wrap">
							<div class="join-form-title"><label for="name">이름<span class="point">*</span></label></div>
							<div class="join-form-text">
								<input type="text" name="memberName" id="name" class="focusB" placeholder="이름을 입력해주세요.">
								<div class="mnameResult bottom"></div>
							</div>
							<div class="join-form-btn"></div>
						</div>
						<div class="join-form-wrap">
							<div class="join-form-title"><label for="email">이메일<span class="point">*</span></label></div>
							<div class="join-form-text">
								<input type="text" name="memberEmail" id="email" class="focusB" placeholder="예 : bowow@bowow.com">
								<div class="memailResult bottom"></div>
							</div>
							<div class="join-form-btn"></div>
						</div>
						<div class="join-form-wrap">
							<div class="join-form-title"><label for="tel">전화번호</label></div>
							<div class="join-form-text">
								<input type="text" name="memberTel" id="tel" class="focusB" placeholder="예 : 02-000-0000 또는 010-0000-0000">
							</div>
							<div class="join-form-btn"></div>
						</div>
						<div class="join-form-wrap">
							<div class="join-form-title"><label for="address">우편번호</label></div>
							<div class="join-form-text">
								<input type="text" name="memberPost" id="sample6_postcode" placeholder="우편번호">
							</div>
							<div class="join-form-btn">
								<button type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button><br>
							</div>
						</div>
						<div class="join-form-wrap">
							<div class="join-form-title">주소</div>
							<div class="join-form-text" style="margin-bottom: 45px;">
									<input type="text" name="memberAddr1" id="sample6_address" placeholder="주소" style="margin-bottom: 5px;"><br>
									<input type="text" name="memberAddr2" id="sample6_detailAddress" placeholder="상세주소">
							</div>
							<div class="join-form-btn"></div>
						</div>
						<div class="join-form-wrap">
							<div class="join-form-title">생년월일</div>
							<div class="mbirth-line">
								<div class="join-form-text">
									<input type="date" name="memberBirth" id="datepicker">
								</div>
								<div class="join-form-btn"></div>
							</div>
						</div>
						<div>
							<div style="text-align:center;">
								<button type="submit" class="btnStyle">가입하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>