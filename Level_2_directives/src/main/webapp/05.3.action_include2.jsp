<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("siteName");
	String tel = request.getParameter("siteTel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Action include로 포함되는 페이지<p/>
	<%=name %><p/>
	<%=tel %><p/>
</body>
</html>