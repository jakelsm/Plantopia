<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보 수정페이지</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/profile.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/userupdate.css">
  <script src="/JS/checkForm.js"></script>
</head>
<body>
  <div class="form-container">
    <h3>회원정보 수정</h3>
    <form name="member" id="member" method="post" action="accountUpdateOk">
      <input type="hidden" name="user_num" value="${dto.user_num}">

      <div class="form-group">
        <label for="user_id">아이디</label>
        <input type="text" name="user_id" id="user_id" value="${dto.user_id}" readonly>
      </div>

      <div class="form-group">
        <label for="user_passwd">비밀번호</label>
        <input type="password" name="user_passwd" id="user_passwd">
      </div>

      <div class="form-group">
        <label for="passwdconfirm">비밀번호 확인</label>
        <input type="password" name="passwdconfirm" id="passwdconfirm">
      </div>

      <div class="form-group">
        <label for="user_name">이름</label>
        <input type="text" name="user_name" id="user_name" value="${dto.user_name}" readonly>
      </div>

      <div class="form-group">
        <label for="user_nickname">닉네임</label>
        <input type="text" name="user_nickname" id="user_nickname" value="${dto.user_nickname}">
      </div>

      <div class="form-group">
        <label for="roadAddrPart1">주소</label>
        <input type="text" name="roadAddrPart1" id="roadAddrPart1" size="30" value="${dto.roadAddrPart1}" readonly>
        <input type="button" value="주소검색" onclick="goPopup();">
      </div>

      <div class="form-group">
        <label for="addrDetail">상세주소</label>
        <input type="text" name="addrDetail" id="addrDetail" value="${dto.addrDetail}" readonly>
      </div>

      <div class="form-group">
        <label for="zipNo">우편번호</label>
        <input type="text" name="zipNo" id="zipNo" value="${dto.zipNo}" readonly>
      </div>

      <div class="form-group">
        <label for="user_email">이메일</label>
        <input type="text" name="user_email" id="user_email" value="${dto.user_email}">
      </div>

      <div class="form-group">
        <label for="user_tel">연락처</label>
        <input type="text" name="user_tel" id="user_tel" value="${dto.user_tel}">
      </div>

      <div class="button-group">
        <input type="button" class="btn btn-primary" value="회원정보수정" onclick="check()">
        <input type="button" class="btn btn-secondary" value="수정취소" onclick="history.back()">
      </div>
    </form>
  </div>
</body>
</html>
