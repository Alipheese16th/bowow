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
<link rel="stylesheet" href="${conPath}/css/notice_list.css">
</head>
<body>
	<c:if test="${not empty noticeWriteResult}">
		<script>
			alert('${noticeWriteResult}');
		</script>
	</c:if>
	
	
	<table class="table">
		<thead class="thth">
			<tr class="text-center">
				<th>번호</th>
				<th class="text-start">제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
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
						<fmt:formatDate value="${notice.noticeDate}" pattern="yy/MM/dd HH:mm"/>
					</td>
					<td class="text-center">${notice.noticeHit}</td>
					
				</tr>
				
				</c:forEach>
			
			</c:if>
			
		</tbody>
	</table>
		
		<c:if test="${not empty admin}">
		   <button class="write btn mybtn mt-2">글쓰기</button>
		</c:if>
		
	   <!-- 페이징 -->
	   <nav aria-label="Page navigation example" class="my-4">
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
			    <a class="page-link" href="${conPath}/notice/list.do?pageNum=${paging.startPage-1}&search=${param.search}&type=${param.type}">
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
				<a class="page-link" href="${conPath}/notice/list.do?pageNum=${paging.endPage+1}&search=${param.search}&type=${param.type}">
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
	<!-- 페이징 끝 -->
	
	<!-- 검색 기능 시작 -->
	<div class="text-center d-flex justify-content-center mb-3">
		<form action="${conPath}/notice/list.do" class="d-flex forma" role="search">
		<input type="hidden" name="pageNum" value="${pageNum}">
			<div class="d-flex justify-content-center">
			
				<select name="type" class="form-select" style="width:100px">
				  <option <c:if test="${param.type eq 'full'}">selected="selected"</c:if> value="full">전체</option>
				  <option <c:if test="${param.type eq 'title'}">selected="selected"</c:if> value="title">제목</option>
				  <option <c:if test="${param.type eq 'content'}">selected="selected"</c:if> value="content">내용</option>
				  <option <c:if test="${param.type eq 'writer'}">selected="selected"</c:if> value="writer">작성자</option>
				</select>
				
				<input class="form-control mx-2 w-50" type="search" name="search" id="qa" value="${param.search}">
				
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