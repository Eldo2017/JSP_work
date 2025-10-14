<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- html 주석 -->
	당신의 이름 <%= name %><br>
	당신의 나이 <%= age %>
	<%!
	// 프로그래밍 주석
	/* 여러줄 주석 */ 
	String name = "이소원";
	int age = 23;
	%>
	
	<%!
	String name2 = name + " 님";
	%><br>
	
	<%= name2 %><br>
	
	<%--
		jsp 주석 : html과 jsp가 섞여있다면
	--%>
</body>
</html>