<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, vote.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int sum = vDao.sumCount(num);
	VoteList vlist = vDao.getVote(num); // 질문 정보
	ArrayList<VoteItem> alist = vDao.getView(num); // 항목별 데이터
	
	Random r = new Random();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet";>
<title>투표 결과</title>

</head>
<body>
	<div class = "view">
		<table class="table m30">
			<tr>
				<th colspan=4>Q : <%= vlist.getQuestion() %><th>
			</tr>
			<tr>
				<th colspan=4 class="right-align">총 투표자 : <%=sum %>
			</tr>
			<tr>
				<th width="25%">번호</th>
				<th width="30%">item</th>
				<th>그래프</th>
				<th width="15%">득표수</th>
			</tr>
			<%
				for(int i=0;i<alist.size();i++) {
					VoteItem vitem = alist.get(i);
					String[] item = vitem.getItem();
					int rgb = r.nextInt(255*255*255);
					
					String hRGB = "#" + Integer.toHexString(rgb);
					
					int ratio = (int)(vitem.getCount() / (double)sum * 100);
			%>
			<tr>
				<td align="center"><%=i+1 %></td>
				<td align="center"><%=item[0] %></td>
				<td>
					<table width=<%=ratio %>" height="15" align="left">
						<tr>
							<td bgcolor="<%= hRGB %>"></td>
						</tr>
					</table>
				</td>
				<td><%=vitem.getCount() %></td>
			</tr>
			<% }  // for end %>
		</table>
		<p/>
		<div class="d-grid col-2 mx-auto">
			<button type="button" class="btn btn-dark" onclick="window.close();">닫기</button>
		</div>
	</div>
</body>
</html>