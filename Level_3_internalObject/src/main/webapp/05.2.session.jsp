<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	session.setAttribute("idKey", id);
	session.setMaxInactiveInterval(30*60);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Session Ex</h1>
	<form action="05.3.session.jsp">
		1. 가장 좋아하는 음식은?<p/>
		<input type="radio" name="food" value="야끼소바">야끼소바&emsp;
		<input type="radio" name="food" value="카레라이스">카레라이스&emsp;
		<input type="radio" name="food" value="볶음밥">볶음밥&emsp;</p>
		2. 자신의 최애 관광장소는?<p/>		
		<input type="radio" name="trip" value="박물관">박물관&emsp;
		<input type="radio" name="trip" value="미술관">미술관&emsp;
		<input type="radio" name="trip" value="동물원">동물원&emsp;
		<input type="radio" name="trip" value="놀이동산">놀이동산&emsp;
		<input type="radio" name="trip" value="영화관">영화관&emsp;<p/>
		
		<input type="submit">&emsp;
		<input type="reset">
	</form>
</body>
</html>