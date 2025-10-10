<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Cookie Login Page</h2>
	<%
	String id = "";
	Cookie[] cookie = request.getCookies();
	for(int i=0;i<cookie.length;i++) {
		if(cookie[i].getName().equals("idKey"))
			id = cookie[i].getValue();
	}
	%>
	
	<%=id %> 님, 환영합니다~!<p/>
	<a href="04_4.cookieLogout.jsp">로그아웃</a>
</body>
</html>