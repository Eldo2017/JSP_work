<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name = "";
	String age = "";
	String gender = "";
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0;i<cookies.length; i++) {
			String CName = cookies[i].getName();
			String CValue = cookies[i].getValue();
			out.print("Cookie Name: " + CName + "<br>");
			out.print("Cookie Value: " + CValue + "<hr>");
			
			if(CName.equals("Name")) name = CValue;
			else if(CName.equals("Age")) age = CValue;
			else if(CName.equals("Gender")) gender = CValue;
		}
	}
%>
<!-- 메소드 만들어도 되고, 위의 쿠키 얻어오는 출력문에 넣어서 출력하면 된다 -->
<h2>쿠키에 저장된 정보</h2>
이름 : <%= name %><br>
나이 : <%= age %><br>
성별 : <%= gender %><br>
</body>
</html>