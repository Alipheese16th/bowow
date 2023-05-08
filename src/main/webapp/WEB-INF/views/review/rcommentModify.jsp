<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<div class="comment-wrap">
		<form action="${conPath}/review/rcommentModify.do" method="post">
			<input type="hidden" name="commentNum" value="${comment.commentNum}">
			<input type="hidden" name="reviewNum" value="${comment.reviewNum}">
			<input type="hidden" name="pageNum" value="${param.pageNum}">
			<input type="hidden" name="commentPageNum" value="${param.commentPageNum}">
			<div class="comment-inbox" style="border:2px solid #ddd;border-radius:5px;padding:12px 20px;">
				<span style="display:block;margin-bottom:10px;font-weight:600;font-size:14px;">${member.memberId}</span>
				<textarea rows="2" cols="5" name="commentContent" placeholder="댓글을 남겨보세요" style="width:100%;border:0;">${comment.commentContent}</textarea>
				<div style="color:#888;text-align:right;padding-top:10px;">
					<input type="submit" value="수정" class="btn" style="background-color:#fff;"></div>
			</div>
		</form>
	</div>
</body>
</html>