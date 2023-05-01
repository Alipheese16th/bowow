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
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${conPath}/js/address.js"></script>
	<script>
		let memberIdOk = false;
		$(document).ready(function(){
			const patternId = /^[a-z]{1}[a-z0-9_\-]{2,15}$/; // 아이디 정규표현식
			const patternPw = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~`!@#$%^&*()-_+=|\\\[\]{}'";:?,.\/]).{8,16}$/; // 비밀번호 정규표현식
			const patternName = /^[a-zA-Z가-힣]{1,}$/; // 이름 정규표현식 
			const patternSpc = /[~`!@#$%^&*()-_+=|\\\[\]{}'";:?,.\/]/;
			const patternMail = /^\w+@\w+(\.\w+){1,2}$/; // 이메일 정규표현식
			const patternTel = /^\d{2,3}[\-)]?\d{3,4}[\-]?\d{4}$/; // 전화번호 정규표현식
			const patternSpace = /\s/g; 
			var memberId, memberPw, memberName, memberPwchk, memberEmail, memberTel;
  			$(".idconfirm").click(function(){
  				memberIdOk = true;
 				if(memberId.match(patternId) && memberId.length > 2){
					$.ajax({
						url : '${conPath}/memberIdConfirm.do',
						dataType : 'html',
						data: "memberId="+memberId,
						success : function(data, status){
							$(".midResult").html(data);
						},
					});
				}
			}); // memberId 중복확인
			// memberId를 입력했으면 idconfirm
			$("#id").keyup(function(){
				memberId = $(this).val();
				if(!memberId || memberId.length < 1){
					$(".midResult").html("<p style='color:red;'>필수 정보입니다.</p>");
				}else if(!memberId.match(patternId)){
					$(".midResult").html("<p style='font-size:12Px; color:red;'>2~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</p>");
				}else{
					$(".midResult").html("");
				}
			}); // memberID keyup 이벤트
			$("#pw").keyup(function(){
				memberPw = $(this).val();
				if(!memberPw){
					$(".mpwResult").html("<p style='color:red;'>필수 정보입니다.</p>");
				}else if(!memberPw.match(patternPw) || memberPw.match(patternSpace)){
					$(".mpwResult").html("<p style='color:red;'>8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</p>");
				}else{
					$(".mpwResult").html("");
				};
			}); //memberPw keyup 이벤트
			$("#pwChk").keyup(function(){
				memberPwchk = $(this).val();
				if(!memberPwchk){
					$(".mpwChkResult").html("<p style='color:red;'>필수 정보입니다.</p>");
				}else if(!memberPwchk.match(patternPw) || memberPwchk.match(patternSpace)){
					$(".mpwChkResult").html("<p style='color:red;'>8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</p>");
				}else{
					if(memberPw==memberPwchk){
						$(".mpwChkResult").html("");
					}else{
						$(".mpwChkResult").html("<p style='color:red;'>비밀번호가 일치하지 않습니다.</p>");
					};
				};
			});
			$("#name").keyup(function(){
				memberName = $(this).val();
				if(!memberName){
					$(".mnameResult").html("<p style='color:red;'>필수 정보입니다.</p>");
				}else if(!memberName.match(patternName)|| memberName.match(patternSpace)){
					$(".mnameResult").html("<p style='color:red;'>한글과 영문 대 소문자를 사용하세요.</p>");
				}else{
					$(".mnameResult").html("");
				}
			}); //memberName keyup 이벤트
			$("#email").keyup(function(){
				memberEmail = $(this).val();
				if(!memberEmail){
					$(".memailResult").html("<p style='color:red;'>필수 정보입니다.</p>");
				}else if(!memberEmail.match(patternMail) || memberEmail.match(patternSpace)){
					$(".memailResult").html("<p style='color:red;'>이메일 형식으로 입력해 주세요.</p>");
				}else{
					$(".memailResult").html("");
				}
			}); // memberEmail keyup 이벤트
			$("#tel").keyup(function(){
				memberTel = $(this).val();
				if(!memberTel){
					$(".mtelResult").html("");
				}else if(!memberTel.match(patternTel)){
					$(".mtelResult").html("<p style='color:red;'>형식에 맞지 않는 번호입니다.</p>");
				}else{
					$(".mtelResult").html("");
				}
			}); //mtel-keyup 이벤트
			$("form").submit(function(){
				var midResult = $(".midResult").text().trim();
				var mnameResult = $(".mnameResult").text().trim();
				var mpwResult = $(".mpwResult").text().trim();
				var mpwChkResult = $(".mpwChkResult").text().trim();
				var mtelResult = $(".mtelResult").text().trim();
				var memailResult = $(".memailResult").text().trim();
				if(midResult != "사용가능한 ID입니다"){
					alert("사용가능한 아이디인지 확인 요망");
					$("#id").focus();
					return false;
				}else if(!memberPw || !mpwResult=="" || !mpwChkResult==""){
					alert("비밀번호를 확인하세요.");
					$("#pw").focus();
					return false;
				}else if(!memberPwchk || mpwChkResult=="비밀번호가 일치하지 않습니다."){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}else if(!memberName || !mnameResult==""){
					alert("이름을 확인하세요.")
					$("#name").focus();
					return false;
				}else if(memberTel=="형식에 맞지 않는 번호입니다."){
					alert("전화번호를 확인하세요.");
					$("#tel").focus();
					return false;
				}else if(!memberEmail || !memailResult==""){
					alert("이메일을 확인하세요.");
					$("#email").focus();
					return false;
				}
			}); // submit 제한
		});
	</script>
	<script>
	  $(function(){
	    $("#datepicker").datepicker({
	    	dateFormat: "yy/mm/dd",
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
				<form action="join.do" method="post" autocomplete="off">
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
								<div class="mtelResult bottom"></div>
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
									<input type="text" name="memberBirthTemp" id="datepicker">
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