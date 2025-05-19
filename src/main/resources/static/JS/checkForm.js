function goPopup(){
	var pop = window.open("popup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadAddrPart1, addrDetail, zipNo){
	document.member.roadAddrPart1.value = roadAddrPart1;
	document.member.addrDetail.value = addrDetail;
	document.member.zipNo.value = zipNo;
}

function check(){
	let form = document.member;
	
	if(form.user_id.value == "") {
		alert("아이디를 입력하세요!");
		form.user_id.focus();
		return false;
	}
	
	if(form.user_passwd.value == "") {
		alert("비밀번호를 입력하세요!");
		form.user_passwd.focus();
		return false;
	}
	
	if(form.user_passwd.value.length < 8 || form.user_passwd.value.length > 12) {
		alert("비밀번호는 8자리 이상, 12자리 이하로 입력하세요!");
		form.user_passwd.value = "";
		form.user_passwd.focus();
		return false;
	}
	
	if(form.user_passwd.value != form.passwdconfirm.value) {
		alert("비밀번호가 일치하지 않습니다! 다시 입력해주세요!");
		form.user_passwd.value = "";
		form.passwdconfirm.value = "";
		form.user_passwd.focus();
		return false;
	}
	
	if(form.user_name.value == "") {
		alert("이름을 입력하세요!");
		form.user_name.focus();
		return false;
	}
	
	if(form.user_nickname.value == "") {
		alert("닉네임을 설정해주세요!");
		form.user_nickname.focus();
		return false;
	}
	
	if (form.roadAddrPart1.value === "") {
	    alert("주소를 검색해주세요!");
	    form.roadAddrPart1.focus();
	    return false;
	}

	if (form.addrDetail.value === "") {
	    alert("상세주소를 입력해주세요!");
	    form.addrDetail.focus();
	    return false;
	}

	if (form.zipNo.value === "") {
	    alert("우편번호를 입력해주세요!");
	    form.zipNo.focus();
	    return false;
	}

	if (form.user_email.value === "") {
	    alert("이메일을 입력해주세요!");
	    form.user_email.focus();
	    return false;
	}

	if (form.user_tel.value === "") {
	    alert("전화번호를 입력해주세요!");
	    form.user_tel.focus();
	    return false;
	}
	
	form.submit();
}
