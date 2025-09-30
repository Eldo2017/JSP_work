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
		float f = 5.92f;
		int num = Math.round(f);
		java.util.Date date = new java.util.Date();
		int hour = date.getHours();
		int i = 4;
		int j = 7;
	%>
	<%!
		int max(int i, int j) {
			return i > j ? i : j;
		}
	
		
	%>
	실수 5.92를 정수로 반올림하라 : <%= num %><br>
	현재 날짜 및 시간 : <%= date %><br>
	두 수 중 큰 값 : <%= max(4,7) %><br>
	두 수 중 큰 값 : <%= max(i,j) %><br>
	지금은 오전/오후 중 <%= (hour < 12 ? "오전" : "오후") %>
</body>
</html>