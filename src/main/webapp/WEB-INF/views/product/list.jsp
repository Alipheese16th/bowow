<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	상품리스트
	${productList} 
	<br>
	<hr>
	${paging}
	<br>
	<hr>
	${param.category}
	<br>
	<hr>
	${product}
</body>
</html>