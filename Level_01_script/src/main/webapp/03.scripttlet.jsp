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
		String name = "심영";
		int num = 43;
		boolean male = false;
		double dounum = 3.14;
		
		// int age; => 지역 변수는 반드시 초기화부터 하라
	%>
	나의 이름 : <%= name %><br>
	내 나이 : <%= num %><br>
	남자인가 : <%= male %><br>
	보너스 ) Pi = <%= dounum %><br>
	
	<%=application.getRealPath("/") %>
</body>
</html>