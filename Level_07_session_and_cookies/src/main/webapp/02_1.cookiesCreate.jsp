<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
	Cookie cookie1 = new Cookie("Name1","김레이");
	response.addCookie(cookie1); 
	*/
	
	response.addCookie(new Cookie("Name","김레이"));
	response.addCookie(new Cookie("Age","19"));
	response.addCookie(new Cookie("Gender","Female"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	쿠키 생성<p/>
	쿠키 내용은 <a href="02_2.testCookies.jsp">이쪽으로</a>
</body>
</html>