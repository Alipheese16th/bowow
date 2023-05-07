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
	<link href="${conPath}/css/join2.css" rel="stylesheet">
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${conPath}/js/address.js"></script>
</head>
<body>
	<c:if test="${empty member}">
		<script>
			alert("로그인 후 이용해주세요.");
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
					<h2>개인 정보 수정</h2>
				</div>
			</div>
			<div class="mypage-content-line"></div>
			<div id="content-form">
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
										<input type="text" name="memberId" id="id" class="focusB" placeholder="아이디를 입력해주세요." value="${member.memberId }" readonly="readonly">
										<div class="midResult bottom"></div>
									</div>
									<div class="join-form-btn"></div>
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
										<input type="text" name="memberName" id="name" class="focusB" placeholder="이름을 입력해주세요." value="${member.memberName }">
										<div class="mnameResult bottom"></div>
									</div>
									<div class="join-form-btn"></div>
								</div>
								<div class="join-form-wrap">
									<div class="join-form-title"><label for="email">이메일<span class="point">*</span></label></div>
									<div class="join-form-text">
										<input type="text" name="memberEmail" id="email" class="focusB" placeholder="예 : bowow@bowow.com" value="${member.memberEmail}">
										<div class="memailResult bottom"></div>
									</div>
									<div class="join-form-btn">
										<button type="button" class="emailConfirm">중복확인</button>
									</div>
								</div>
								<div class="join-form-wrap">
									<div class="join-form-title"><label for="tel">전화번호</label></div>
									<div class="join-form-text">
										<input type="text" name="memberTel" id="tel" class="focusB" placeholder="예 : 02-000-0000 또는 010-0000-0000" value="${member.memberTel }">
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
										<button type="button" class="btnStyle2">회원탈퇴</button>
										<button type="submit" class="btnStyle">정보수정</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- mypage-content-right -->
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>