<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, jdbc_oracleDB.*" %>
<jsp:useBean id="LocMgr" class="jdbc_oracleDB.LocPool" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Bean을 활용한 Oracle 연동하기</h1>
	<table border="1">
		<tr>
			<th>지역코드</th>
			<th>국가코드</th>
			<th>지역명</th>
		</tr>
		<% 
			ArrayList<LocalBean> alist = LocMgr.getLocList();
			for(LocalBean bean : alist) {
		%>
		<tr>
			<td><%=bean.getLocal_Code() %></td>
			<td><%=bean.getNational_Code() %></td>
			<td><%=bean.getLocal_Name() %></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>