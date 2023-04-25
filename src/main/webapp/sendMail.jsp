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
	<style>
	
		body{
			font-family: 'Pretendard-Regular', 'sans-serif';
		}
	</style>
</head>
<body style="margin:0;padding:0;">
	<div style="background:#f2f2f2; padding:25px;">
		<div style="width:600px; margin: 0 auto; background:#fff; padding:40px; ">
			<img src="http://localhost:8098/bowow/img/bowow_logo.png" style="width:200px; height:auto;margin:0; padding:0;">
			<br><br>
			<h1>회원가입에 감사드립니다.</h1>
			<p style="line-height:25px;">회원가입 감사 <b>10% 쿠폰</b>을 발급해 드렸으니,<br>
			마이페이지를 통해서 확인하시길 바랍니다.</p>
			<a href="마이페이지링크" style="color:#BE8D6E;text-decoration:none;">쿠폰 확인하기 ></a>
			<hr color="#000" style="margin-bottom:30px; margin-top:30px;">
			<div>
				<table style="width:100%;">
					<tr>
						<td>아이디</td>
						<td></td>
					</tr>
					<tr>
						<td>가입일</td>
						<td></td>
					</tr>
					<tr style="height: 10px;"><td></td></tr>
					<tr style="width: 100%;height: 1px;background: #f2f2f2;"><td colspan="3"></td></tr>
					<tr style="height: 10px;"><td></td></tr>
					<tr>
						<td>회원혜택</td>
					</tr>
					<tr>
						<td>- 회원등급별 다양한 이벤트 및 쿠폰 제공</td>
					</tr>
					<tr>
						<td>- 쇼핑 구매액의 5% 포인트 적립</td>
					</tr>
					<tr style="height: 10px;"><td></td></tr>
					<tr style="width: 100%;height: 1px;background: #f2f2f2;"><td colspan="3"></td></tr>
					<tr style="text-align: center;">
						<td colspan="5">
							<button onclick="location.href='홈페이지 메인주소링크'" style="background: #BE8D6E;color: #fff;outline: none;border: none;height: 50px;border-radius: 5px;padding:0px 15px 0 15px;margin-top: 30px;font-family: 'Pretendard-Regular'; font-size:15px;">회원 혜택 더 알아보기</button>
						</td>
					</tr>	
				</table>
			</div>
		</div>
	</div>
</body>
</html>