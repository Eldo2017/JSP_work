<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 산술 연산</h3>
	
	기존 방식: <%= (int)request.getAttribute("big") + (int)request.getAttribute("small") %><br>
	<br><br>
	
	123 + 102 = ${big + small}<br>
	123 - 102 = ${big - small}<br>
	123 * 102 = ${big * small}<br>
	123 / 102 = ${big / small} or ${big div small}<br>
	123 % 102 = ${big % small} or ${big mod small}<br><br>
	
	<h3>2. 대소 비교 연산</h3>
	
	123 > 102 = ${big > small} or ${big gt small}<br>
	123 < 102 = ${big < small} or ${big lt small}<br>
	123 >= 102 = ${big >= small} or ${big ge small}<br>
	123 <= 102 = ${big <= small} or ${big le small}<br><br>
	
	<h3>3. 동등 비교 연산</h3>
	<!-- el에서  == 비교가 자바에선 equals()와 같은 동작을 한다 -->
	sOne과 sTwo가 일치한가? ${sOne == sTwo} or ${sOne eq sTwo}<br>
	sOne과 sTwo가 일치하지 않은가? ${sOne != sTwo} or ${sOne ne sTwo}<br><br>
	
	big에 담긴 값이 123인가? ${big == 123} or ${big eq 123}<br>
	sThree에 담긴 값이 '이것은 수류탄이여!'인가? ${sThree == '이것은 수류탄이여!'} or ${sThree eq '이것은 수류탄이여!'}<br>

	<h3>4. 객체가 null이거나 리스트가 비어있는지 비교</h3>
	pOne이 null인가? ${pOne == null} or ${pOne eq null} or ${empty pOne}<br>
	pTwo가 비어있는가? ${pTwo == null} or ${pTwo eq null} or ${empty pTwo}<br>
	
	pOne이 null이 아닌가? ${pOne != null} or ${pOne ne null} or ${not empty pOne}<br><br>
	
	aOne은 비어있는가? ${empty aOne}<br>
	aTwo는 비어있는가? ${empty aTwo}<br>
	
	<h3>5. 논리 연산자</h3>
	
	${true && true} or ${true and true}<br>
	${false && false} or ${false and false}<br>
	
	${true || true} or ${true or true}<br>
	${false || false} or ${false or false}<br>
	
	<!-- big이 small보다 크고 aOne이 비어있는가? -->
	big이 small보다 크고 aOne이 비어있는가? ${big gt small and empty aOne}<br>
	
	<hr>
	
	<!-- 
		* jsp를 이루는 구성인자
		  1. 스크립팅 원소 : jsp 페이지 내 자바 코드를 직접 기술할 수 있게 하는 기능
		  				  ex) 스크립트릿, 표현식 등등...
		  2. 지시어 : jsp 페이지 정보에 대한 내용을 표현하거나 또 다른 페이지를 포함시킬 때 사용
		  			jsp 기능을 확장시키는 라이브러리 등록을 할 때 사용
		  			ex) page 지시어, include 지시어, taglib 지시어
		  3. 액션 태그(표준 액션 태그, 커스텀 액션 태그) : jsp 페이지 내에서 어떤 동작을 하게 지시하는 태그
		  										 xml 기술을 이용하여 기존의 jsp 문법을 확장하는 기술을 제공하는 태그
		  	- 표준 액션 태그(Standard Action Tag) : jsp 페이지 내에서 바로 사용가능
		  										모든 태그명 앞에 jsp: 접두어 붙음
		  	- 커스텀 액션 태그(Custom Action Tag) : jsp 페이지 내에서 사용 불가(별도 페이지 필요)
	-->
	<h1>JSP Action Tag</h1>
	<p>xml 기술을 이용해 기존의 jsp 문법을 확장하는 기술을 제공한다</p>
	<h3>* 커스텀 액션 태그</h3>
	
	<a href="views/2_customAction/jstl.jsp">JSTL</a>
</body>
</html>