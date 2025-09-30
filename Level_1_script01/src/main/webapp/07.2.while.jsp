<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
		String msg = request.getParameter("msg");
		int count = Integer.parseInt(request.getParameter("count"));
	%>
</head>
<body>
	<!-- while문으로 msg를 count만큼 출력하라 -->
	<%
		int i = 0;
		while(i < count) {
			out.print(msg + "<br>");
			i++;
		}
	%>
	<hr>
	메시지 횟수 : <%= count %>
	
	<%-- <%= msg %><br>
	<%= count %> --%>
</body>
</html>