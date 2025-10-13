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
	String id = (String)session.getAttribute("idKey");
	if(id != null) {
%>
		<b><%=id %>님 환영합니다.</b><p/>
		즐거운 쇼핑되세요<p/>
		<a href="logout.jsp">로그아웃</a>
<%
	} else {
%>
		<form action="loginProc.jsp" method="post">
		<table align="center">
			<tr>
				<th colspan="2">로그인</th>
			</tr>
			<tr>
				<td>ID</td>
				<td><input name="id" required></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pwd" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">&ensp;
					<input type="button" value="회원가입" onclick="location.href='member.jsp'">
				</td>
			</tr>	
		</table>
	</form>
<%} %>
</body>
</html>