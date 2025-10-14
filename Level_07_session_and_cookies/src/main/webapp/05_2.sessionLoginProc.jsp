<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem" class="jdbc_oracleDB.MemPool" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	if(mem.loginMem(id, pw)) {
		session.setAttribute("idKey", id);
%>
	<script type="text/javascript">
		alert("로그인을 완료하였습니다");
		location.href="05_3.sessionLoginComplete.jsp";
	</script>
<%
	} else {
%>
	<script type="text/javascript">
		alert("로그인을 실패하였습니다");
		location.href="05_1.sessionLogin.jsp";
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