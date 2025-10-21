<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, vote.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<%
	int num = 0;
	if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))) {
		num = Integer.parseInt(request.getParameter("num"));
	}
	VoteList vlist = vDao.getVote(num);
	ArrayList<String> vItem = vDao.getItem(num);
	String question = vlist.getQuestion();
	int type = vlist.getType();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="..style.css" rel="stylesheet";>
<style>
/* --- 추가 스타일 --- */
.voteForm {
	width: 500px;
	margin: 30px auto;
	padding: 25px;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 3px 6px rgba(0,0,0,0.1);
	background-color: #fafafa;
}

.voteForm table {
	width: 100%;
	border-collapse: collapse;
}

.voteForm td {
	padding: 10px;
	font-size: 16px;
}

/* 질문 밑의 선 */
.voteForm .top-line {
	display: block;
	width: 90%;           /* ← 선 길이 */
	margin: 8px auto;
	border-bottom: 2px solid #ccc;
}

/* 응답 밑의 선 */
.voteForm .bottom-line {
	display: block;
	width: 85%;           /* ← 선 길이 */
	margin: 12px auto;
	border-bottom: 1px solid #ddd;
}

/* 보기 항목 */
.voteForm input[type="checkbox"],
.voteForm input[type="radio"] {
	margin-right: 8px;
	margin-left: 10px;
}

/* 버튼 */
.voteForm input[type="submit"],
.voteForm input[type="button"] {
	margin-top: 15px;
	padding: 8px 20px;
	border: none;
	border-radius: 5px;
	background-color: #4caf50;
	color: white;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.2s;
}

.voteForm input[type="submit"]:hover,
.voteForm input[type="button"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div class="voteForm">
	<form action="voteFormProc.jsp">
		<table>
			<tr>
				<td>Q : <%=question %></td>
				<span class="top-line"></span>
			</tr>
			<tr>
				<td style="padding-left: 30px;">
				<%
					for(int i=0; i < vItem.size(); i++) {
						String item = vItem.get(i);
						if(type==1) {
							out.print("<input type='checkbox' name='itemnum' value='" + i + "'>" + item);
						} else {
							out.print("<input type='radio' name='itemnum' value='" + i + "'>" + item);
						}
							
						out.print("<br>");
					}
				%>
				<span class="bottom-line"></span>
				</td>
			</tr>
			<tr>
				<td class ="center">
					<input type="submit" value="투표">&emsp;
					<input type="button" value="결과보기" 
					onclick="window.open('voteView.jsp?num=<%=num%>', 'voteView','width: 500px', 'height: 400px')">
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">
	</form>
	</div>
</body>
</html>