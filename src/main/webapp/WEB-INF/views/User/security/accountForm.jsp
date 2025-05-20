<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="/img/favicon.ico">
<!-- 회원가입 전용 스타일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signup.css">
<!-- JS 토글 (로그인 페이지와 동일한 CSS 애니메이션을 위해 필요) -->
<script src="${pageContext.request.contextPath}/js/signup.js"></script>
<!-- 기존 체크폼 기능 -->
<script src="${pageContext.request.contextPath}/js/checkForm.js"></script>
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
  <div id="container" class="container sign-up">
    <div class="row">
      <div class="col align-items-center flex-col sign-up">
        <div class="form-wrapper">
          <!-- 기존 폼을 그대로 가져오되, 클래스만 추가 -->
          <form class="form sign-up" name="member" id="member" method="post" action="accountWrite">
            <h3>회원가입</h3>
            
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text" name="user_id" id="user_id" placeholder="아이디">
              <button type="button" class="dup-check" onclick="checkDuplicateId()">중복 확인</button>
            </div>

            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" name="user_passwd" id="user_passwd" placeholder="비밀번호">
            </div>
            
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" name="passwdconfirm" id="passwdconfirm" placeholder="비밀번호 확인">
            </div>
            
			<div class="input-group">
              <i class='bx bxs-id-card'></i>
              <input type="text" name="user_name" id="user_name" placeholder="이름">
            </div>
            
            <div class="input-group">
              <i class='bx bxs-id-card'></i>
              <input type="text" name="user_nickname" id="user_nickname" placeholder="닉네임">
              <button type="button" class="dup-check" onclick="checkDuplicateNickname()">중복 확인</button>
            </div>
            
            <div class="input-group">
              <i class='bx bxs-map'></i>
              <input type="text" name="roadAddrPart1" id="roadAddrPart1" placeholder="주소" readonly>
              <button type="button" class="dup-check" onclick="goPopup()">주소검색</button>
            </div>
            
            <div class="input-group">
              <i class='bx bxs-home'></i>
              <input type="text" name="addrDetail" id="addrDetail" placeholder="상세주소" readonly>
            </div>
            
            <div class="input-group">
              <i class='bx bxs-home'></i>
              <input type="text" name="zipNo" id="zipNo" placeholder="우편번호" readonly>
            </div>
            
            <div class="input-group">
              <i class='bx bxs-envelope'></i>
              <input type="email" name="user_email" id="user_email" placeholder="이메일">
              <button type="button" class="dup-check" onclick="checkDuplicateEmail()">중복 확인</button>
            </div>
            
            <div class="input-group">
              <i class='bx bxs-phone'></i>
              <input type="text" name="user_tel" id="user_tel" placeholder="연락처">
            </div>

            <div class="form-buttons">
              <button type="button" onclick="check()">회원가입</button>
              <button type="reset" class="secondary">취소</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>