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
		.inquiry h2 {text-align: center; margin: 30px 0;}
		.inquiry .write {margin: 20px 0;}
		.inquiry .btn {
			background-color: #BE8D6E; border: 1px solid #BE8D6E; 
			color: #fff; font-size: 1.2em;
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<div class="inquiry">
		<div class="container">
		    	<h2>1:1문의</h2>
		    	<c:if test="${totCntInquiry eq 0 }">
		    		<tr><td colspan="5">문의한 글이 없습니다</td></tr>
		    	</c:if>
		    	<c:if test="${totCntInquiry != 0 }">
			        <table class="table table-striped table-hover">
			            <thead>
			                <tr>
			                    <th>No</th>
			                    <th>작성자</th>
			                    <th>제목</th>
			                    <th>내용</th>
			                    <th>이메일</th>
			                </tr>
			            </thead>
			            <tbody>
			                <c:forEach var="inquiry" items="${inquiryList }" varStatus="status">
				            	<c:if test="${member.memberId eq inquiry.memberId}">
				                    <tr>
				                        <td><c:out value="${inquiry.inquiryNum }"/></td>
				                        <td><c:out value="${inquiry.memberId }"/></td>
				                        <td><c:out value="${inquiry.inquiryTitle }"/></td>
				                        <td><c:out value="${inquiry.inquiryContent }"/></td>
				                        <td><c:out value="${inquiry.inquiryEmail }"/></td>
				                    </tr>
				            	</c:if>
			                </c:forEach>
			            </tbody>
			        </table>
		    	</c:if>
		        
		        <div class="write">            
		            <a href="location.href='${conPath }/inquiry/write.do'" onClick='fn_write()' class="btn btn-success">글쓰기</a>            
		        </div>
		</div>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>