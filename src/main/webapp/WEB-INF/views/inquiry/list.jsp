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
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<div class="inquiry">
		<div class="container">
		    <form id="boardForm" name="boardForm" method="post">
		    	<h2>1:1문의</h2>
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
		                <c:forEach var="result" items="${list }" varStatus="status">
		                    <tr>
		                        <td><c:out value="${result.code }"/></td>
		                        <td><a href='#' onClick='fn_view(${result.code})'><c:out value="${result.title }"/></a></td>
		                        <td><c:out value="${result.writer }"/></td>
		                        <td><c:out value="${result.reg_datetime }"/></td>
		                        <td></td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
		        
		        <div>            
		            <a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>            
		        </div>
		    </form>
		</div>
	</div>
	
	<script>
	//글쓰기
	function fn_write(){
	    
	    var form = document.getElementById("boardForm");
	    
	    form.action = "<c:url value='/board/writeForm.do'/>";
	    form.submit();
	    
	}
	 
	//글조회
	function fn_view(code){
	    
	    var form = document.getElementById("boardForm");
	    var url = "<c:url value='/board/viewContent.do'/>";
	    url = url + "?code=" + code;
	    
	    form.action = url;    
	    form.submit(); 
	}
	</script>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>