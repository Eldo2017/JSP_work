<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="JSP의 page 지시자 연습용"%>
<%@ page import="java.util.Date" %>
<%@ page buffer="16kb" %>
<%@ page session="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=this.getServletInfo() %>
</body>
</html>