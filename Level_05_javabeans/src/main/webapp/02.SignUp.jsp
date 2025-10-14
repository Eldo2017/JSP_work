<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="signUpScript.js"></script>
<style>
	.form-container {
		background-color:beige;
		width:500px;
		margin: 50px auto;
		padding: 20px;
		border: 2px solid;
	}
	
	.form-container h2 {
		text-align: center;
		background-color:gold;
		border: 2px solid;
		padding: 10px;
	}
	
	.form-group {
		margin-bottom: 15px;
	}
	
	label {
		width: 100px;
		display: inline-block;
	}
	
	input[type="text"], input[type="password"], input[type="email"], input[type="date"] {
		width: 250px;
	}
	
	.button-group {
		text-align: center;
	}
</style>
</head>
<body>
	<div class="form-container">
		<h2>회원 가입</h2>
		<form action="register.jsp" name="SignUpForm" method="post">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="id" >
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="pw" >
			</div>
			<div class="form-group">
				<label>비밀번호 확인</label>
				<input type="password" name="pw_confirm" >
			</div>
			<div class="form-group">
				<label>이름</label>
				<input type="text" name="name" >
			</div>
			<div class="form-group">
				<label>생년월일</label>
				<input type="date" name="birth" >
			</div>
			<div class="form-group">
				<label>이메일</label>
				<input type="email" name="email" >
			</div>
			<div class="button-group">
				<input type="button" value="회원가입" onclick="inputCheck();"/>
				<input type="reset" value="다시쓰기"/>
			</div>
		</form>
	</div>
</body>
</html>