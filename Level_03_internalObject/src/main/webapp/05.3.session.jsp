<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String food = request.getParameter("food");
	String trip = request.getParameter("trip");
	
	String id = (String)session.getAttribute("idKey");
	String sessionId = session.getId();
	int intervalTime = session.getMaxInactiveInterval();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(id != null) {
	%>
			<h1>Session Ex</h1>
			<%=id %>님이 좋아하는 음식과 관광장소는 <%=food %>, <%=trip %>입니다.<p/>
			세션 ID : <%=sessionId %><p/>
			세션 유지시간 : <%=intervalTime %>초
	<%		
		} else {
			out.print("세션 시간이 경과하였거나 다른 이유로 연결을 할 수 없습니다");
		}
	%>
</body>
</html>