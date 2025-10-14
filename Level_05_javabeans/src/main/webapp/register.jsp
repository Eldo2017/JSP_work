<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="SignBean" class="beans.SignUpBean"/>
<jsp:setProperty name="SignBean" property="*"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 확인</title>
    <style>
        .button-group {
            margin-top: 20px;
            text-align: center;
        }
        .button-group form {
            display: inline;
        }
    </style>
</head>
<body>
    <h2>회원님이 작성한 내용</h2>
    <ul>
        <li>아이디: <jsp:getProperty name="SignBean" property="id" /></li>
        <li>비밀번호: <jsp:getProperty name="SignBean" property="pw" /></li>
        <li>이름: <jsp:getProperty name="SignBean" property="name" /></li>
        <li>생년월일: <jsp:getProperty name="SignBean" property="birth" /></li>
        <li>이메일: <jsp:getProperty name="SignBean" property="email" /></li>
    </ul>

    <div class="button-group">
        <!-- 확인 완료 버튼: 예시로 confirm.jsp로 이동 -->
        <form action="confirm.jsp" method="post">
            <!-- SignBean 데이터를 다시 넘기려면 hidden 필드로 포함 가능 -->
            <input type="hidden" name="id" value="<jsp:getProperty name='SignBean' property='id'/>" />
            <input type="hidden" name="pw" value="<jsp:getProperty name='SignBean' property='pw'/>" />
            <input type="hidden" name="name" value="<jsp:getProperty name='SignBean' property='name'/>" />
            <input type="hidden" name="birth" value="<jsp:getProperty name='SignBean' property='birth'/>" />
            <input type="hidden" name="email" value="<jsp:getProperty name='SignBean' property='email'/>" />
            <input type="submit" value="확인 완료" />
        </form>

        <!-- 다시쓰기 버튼: SignUp.jsp로 이동 -->
        <form action="02.SignUp.jsp" method="get">
            <input type="submit" value="다시쓰기" />
        </form>
    </div>
</body>
</html>