<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="${conPath}/js/summernote.js"></script>
<style>
div.note-popover{
display:none;
}
.container{
	min-width: 1000px;
	margin-left:280px;
	font-family: 'Pretendard';
}

</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<jsp:include page="side.jsp"/>
			
	<h1 class="my-5 text-center">공지 등록</h1>
	
	<div class="container">
	
		<form action="${conPath}/notice/noticeWrite.do" method="post">
			<input type="hidden" name="adminId" value="${admin.adminId}">
		    
		    <div class="card mb-3 bg-light">
			  <div class="row align-items-center mx-2">
			    <div class="col-1 text-center fw-bold px-0 pb-1">
			      	제목
			    </div>
			    <div class="col-11 px-0">
			      <div class="card-body">
			        <input type="text" name="noticeTitle" class="form-control form-control-sm" required="required">
			      </div>
			    </div>
			  </div>
			</div>
		    
			<div class="card bg-light mb-3">
				<div class="card-body">
					<textarea id="summernote" name="noticeContent" class="mb-0" required="required"></textarea>
				</div>
			</div>
			
			<div class="d-flex justify-content-center">
				<input type="submit" value="글쓰기" class="btn btn-dark mx-1">
			  	<input type="reset" value="취소" class="btn btn-dark mx-1" onclick="history.back()">
			</div>
	    </form>
	    
	</div>
	<jsp:include page="../main/footer.jsp"/>

</body>
</html>