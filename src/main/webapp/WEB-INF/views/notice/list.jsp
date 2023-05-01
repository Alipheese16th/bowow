<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<style>

.pagination > li > a:focus,
.pagination > li > a:hover,
.pagination > li > span:focus,
.pagination > li > span:hover{
    color: white;
    background-color: #BE8D6E;
    border-color: #BE8D6E;
}
.pagination > li > a{
    background-color: white;
    color: #BE8D6E;
}
.pagination > .disabled > a{
    color: #BE8D6E;
    background-color: white;
}
.pagination > .active > a{
    color: white;
    background-color: #BE8D6E;
    border-color: #BE8D6E;
}
.pagination > .active > a:hover{
    background-color: #9E6D4E;
}
.mybtn{
	background: #white;
	color: #BE8D6E;
	border-color:#BE8D6E;
}
.mybtn:hover{
	background: #BE8D6E;
	color: white;
}
.table, form-select{
	color: #BE8D6E;
	border-color:#BE8D6E;
}
.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
    color: #BE8D6E;
	border-color:#BE8D6E;
}
.table-striped > tbody > tr:nth-child(2n+1):hover, .table-striped > tbody > tr:nth-child(2n+1):hover {
   background-color: #BE8D6E;
}
.table-striped > tbody > tr:nth-child(2n):hover, .table-striped > tbody > tr:nth-child(2n):hover {
   background-color: #BE8D6E;
}
.table-striped > tbody > tr:nth-child(2n):hover > td, .table-striped > tbody > tr:nth-child(2n):hover > th {
    color:white;
}
.table-striped > tbody > tr:nth-child(2n+1):hover > td, .table-striped > tbody > tr:nth-child(2n+1):hover > th {
    color:white;
}

</style>
</head>
<body>
	<table class="table table-striped mx-2">
		<thead>
			<tr class="text-center">
				<th><i class="bi bi-justify"></i> 번호</th>
				<th class="text-start"><i class="bi bi-chat-dots-fill"></i> 제목</th>
				<th><i class="bi bi-person-fill"></i> 작성자</th>
				<th><i class="bi bi-calendar3"></i> 날짜</th>
				<th><i class="bi bi-fire"></i> 조회수</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">
			<c:if test="${noticeList.size() eq 0}">
				<tr><td colspan="5">해당 페이지의 글이 없습니다</td></tr>
			</c:if>
			<c:if test="${noticeList.size() ne 0}">
				<c:forEach var="notice" items="${noticeList}">
				
				<tr>
					<td class="text-center">${notice.noticeNum}</td>
					<td class="w-50">
						${notice.noticeTitle}
					</td>
					<td class="text-center">${notice.adminId}</td>
					<td class="text-center">
						<fmt:formatDate value="${notice.noticeDate}" pattern="yy/MM/dd"/>
					</td>
					<td class="text-center">${notice.noticeHit}</td>
					
				</tr>
				
				</c:forEach>
			
			</c:if>
			
		</tbody>
	</table>
		<c:if test="${not empty admin}">
		   <button class="write btn mybtn">글쓰기</button>
		</c:if>
	   
	   <!-- 자유게시판 페이징 -->
	   <nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center pb-2">
	  	<c:if test="${paging.startPage <= paging.blockSize}">
		    <li class="page-item disabled">
			    <a class="page-link">
			    <span aria-hidden="true">&laquo;</span>
			    </a>
		    </li>
	  	 	</c:if>
	  	 	<c:if test="${paging.startPage > paging.blockSize}">
		    <li class="page-item">
			    <a class="page-link" href="${conPath}/notice/list.do?pageNum=${startPage-1}&search=${param.search}&type=${param.type}">
			    <span aria-hidden="true">&laquo;</span>
			    </a>
		    </li>
	   	</c:if>
	  	 	
	  	 	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
	  	 		<c:if test="${i eq paging.currentPage}">
				<li class="page-item active"><a class="page-link">${i}</a></li>
			</c:if>
	  	 		<c:if test="${i ne paging.currentPage}">
				<li class="page-item"><a class="page-link" href="${conPath}/notice/list.do?pageNum=${i}&search=${param.search}&type=${param.type}">${i}</a></li>
			</c:if>
	  	 	
	  	 	</c:forEach>
	  	 	
	  	 	<c:if test="${paging.endPage < paging.pageCnt}">
			<li class="page-item">
				<a class="page-link" href="${conPath}/notice/list.do?pageNum=${endPage+1}&search=${param.search}&type=${param.type}">
				<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</c:if>
	  	 	<c:if test="${paging.endPage >= paging.pageCnt}">
			<li class="page-item disabled">
				<a class="page-link">
				<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</c:if>
	    
	  </ul>
	</nav>
	<!-- 자유게시판 페이징 끝 -->
	
	<!-- 검색 기능 시작 -->
	<div class="container my-3 text-center">
		<form action="${conPath}/notice/list.do" class="d-flex forma" role="search">
		<input type="hidden" name="pageNum" value="${pageNum}">
			<div class="d-flex w-75 m-auto justify-content-center">
			
				<select name="type" class="form-select" style="width:100px">
				  <option <c:if test="${param.type eq 'full'}">selected="selected"</c:if> value="full">전체</option>
				  <option <c:if test="${param.type eq 'title'}">selected="selected"</c:if> value="title">제목</option>
				  <option <c:if test="${param.type eq 'content'}">selected="selected"</c:if> value="content">내용</option>
				  <option <c:if test="${param.type eq 'writer'}">selected="selected"</c:if> value="writer">작성자</option>
				</select>
				
				<input class="form-control mx-2 w-25" type="search" name="search" id="qa" value="${param.search}">
				
				<button type="button" id="searchbtn" class="btn mybtn"><i class="bi bi-search"></i></button>
				
			</div>
		</form>
	</div>
	<!-- 검색 기능 끝 -->
	
<script>
$(document).ready(function(){
		
	$('.write').click(function(){
		var user = "<c:out value='${admin}'/>";
		if(!user){
			alert('글쓰기는 관리자로 로그인한  경우만 가능합니다');
			location.href="${conPath}/admin/login.do";
		}else{
			location.href ="${conPath}/notice/write.do";
		}
	});
	
	$('tr').css('cursor','pointer').click(function(){
		var noticeNum = $(this).children().eq(0).text();
		if(!isNaN(noticeNum)){
			location.href = "${conPath}/notice/content.do?noticeNum="+noticeNum+"&pageNum=${paging.currentPage}&search=${param.search}&type=${param.type}";
		}
	});
	
	$('.forma').submit(function(){
		var qa = $('#qa').val();
		if(qa.trim() == ''){
			alert('빈칸은 검색할 수 없습니다');
			return false;
		}
	});
	
	$('#searchbtn').click(function(){
		$('.forma').submit();
	});
	
});
</script>
</body>
</html>