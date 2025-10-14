function inputCheck() {
	if(SignUpForm.id.value == "") {
		alert("아이디는 필수 요소입니다");
		SignUpForm.id.focus();
		return;
	}
	
	if(SignUpForm.pw.value == "") {
		alert("비밀번호는 필수 요소입니다");
		SignUpForm.pw.focus();
		return;
	}
	
	if(SignUpForm.pw_confirm.value=="") {
		alert("비밀번호를 다시 입력하시오");
		SignUpForm.pw_confirm.focus();
		return;
	}
	
	if(SignUpForm.pw.value != SignUpForm.pw_confirm.value) {
		alert("비밀번호가 일치하지 않습니다");
		SignUpForm.pw_confirm.focus();
		return;
	}
	
	if(SignUpForm.name.value == "") {
		alert("이름은 필수 사항입니다");
		SignUpForm.name.focus();
		return;
	}
	SignUpForm.submit();
}