<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<h1>로그인</h1>
	
	<% 
	if(id!=null) {
	%>
		<h2><%= id %> 님 반갑습니다!</h2>
		<a href="03.Logout.jsp">로그아웃</a>
	<%
	} else {
	%>
		<form action="loginServlet" method="post">
		ID : <input type="text" name="id"><br>
		PW : <input type="password" name="pw"><br>
		<input type="submit" value="로그인">
		</form>
	<%
	}
	%>
</body>
</html>