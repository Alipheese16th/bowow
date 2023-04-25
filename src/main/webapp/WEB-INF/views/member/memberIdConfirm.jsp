<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<c:if test="${midConfirmResult eq 1}">
		<p style="color:red;">중복된 ID입니다. 사용불가합니다.</p>
	</c:if>
	<c:if test="${midConfirmResult eq 0}">
		사용가능한 ID입니다
	</c:if>
</body>
</html>