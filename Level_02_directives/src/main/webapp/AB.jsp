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
	당신은 사이코이거나 천재입니다.<br>
	AB형 혈액형을 가진 사람들은 종종 예측할 수 없지만 높은 수준의 지능과 다양한 관심사로 "할 수 있다"는 태도를 가지고 있습니다.<br>
	이 혈액형을 가진 사람들은 그들만의 세계에 있는 것처럼 보이고 독특하고 기발합니다.<br>
	마찬가지로, 그들은 수줍음이 많고 냉담하며 종종 혼자 있는 것을 선호할 수 있습니다.<br>
	이로 인해 다른 사람들은 자신이 이중적이고 차갑다고 생각할 수 있습니다.<br>
	당신은 모든 사람이 이해할 수 없는 신비한 외계인입니다.<br><br>
	최고의 특성 : 합리적, 지능적, 긍정적, 내향적, 독특함<br>
	최악의 특성 : 냉담함, 비판적, 우유부단함, 용서하지 못함, 예측 불가능<br>
</body>
</html>