<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Out Ex</h1>
	<%
		int total = out.getBufferSize();
		int remain = out.getRemaining();
		int use = total - remain;
	%>
	버퍼 총 크기 : <%=total %>byte<p/>
	남은 버퍼 : <%=remain %>byte<p/>
	사용한 버퍼 : <%=use %>byte<p/>
</body>
	
</html>