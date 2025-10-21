<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean" %>
<%
	String nowPage = request.getParameter("nowPage");
	BoardBean board = (BoardBean)session.getAttribute("bean");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/board_normal.css" rel="stylesheet">
<title>댓글 화면</title>
</head>
<body>
	<form method="post" action="boardReply">
		<table align="center">
			<tr>
				<th colspan=2 bgcolor="gold"><font color="black">댓 글 작 성</font></th>
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
				<td><input name="subject" value="답변 : <%=board.getSubject() %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50">
<%=board.getContent() %>
====== 댓글을 작성하시오 ======
				</textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required></td>
			</tr>
			<tr>
				<td colspan="2"><br><hr></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="댓글등록">&emsp;
					<input type="reset" value="다시작성">&emsp;
					<input type="button" value="리스트로" onClick="history.go(-1)">
				</th>
			</tr>
		</table>
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		
		<!-- 내 정보 -->
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		
		<!-- 부모 정보 -->
		<input type="hidden" name="ref" value="<%=board.getRef() %>">
		<input type="hidden" name="pos" value="<%=board.getPos() %>">
		<input type="hidden" name="depth" value="<%=board.getDepth() %>">
	</form>
</body>
</html>