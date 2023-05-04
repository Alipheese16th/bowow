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
<style>
.container{
	min-width: 1300px !important;
	font-family: 'Pretendard';
}
.heading{
	text-align:center;
	text-weight:bold;
	width:1250px;
	margin:60px auto;
	padding-top:30px;
	padding-bottom:30px;
	background: #fff;
    border-top: 3px solid #be8D6e;
}

#content{
	min-height:200px;
}
</style>
</head>
<body>
	<c:if test="${ncWriteResult eq 0}">
		<script>
			alert('댓글 작성 오류');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div class="container">
	
		<h1 class="heading"><a href="${conPath}/notice/list.do" class="text-decoration-none text-black"><b>NOTICE</b></a></h1>
		
		<hr>
		    <div class="mx-2">
		    	<h5>${notice.noticeTitle}</h5>
		    </div>
		    <hr>
		    <div class="d-flex justify-content-between mx-2">
		    	<div >
		    		<small>${notice.adminId}</small>
		    	</div>
		    	<div >
			    	<small>댓글  0</small>
			    	<small>조회수 ${notice.noticeHit}</small>
			    	<small>작성일 <fmt:formatDate value="${notice.noticeDate}" pattern="yy/MM/dd HH:mm:ss"/></small>
			    	<c:if test="${not empty notice.noticeUpdate}">
				    	<small>수정일 <fmt:formatDate value="${notice.noticeUpdate}" pattern="yy/MM/dd HH:mm:ss"/></small>
			    	</c:if>
		    	</div>
		    </div>
		    <hr>
	    	<div class="row mx-2">
	    		<pre id="content" class="fs-6">${notice.noticeContent}</pre>
	    	</div>
	    	
	    	<hr>
	    	전체 댓글 <b style="color:red;">${commentPaging.totCnt}</b>개
	    	<hr>
	    	
	    	<!-- 댓글리스트 시작 -->
	    	<div class="commentList">
	    		
		   		<c:if test="${commentList.size() ne 0}">
		   			<c:forEach var="comment" items="${commentList}">
		   			
		   				<div class="card mb-3" id="comment${comment.ncNum}">
						  <div class="card-header d-flex justify-content-between py-0">
						  	<div><small>${comment.memberName}(${comment.memberId})</small></div>
						  	<div>
						  		<small><fmt:formatDate value="${comment.ncDate}" pattern="yy/MM/dd HH:mm:ss"/></small>
						  		<c:if test="${member.memberId eq comment.memberId}">
							  		<button type="button" id="${comment.ncNum}" class="btn btn-sm btn-outline-dark py-0 px-1 ms-2 commentModifyView">수정</button>
							  		<button type="button" class="btn btn-sm btn-outline-dark py-0 px-1" onclick="commentDelete()">삭제</button>
						  		</c:if>
						  		<c:if test="${not empty admin}">
							  		<button type="button" class="btn btn-sm btn-outline-dark py-0 px-1" onclick="commentDelete()">삭제</button>
						  		</c:if>
						  	</div>
						  </div>
						  <div class="card-body">
						    <pre class="card-text">${comment.ncContent}</pre>
						  </div>
						</div>
		   			
		   			</c:forEach>
		   		</c:if>
		   		
		   	</div>
		   	<!-- 댓글리스트 끝 -->
		   	
		   	<!-- 댓글페이징 시작 -->
			   <nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center pb-2">
			  	<c:if test="${commentPaging.startPage <= commentPaging.blockSize}">
				    <li class="page-item disabled">
					    <a class="page-link">
					    <span aria-hidden="true">&laquo;</span>
					    </a>
				    </li>
			  	 	</c:if>
			  	 	<c:if test="${commentPaging.startPage > commentPaging.blockSize}">
				    <li class="page-item">
					    <a class="page-link" href="${conPath}/notice/content.do?commentPageNum=${commentPaging.startPage -1}&noticeNum=${notice.noticeNum}&pageNum=${param.pageNum}&search=${param.search}&type=${param.type}">
					    <span aria-hidden="true">&laquo;</span>
					    </a>
				    </li>
			   	</c:if>
			  	 	
			  	 	<c:forEach var="i" begin="${commentPaging.startPage}" end="${commentPaging.endPage}">
			  	 		<c:if test="${i eq commentPaging.currentPage}">
						<li class="page-item active"><a class="page-link">${i}</a></li>
					</c:if>
			  	 		<c:if test="${i ne commentPaging.currentPage}">
						<li class="page-item"><a class="page-link" href="${conPath}/notice/content.do?commentPageNum=${i}&noticeNum=${notice.noticeNum}&pageNum=${param.pageNum}&search=${param.search}&type=${param.type}">${i}</a></li>
					</c:if>
			  	 	
			  	 	</c:forEach>
			  	 	
			  	 	<c:if test="${commentPaging.endPage < commentPaging.pageCnt}">
					<li class="page-item">
						<a class="page-link" href="${conPath}/notice/content.do?commentPageNum=${commentPaging.endPage}&noticeNum=${notice.noticeNum}&pageNum=${param.pageNum}&search=${param.search}&type=${param.type}">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
			  	 	<c:if test="${commentPaging.endPage >= commentPaging.pageCnt}">
					<li class="page-item disabled">
						<a class="page-link">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
			    
			  </ul>
			</nav>
	    	<!-- 댓글페이징 끝 -->
	    	
	    	<c:if test="${empty member}">
	    		<h4>댓글 작성 권한이 없습니다 <button class="nextlogin btn btn-outline-dark gologin">로그인</button></h4>
	    	</c:if>
	    	
	    	<c:if test="${not empty member}">
	    		<div class="card mt-2">
				  <div class="card-header">
					댓글 작성 &nbsp; ${member.memberName}님
				  </div>
				  <div class="card-body">
				    <form action="${conPath}/notice/ncWrite.do" method="post">
				    	<input type="hidden" name="pageNum" id="pageNum" value="${param.pageNum}">
				    	<input type="hidden" name="search" value="${param.search}">
				    	<input type="hidden" name="type" value="${param.type}">
				    	<input type="hidden" name="noticeNum" value="${notice.noticeNum}">
				    	<input type="hidden" name="memberId" value="${member.memberId}">
				    	<textarea name="ncContent" class="form-control ml-1 shadow-none textarea"></textarea>
				    	<input type="submit" class="btn btn-dark mt-3" value="댓글 등록">
				    </form>
				  </div>
				</div>
	    	</c:if>

	    	<div>
	    		<button type="button" class="btn btn-outline-dark" onclick="location='${conPath}/notice/list.do'">전체글 보기</button>
	    	</div>
		
		<jsp:include page="list.jsp"/>
		
	</div>
	<jsp:include page="../main/footer.jsp"/>
	<input type="hidden" class="noticeNum" value="${notice.noticeNum}">
	<input type="hidden" class="commentPageNum" value="${commentPaging.currentPage}">
<script>

// 비로그인상태에서 댓글작성하고싶으면 로그인하러가라고 버튼
$('.gologin').click(function(){
	var noticeNum = $('.noticeNum').val();
	location.href='${conPath}/login.do?after=notice/content.do&noticeNum='+noticeNum;
});

	
$('.commentModifyView').click(function(){
	var ncNum = $(this).attr('id');
	var commentPageNum = $('.commentPageNum').val();
	var pageNum = "<c:out value='${param.pageNum}'/>";
	var search = "<c:out value='${param.search}'/>";
	var type = "<c:out value='${param.type}'/>";
	
	$.ajax({
		url : '${conPath}/notice/ncModify.do',
		type : 'get',
		data : 'ncNum='+ncNum+'&commentPageNum='+commentPageNum+'&pageNum='+pageNum+'&search='+search+'&type='+type,
		dataType : 'html',
		success : function(data){
			$('#comment'+ncNum).html(data);
		}
	});
	
});






function commentDelete() {

	if (confirm("댓글 삭제를 진행하시겠습니까?")) {
	location.href='${conPath}/commentDelete.do?boardNo=${dto.boardNo}&commentNo=${dto.commentNo}&commentPageNum=${commentPageNum}&pageNum=${pageNum}&search=${param.search}&type=${type}';
	}
}

</script>
</body>
</html>