<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. formatNumber</h3>
	<p>
	숫자 데이터의 포맷(형식) 지정<br>
	- 표현하려고 하는 숫자 데이터 형식을 통화 기초, %등 원하는 쓰임에 맞게 형식을 지정하는 태그<br><br>
	(fmt:formatNumber value="출력할 값" [groupingUsed="true | false" type="percent | currency" currencySymbol="통화기호문자"])<br>
	=> groupingUsed : 세자리마다 구분자(,) 표시 여부 (기본값: true = 세자리마다 구분자 표시)<br>
	=> type : percent = %로  출력<br>
			  &ensp;&ensp;&ensp;currency = 현재 local 지역 화폐 표시 여부<br>
	=> currencySymbol = 화폐단위를 넣어줄 때 <br>
	</p>
	
	<c:set var="num1" value="123456789" />
	<c:set var="num2" value="0.93" />
	<c:set var="num3" value="75000" />
	
	그냥 출력 : ${num1}<br>
	세자리마다 구분 후 : <fmt:formatNumber value="${num1}" /><br>
	숫자 그대로 출력 : <fmt:formatNumber value="${num1}" groupingUsed="false"/><br><br>
	
	그냥 출력 : ${num2}<br>
	percent : <fmt:formatNumber value="${num2}" type="percent" /><br><br>
	
	그냥 출력 : ${num3}<br>
	currency : <fmt:formatNumber value="${num3}" type="currency" groupingUsed="false"/><br>
	currency symbol ₩ : <fmt:formatNumber value="${num3}" type="currency" currencySymbol="₩" />
</body>
</html>