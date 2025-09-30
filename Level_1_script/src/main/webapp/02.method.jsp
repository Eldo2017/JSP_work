<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		int x;
		int y = 1;
		// 메소드는 선언문에서만 사용 가능
		public int plusMethod(int x, int y) {
			return x + y;
		}
		
		String msg;
	%>
	
	x와 y의 합 ? <%= plusMethod(7,3) %><br>
	x의 값은 ? <%= x %><br>
	x와 y의 합 ? <%= plusMethod(x,y) %><br>
	msg의 값 ? <%= msg %>
</body>
</html>