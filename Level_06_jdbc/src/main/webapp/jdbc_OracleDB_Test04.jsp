<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, jdbc_oracleDB.*" %>
<jsp:useBean id="ProMgr" class="jdbc_oracleDB.ProMgr" />

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
			<th>상품번호</th>
			<th>상품명</th>
			<th>브랜드</th>
		</tr>
		<% 
			ArrayList<ProductBean> alist = ProMgr.getProList();
			for(ProductBean bean : alist) {
		%>
		<tr>
			<td><%=bean.getpCode() %></td>
			<td><%=bean.getpName() %></td>
			<td><%=bean.getBrand() %></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>