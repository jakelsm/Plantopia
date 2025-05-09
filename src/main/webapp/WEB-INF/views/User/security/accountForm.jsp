<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="/JS/checkForm.js"></script>
</head>
<script>
// 아이디 중복 확인
function checkDuplicateId() {
    const userId = document.getElementById("user_id").value;

    if (!userId) {
        alert("아이디를 입력하세요.");
        return;
    }

    fetch("${pageContext.request.contextPath}/checkUserId?user_id=" + encodeURIComponent(userId))
        .then(response => response.text())
        .then(result => {
            if (result === "EXISTS") {
                alert("이미 사용 중인 아이디입니다.");
            } else {
                alert("사용 가능한 아이디입니다.");
            }
        })
        .catch(error => {
            console.error("중복 확인 중 오류 발생:", error);
            alert("중복 확인 중 오류가 발생했습니다.");
        });
}

//닉네임 중복 확인
function checkDuplicateNickname() {
    const nickname = document.getElementById("user_nickname").value;

    if (!nickname) {
        alert("닉네임을 입력하세요.");
        return;
    }

    fetch("${pageContext.request.contextPath}/checkNickname?user_nickname=" + encodeURIComponent(nickname))
        .then(response => response.text())
        .then(result => {
            if (result === "EXISTS") {
                alert("이미 사용 중인 닉네임입니다.");
            } else {
                alert("사용 가능한 닉네임입니다.");
            }
        })
        .catch(error => {
            console.error("닉네임 중복 확인 오류:", error);
            alert("닉네임 중복 확인 중 오류가 발생했습니다.");
        });
}

//이메일 중복 확인
function checkDuplicateEmail() {
    const email = document.getElementById("user_email").value;

    if (!email) {
        alert("이메일을 입력하세요.");
        return;
    }

    fetch(`${contextPath}/checkEmail?user_email=` + encodeURIComponent(email))
        .then(response => response.text())
        .then(result => {
            if (result === "EXISTS") {
                alert("이미 사용 중인 이메일입니다.");
            } else {
                alert("사용 가능한 이메일입니다.");
            }
        })
        .catch(error => {
            alert("이메일 중복 확인 중 오류가 발생했습니다.");
            console.error(error);
        });
}
</script>
<body>
	<h3>회원가입</h3>
	<form name="member" id="member" method="post" action="accountWrite">
		아이디 : <input type="text" name="user_id" id="user_id">
			    <input type="button" value="중복 확인" onclick="checkDuplicateId()">
				<span id="idCheckResult" style="color:red;"></span><br>
		비밀번호 : <input type="password" name="user_passwd" id="user_passwd"> <br>
		비밀번호 확인 : <input type="password" name="passwdconfirm" id="passwdconfirm"> <br>
		이름 : <input type="text" name="user_name" id="user_name"> <br>
		닉네임 : <input type="text" name="user_nickname" id="user_nickname">
				<input type="button" value="중복 확인" onclick="checkDuplicateNickname()"><br>
		주소 : <input type="text" name="roadAddrPart1" id="roadAddrPart1" size="30" readonly> 
			  <input type="button" value="주소검색" onclick="goPopup()"> <br>
		상세주소 : <input type="text" name="addrDetail" id="addrDetail" readonly> <br>
		우편번호 : <input type="text" name="zipNo" id="zipNo" readonly> <br>
		이메일 : <input type="text" name="user_email" id="user_email">
				<input type="button" value="중복 확인" onclick="checkDuplicateEmail()"><br>
		연락처 : <input type="text" name="user_tel" id="user_tel"> <br>
		<input type="button" value="회원가입" onclick="check()">
		<input type="reset" value="가입취소">
	</form>
</body>
</html>