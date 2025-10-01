<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String bloodType = request.getParameter("bloodType");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b><%=name %></b>님의 혈액형은 <%=bloodType %>형입니다.<p/>
	당신은 멋지고 독립적이며 자신의 규칙을 따르고 다른 사람이 당신에 대해 어떻게 생각하는지 신경 쓰지 않습니다.<br>
	B형 혈액형을 가진 사람들은 인생을 최대한 즐기는 것을 좋아하고 그들에게 활력을 주는 것에 열정적입니다.<br>
	그들은 항상 호기심이 많아서 알지 못하는 사이에 충동적으로 만들 수도 있습니다.<br>
	그러나 그들은 또한 사람들과 그들이 열정적이지 않은 것에 대해 천박하고 이기적이며 게으른 것으로 간주됩니다.<br><br>
	장점 : 개인주의적, 열정적, 낙관적, 사교적, 정직함<br>
	최악의 특성: 참을성 없음, 무책임함, 자기 중심적임, 오만함, 변덕스러움<br>
</body>
</html>