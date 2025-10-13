<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vote.*, java.util.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />

<%
    request.setCharacterEncoding("UTF-8");

    // 설문 번호 파라미터 받기
    int num = 0;
    if (request.getParameter("num") != null)
        num = Integer.parseInt(request.getParameter("num"));

    // 설문 목록 가져오기
    ArrayList<VoteList> allList = vDao.getList();

    // 선택된 설문 (없으면 최신 설문)
    VoteList vlist = vDao.getVote(num);
    ArrayList<String> items = vDao.getItem(num);
    int type = vlist.getType();  // 1: 단일선택, 2: 복수선택
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 프로그램</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<style>
	* {margin: 0 auto;}
	div {width:800px;}
	h2, h5, th, .cen {text-align:center;}
	a {text-decoration:none; color:black;}
	a:hover {color:#0d6efd; text-decoration:underline;}
	.m50 {margin-top:50px;}
	.m30 {margin-top:30px;}
</style>
</head>
<body>
<div>
	<h2 class="m50">투표 프로그램</h2>
	<hr>

	<h5 class="m30">설문폼</h5>
	<hr>

	<!-- 🔸 선택된 설문 폼 표시 -->
	<form action="voteFormProc.jsp" method="post" class="m30">
		<table class="table">
			<tr>
				<th style="width:120px;">질문</th>
				<td>Q. <%= vlist.getQuestion() %></td>
			</tr>
			<tr>
				<th>항목</th>
				<td>
					<%
						for (int i=0; i<items.size(); i++) {
							String item = items.get(i);
							if (type == 1) {
					%>
								<input type="radio" name="itemnum" value="<%= i %>"> <%= item %><br>
					<%
							} else {
					%>
								<input type="checkbox" name="itemnum" value="<%= i %>"> <%= item %><br>
					<%
							}
						}
					%>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="hidden" name="num" value="<%= vlist.getNum() %>">
					<input type="submit" value="투표" class="btn btn-primary">
					<input type="button" value="결과보기" class="btn btn-secondary" onclick="alert('결과보기 기능은 아직 미구현')">
				</td>
			</tr>
		</table>
	</form>

	<!-- 🔸 설문 리스트 -->
	<h5 class="m30">설문리스트</h5>
	<table class="table table-striped m30">
		<tr class="table-secondary">
			<th>번호</th>
			<th>제목</th>
			<th>시작일~종료일</th>
		</tr>
	<%
		for (VoteList vl : allList) {
	%>
		<tr>
			<td class="cen"><%= vl.getNum() %></td>
			<td>
				<a href="voteList.jsp?num=<%= vl.getNum() %>">
					<%= vl.getQuestion() %>
				</a>
			</td>
			<td class="cen"><%= vl.getSdate() %> ~ <%= vl.getEdate() %></td>
		</tr>
	<%
		}
	%>
		<tr>
			<td colspan="3" align="right">
				<a href="voteInsert.jsp">설문 작성하기</a>
			</td>
		</tr>
	</table>
</div>
</body>
</html>