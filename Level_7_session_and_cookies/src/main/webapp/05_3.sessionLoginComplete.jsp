<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("idKey");
%>
	<h2>Session Login Page</h2>
	<%= id %> 님 어서오세요~!
	<a href="05_4.sessionLogout.jsp">로그아웃</a>
<%
	if(id == null) {
		
	} else {
		
	}
%>
</body>
</html>