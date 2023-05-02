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
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<style>
		.inquiry .container {text-align: center; width: 750px;}
		.inquiry h2 {text-align: center; margin: 30px 0;}
		.inquiry tr {border-bottom: #BE8D6E;}
		.inquiry td {padding-left: 80px;}
		.inquiry input, .inquiry textarea {width: 500px;}
		.inquiry .write {margin: 20px 0;}
		.inquiry .btn {
			background-color: #BE8D6E; border: 1px solid #BE8D6E; 
			color: #fff; font-size: 1.2em; margin: 10px 0 30px;
		}
	</style>
</head>
<body>
	<%-- <c:if test="${empty member or empty admin }">
		<script>
			alert('로그인 후 작성이 가능합니다');
			history.back();
		</script>
	</c:if> --%>

	<jsp:include page="../main/header.jsp"/>
	
	<div class="inquiry">
		<div class="container">
	    	<h2>1:1문의 수정</h2>
	    	<form action="${conPath }/inquiry/modify.do" method="post">
	    		<input type="hidden" name="inquiryNum" value="${inquiry.inquiryNum }">
		        <table class="table table-striped table-hover">
		            <thead>
		                <tr>
		                    <th>제목</th>
		                    <td><input type="text" name="inquiryTitle" value="${inquiry.inquiryTitle }" required="required"></td>
		                </tr>
		                <tr>
		                    <th style="padding-bottom: 185px;">내용</th>
		                    <td><textarea name="inquiryContent" rows="8" required="required" style="max-height: 500px;">${inquiry.inquiryContent }</textarea></td>
		                </tr>
		                <tr>
		                    <th>수신 이메일</th>
		                    <td><input type="text" name="inquiryEmail" value="${inquiry.inquiryEmail }" readonly="readonly"></td>
		                </tr>
		            </thead>
		            <%-- <tbody>
	                    <tr>
	                        <td><a href='${conPath }/inquiry/content.do' onClick='fn_view(${inquiry.inquiryNum})'><c:out value="${inquiry.inquiryTitle }"/></a></td>
	                        <td><c:out value="${inquiry.inquiryContent }"/></td>
	                        <td><c:out value="${inquiry.inquiryEmail }"/></td>
	                    </tr>
		            </tbody> --%>
		        </table>
		        <input type="submit" value="수정하기" class="btn" style="width: 200px;">
		        <input type="reset" value="취소하기" class="btn" style="width: 200px;">
				<input type="button" value="목록가기" class="btn" style="width: 200px;" onclick="location.href='${conPath}/inquiry/list.do'">
	    	</form>
		</div>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>