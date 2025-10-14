<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 쿠키 값은 띄어쓰기가 되지 않는다
	Cookie cookie = new Cookie("Cookie1","Metsubojinrai.net");
	cookie.setValue("Stomach");
	cookie.setMaxAge(3600);
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<h2>Cookie를 사용하여 연결 유지</h2>
	쿠키를 만듭니다<p/>
	쿠키 내용은 <a href="01_2.testCookie.jsp">멸망신뢰.net</a>에 있습니다
</body>
</html>