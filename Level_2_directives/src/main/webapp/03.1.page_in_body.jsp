<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>body</title>
<style>
	.header {
		line-height : 50px;
		background-color: darkorchid;
	}
	
	.body {
		height: 200px;
		line-height: 200px;
		background-color: deeppink; 	
	}
	
	.footer {
		height: 50px;
		line-height: 50px;
		background-color: blueviolet;
	}
</style>
</head>
<body>
	<h1>body</h1>
	<%@ include file="03.2.page_in_header.jsp" %>
	<p class="body">include 지시자 body 부분</p>
	<%@ include file="03.3.page_in_footer.jsp" %>
</body>
</html>