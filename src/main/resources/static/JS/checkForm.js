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
	
	// if(!form.id.value)
	// if(form.getElementById("id").value=="")
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
		alert("닉네임을 설정헤주세요!");
		form.user_nickname.focus();
		return false;
	}
	
	form.submit();
}