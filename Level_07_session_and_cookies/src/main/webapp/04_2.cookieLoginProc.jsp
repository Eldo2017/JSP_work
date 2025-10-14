<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem" class="jdbc_oracleDB.MemPool" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	boolean flag = mem.loginMem(id,pw);
	
	if(flag) {
		Cookie cookie = new Cookie("idKey",id);
		response.addCookie(cookie);
%>
		<script type="text/javascript">
			alert("로그인을 완료하였습니다");
			location.href="04_3.cookieLoginComplete.jsp";
		</script>
<%
	} else {
%>
		<script type="text/javascript">
			alert("로그인을 실패하였습니다");
			location.href="04_1.cookieLogin.jsp";
		</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>