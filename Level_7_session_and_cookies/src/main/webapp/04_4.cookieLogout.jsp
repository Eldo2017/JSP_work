<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookie = request.getCookies();
	if(cookie != null) {
		for(int i=0;i<cookie.length;i++) {
			if(cookie[i].getName().equals("idKey")) {
				cookie[i].setMaxAge(0);
				response.addCookie(cookie[i]);
			}
		}
	}
%>

	<script>
		alert("로그아웃을 완료하였습니다");
		location.href="04_1.cookieLogin.jsp";
	</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>