<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String msg;
		
		switch(color) {
		case "blue":
			msg = "파란색";
			break;
		case "yellow":
			msg = "노란색";
			break;
		case "red":
			msg = "빨간색";
			break;
		default:
			msg = "기본색 : 흰색";
			color = "white";
			break;
		}
		
		/* if(color.equals("yellow")) {
			msg = "노란색";
		} else if(color.equals("blue")) {
			msg = "파란색";
		} else if(color.equals("red")) {
			msg = "빨간색";
		} else {
			msg = "기본색 : 흰색";
			color = "white";
		} */
	%>
</head>
<body bgcolor ="<%= color %>">
	<%= name %>
	<%= color %>
</body>
</html>