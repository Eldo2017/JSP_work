<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean" %>
<%
	BoardBean board = (BoardBean)session.getAttribute("bean");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/board_normal.css" rel="stylesheet">
<title>글 작성하기</title>
</head>
<body>
	<form method="post" action="boardPost">
		<table align="center">
			<tr>
				<th colspan=2 bgcolor="#AFA226"><font color="white">글 작 성</font></th>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td width="15%">성명</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required>&ensp;</td>
			</tr>
			<tr>
				<td colspan="2"><br><hr></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록">&emsp;
					<input type="reset" value="다시작성">&emsp;
					<input type="button" value="리스트로" onClick="location.href='list.jsp'">
				</th>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
	</form>
</body>
</html>