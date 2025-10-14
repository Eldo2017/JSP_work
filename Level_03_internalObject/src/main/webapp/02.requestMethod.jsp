<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>RequestMethod</h1>
	
	프로토콜 : <%=request.getProtocol() %><p/>
	서버명 : <%=request.getServerName() %><p/>
	포트번호 : <%=request.getServerPort() %><p/>
	클라이언트 주소 : <%=request.getRemoteAddr() %><p/>
	클라이언트명 : <%=request.getRemoteHost() %><p/>
	요청경로(URI) : <%=request.getRequestURI() %><p/>
	요청경로(URL) : <%=request.getRequestURL() %><p/>
	
</body>
</html>