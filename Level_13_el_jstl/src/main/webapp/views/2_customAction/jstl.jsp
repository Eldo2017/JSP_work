<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL</h1>
	<p>
		JSP Standard Tag Library의 약자, jsp에서 사용되는 커스텀 액션 태그로<br>
		공통적으로 자주 사용하는 코드들을 보다 쉽게 사용할 수 있게 태그화시켜 표준으로 제공하는 라이브러리<br>
		필요한 라이브러리를 추가 후 사용 가능<br>
	</p>
	
	<h3>* JSTL 선언하기</h3>
	
	<p>
		JSTL을 사용하려고 하는 해당 JSP 페이지 상단에 <br>
		taglib 지시어를 사용해 선언한다<br><br>
		
		&lt;%@ taglib prefix="접두어" uri="라이브러리 파일 상 uri 주소" %&gt;
	</p>
	
	<h4>1. JSTL Core Library</h4>
	<p>변수와 조건문, 반복문 등 로직과 관련되 문법 제공</p>
	<a href="01.core.jsp">core library</a>
	
</body>
</html>