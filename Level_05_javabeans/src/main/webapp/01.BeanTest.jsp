<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myBean01" class="beans.BeanTest01"/>
<jsp:setProperty name="myBean01" property="name" value="자바빈 사용"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	자바빈즈에 들어간 이름 : <jsp:getProperty property="name" name="myBean01"/>
</body>
</html>