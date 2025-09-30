<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Error Page</h1>
	<p>
		다음과 같은 예외 발생!<br> 
		0으로 나눌수가 없습니다
	</p>
	예외타입 : <%=exception.getClass().getName() %><br>
	예외메시지: <%=exception.getMessage() %>
</body>
</html>