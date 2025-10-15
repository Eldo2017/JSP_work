<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, board.*" %>
<jsp:useBean id="bDao" class="board.BoardDAO" />
<%
	int totalRecord = 0;		// 총 레코드수
	int numPerPage = 10;		// 1페이지당 레코드수
	int pagePerBlock = 5;		// 블록당 페이지수 [1][2][3][4][5]
			
	int totalPage = 0;			// 총 페이지 수
	int totalBlock = 0;			// 총 블록 수
	
	int nowPage = 1;			// 현재 해당하는 페이지
	int nowBlock = 1;			// 현재 해당하는 블록
	
	int start = 0;				// DB에서 select시작번호(한페이지에 필요한 만큼 게시물 가져오기)
	int end = 0;				// start번호부터 10개 가져오기
	int listSize = 0;			// 현재 읽어온 레코드 수
	
	String keyField= "", keyWord = "";
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");	
	}
	
	// ✅ 추가: 현재 페이지(nowPage) 계산
	if(request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));

	totalRecord = bDao.getTotalRecord(keyField, keyWord);
	totalPage = (int)Math.ceil(totalRecord / (double)numPerPage);
	totalBlock = (int)Math.ceil(totalPage / (double)pagePerBlock);
	nowBlock = (int)Math.ceil(nowPage / (double)pagePerBlock);

	// ✅ 수정: start, end 계산식 수정
	start = (nowPage - 1) * numPerPage + 1;
	end = nowPage * numPerPage;			

	if(request.getParameter("reload") != null) {
		if(request.getParameter("reload").equals("true")) {
			keyField = "";
			keyWord = "";
		}
	}
%>

<script type="text/javascript">
	function list() {
		document.listFrm.submit();
	}
	function read(num) {
		document.readFrm.num.value = num;
		// document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet">
<title>게시판</title>
</head>
<body>
	<div class="list">
		<h2 class="m30">JSPBoard</h2>
		<table class="table m30">
			<tr>
				<td colspan=5 class="right-align">Total : <%=totalRecord %>Articles(<font color="blue"><%=nowPage %>/<%=totalPage %>Pages</font>)</td>
			</tr>
			<tr>
				<th width="12%">번호</th>
				<th width="36%">제목</th>
				<th width="15%">이름</th>
				<th width="25%">날짜</th>
				<th width="12%">조회수</th>
			</tr>
			<%
			ArrayList<BoardBean> alist = bDao.getBoardList(keyField, keyWord, start, end);
			
			for(int i=0; i<alist.size(); i++) {
				BoardBean board = alist.get(i);
			%>
				<tr>
				    <!-- ✅ 번호 순서를 전체 기준으로 보이게 수정 -->
				    <td class="cen"><%= totalRecord - ((nowPage-1)*numPerPage + i) %></td>
					<td><a href="javascript:read('<%=board.getNum() %>')"><%=board.getSubject() %></a></td>
					<td class="cen"><%=board.getName() %></td>
					<td class="cen"><%=board.getRegdate().substring(0,10) %></td>
					<td class="cen"><%=board.getCount() %></td>
				</tr>
			<%} // for end%>
			<tr>
				<td colspan=5><br/><br/></td>
			</tr>
			<tr>
				<td colspan=3 class="cen">
					<!-- ✅ 페이지 블록 표시 -->
					<%
					int pageStart = (nowBlock - 1) * pagePerBlock + 1;
					int pageEnd = pageStart + pagePerBlock - 1;
					if(pageEnd > totalPage) pageEnd = totalPage;

					// 이전 블록 링크
					if(nowBlock > 1) {
					%>
						<a href="list.jsp?nowPage=<%=pageStart-1 %>">[이전]</a>
					<%
					}

					// 페이지 번호 반복 출력
					for(int i = pageStart; i <= pageEnd; i++) {
						if(i == nowPage) {
					%>
							[<b><%= i %></b>]
					<%
						} else {
					%>
							<a href="list.jsp?nowPage=<%= i %>&keyField=<%= keyField %>&keyWord=<%= keyWord %>">[<%= i %>]</a>
					<%
						}
					}

					// 다음 블록 링크
					if(nowBlock < totalBlock) {
					%>
						<a href="list.jsp?nowPage=<%=pageEnd+1 %>">[다음]</a>
					<%
					}
					%>
				</td>
				<td colspan=2 class="right-align">
					<a href = "post.jsp">[글쓰기]</a>&emsp;
					<a href = "javascript:list();">[처음으로]</a>&emsp;
				</td>
			</tr>
		</table>
		<form action="list.jsp" name="searchFrm">
			<select name="keyField">
				<option value = "name">이름</option>
				<option value = "subject">제목</option>
				<option value = "content">내용</option>
			</select>
			<input name="keyWord" required>
			<input type="submit" value="찾기">
		</form>
		
		<!-- 처음으로 누르면 화면 reload -->
		<form name="listFrm">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value = "1">
		</form>
		
		<!-- 제목을 누르면 상세보기 페이지로 가기 -->
		<form name="readFrm" action="read.jsp">
			<input type="hidden" name="num">
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		</form>
	</div>
</body>
</html>