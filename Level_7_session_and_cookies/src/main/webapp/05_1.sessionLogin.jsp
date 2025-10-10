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
	<script type="text/javascript">
		alert("로그인을 완료하였습니다");
		location.href="05_3.sessionLoginComplete.jsp";
	</script>
<% 	
	} else {
%>
	<h1>Session 로그인</h1>
	<form action="05_2.sessionLoginProc.jsp" method="post">
		<table border="1">
			<tr>
				<th colspan="2">Login</th>
			</tr>
			<tr>
				<th>ID</th>
				<td><input name="id" required></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="login">
					<input type="reset" value="reset">
				</td>
			</tr>
		</table>
	</form>
<% 
	}
%>
</body>
</html>