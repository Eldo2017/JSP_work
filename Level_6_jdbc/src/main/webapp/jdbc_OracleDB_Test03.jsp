<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JDBC를 이용한 Oracle 연동하기</h1>
<% 
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:free","PlayMaker","1234");
		
		Statement st = con.createStatement();
		ResultSet res = st.executeQuery("select * from EMPLOYEE");
%>
	<table border="1">
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>부서번호</th>
		</tr>
		<% 
			while(res.next()){
				String id = res.getString(1);
				String name = res.getString(2);
				String dept = res.getString(6);
		%>
			<tr>
				<td><%=id %></td>
				<td><%=name %></td>
				<td><%=dept %></td>
			</tr>
		<%
			}
		%>
	</table>
<%		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>	
	
</body>
</html>