<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.*" %>
<jsp:useBean id="bDao" class="board.BoardDAO" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	
	if(request.getParameter("pass") != null) {
		String inputPass = request.getParameter("pass");
		BoardBean board = (BoardBean)session.getAttribute("bean");
		
		if(inputPass.equals(board.getPass())) {
			int res = bDao.deleteBoard(num);
			if(res == 1) {
				response.sendRedirect("list.jsp?nowPage=" + nowPage);
			} else {
		%>
				<script type="text/javascript">
					alert("댓글이 있어 삭제를 실패했습니다");
					history.go(-2);
				</script>
		<%		
			}
		} else {
			%>
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다");
				history.go(-1);
			</script>
			<%
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제하기</title>
</head>
<body>
	<form action = "delete.jsp" method="post">
		<table>
			<tr>
				<th height="30">사용자의 비밀번호를 입력하시오</th>
			</tr>
			<tr>
				<td>
					<input type="password" name="pass" required />
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="삭제하기">
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로가기" onclick="history.back();">
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>
</body>
</html>