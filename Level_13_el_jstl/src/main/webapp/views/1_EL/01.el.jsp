<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.dto.person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 기존 방법대로 스크립트릿과 표현식을 이용해 각 scope에 담긴 값 출력</h3>
	<%
		String classRoom = (String)request.getAttribute("classroom");
		person student = (person)request.getAttribute("student");
		String academy = (String)session.getAttribute("academy");
		person teacher = (person)session.getAttribute("teacher");
	%>
	
	<p>
		학원 정보 : ${academy } <br>
		강의실 정보 : ${classRoom } <br>
		강사 정보 : ${teacher.name }, ${teacher.age }, ${teacher.gender }<br><br>
		수강생 정보
		<ul>
			<li>이름 : ${student.name }</li>
			<li>나이 : ${student.age }</li>
			<li>성별 : ${student.gender }</li>
		</ul>
	</p>
	 
	<h3>2. el을 사용해 보다 쉽게 해당하는 scope에 담긴 값 출력</h3>
	<!--  
	<p>
		el응 이용해 getXxx를 통하여 값을 빼올 필요없이 el 구문 내에 키값만 제시하면 바로 접근 가능<br>
		기본적으로 el은 jsp 내장 객체를 구분하지 않고 자동으로 모든 내장객체의 키값을 검색하여 존재하면 값을 가져옴<br>
	</p>
	
	<p>
		강의실 정보 : ${classRoom }<br>
		수강생 정보
		<ul>
			<li>이름 : ${student.name }</li>
			<li>나이 : ${student.age }</li>
			<li>성별 : ${student.gender }</li>
		</ul>
	</p>
	-->
	
	<h3>3. el 사용 시 내장 객체 키값이 동일하면</h3>
	scope값 : ${scope }<br>
	<!-- 
		el은 공유 범위가 가장 작은 scope부터 키를 검색한다
		page => request => session => application
		하지만 모든 영역에 키가 없다면 아무것도 출력 안한다(오류는 없지만)	
	-->
	test값 : ${test }<br>
	
	<h3>4. 직접 scope 지정해 접근하기</h3>
	
	<%
		pageContext.setAttribute("scope","page");
	%>
	pageScope값 : ${scope } or ${pageScope.scope }<br>
	requestScope값 : ${requestScope.scope }<br>
	sessionScope값 : ${sessionScope.scope }<br>
	applicationScope값 : ${applicationScope.scope }<br>
	
	잘못 접근하면 데이터가 출력이 안된다<br>
	classRoom : ${sessionScope.classRoom }<br>
</body>
</html>