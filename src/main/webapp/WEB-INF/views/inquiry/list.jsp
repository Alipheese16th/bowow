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
	<style>
		.inquiry table {width: 1250px; margin-left: 20px;}
		.inquiry h2 {
			text-align:center;
			margin:40px auto 30px;
			font-size:2rem;
			font-weight: bold;
		}
		.inquiry .write {margin: 20px 0; text-align: center;}
		.inquiry .write a:hover {background-color: gray; border: 1px solid lightgray; font-weight: bold;}
		.inquiry .write a {
			color: #fff;
		}
		.inquiry .btn {
			background-color: #BE8D6E; border: 1px solid #BE8D6E; 
			color: #fff; font-size: .8em;
		}
		.inquiry .btn:hover {background-color: gray; border: 1px solid lightgray; font-weight: bold;}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		const clickContent = function(inquiryNum) {
			location.href = "${conPath}/inquiry/content.do?inquiryNum=" + inquiryNum;
		};
		const clickModify = function(inquiryNum) {
			location.href = "${conPath}/inquiry/modify.do?inquiryNum=" + inquiryNum;
		};
		const clickDelete = function(inquiryNum) {
			location.href = "${conPath}/inquiry/delete.do?inquiryNum=" + inquiryNum;
		};
		const clickReply = function(inquiryNum) {
			location.href = "${conPath}/inquiry/reply.do?inquiryNum=" + inquiryNum;
		};
	</script>
</head>
<body>
	<c:if test="${not empty writeIResult }">
		<script>alert('문의 글이 작성되었습니다');</script>
	</c:if>
	<c:if test="${not empty modifyIResult }">
		<script>alert('문의 글이 수정되었습니다');</script>
	</c:if>
	<c:if test="${not empty deleteIResult }">
		<script>alert('문의 글이 삭제되었습니다');</script>
	</c:if>

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
			                <tr style="border-bottom: 2px solid #BE8D6E;">
			                    <th>작성자</th>
			                    <th>제목</th>
			                    <th>내용</th>
			                    <th>이메일</th>
			                </tr>
			            </thead>
			            <tbody>
			                <c:forEach var="inquiry" items="${inquiryList }" varStatus="status">
				            	<c:if test="${member.memberId eq inquiry.memberId or not empty admin}">
				                    <tr>
				                        <td><c:out value="${inquiry.memberId }"/></td>
				                        <td><c:out value="${inquiry.inquiryTitle }"/></td>
				                        <td><c:out value="${inquiry.inquiryContent }"/></td>
				                        <td><c:out value="${inquiry.inquiryEmail }"/></td>
				                        <%-- <td onclick="clickTd(${inquiry.inquiryNum})" style="background-image: url(${conPath}/productImage/ddoyangpeachnec_content.jpg);">
				                        	<c:out value="${inquiry.inquiryNum }"/>
				                        </td> --%>
				                        <c:if test="${not empty member }">
					                        <td >
					                        	<button value="${inquiry.inquiryNum }" class="btn" onclick="clickContent(${inquiry.inquiryNum})">보기</button>
					                        	<button value="${inquiry.inquiryNum }" class="btn" onclick="clickModify(${inquiry.inquiryNum})">수정</button>
					                        	<button value="${inquiry.inquiryNum }" class="btn" onclick="clickDelete(${inquiry.inquiryNum})">삭제</button>
					                        </td>
				                        </c:if>
				                        <c:if test="${not empty admin }">
					                        <td >
					                        	<button value="${inquiry.inquiryNum }" class="btn" onclick="clickContent(${inquiry.inquiryNum})">보기</button>
					                        	<button value="${inquiry.inquiryNum }" class="btn" onclick="clickReply(${inquiry.inquiryNum})">답변</button>
					                        	<button value="${inquiry.inquiryNum }" class="btn" onclick="clickDelete(${inquiry.inquiryNum})">삭제</button>
					                        </td>
				                        </c:if>
				                    </tr>
				            	</c:if>
			                </c:forEach>
			            </tbody>
			        </table>
		    	</c:if>
		        
		        <div class="write">
		            <a href="${conPath }/inquiry/write.do" class="btn btn-success" style="width: 150px;">글쓰기</a>            
		        </div>
		</div>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>