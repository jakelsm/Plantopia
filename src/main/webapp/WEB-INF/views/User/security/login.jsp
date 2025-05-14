<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <!-- 외부 CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
  <!-- jQuery (아임포트 등에서 필요하다면) -->
  <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <!-- 로그인 전용 JS -->
  <script src="${pageContext.request.contextPath}/js/auth.js"></script>
</head>
<body>
  <div id="container" class="container sign-in">
    <div class="row">
      <div class="col align-items-center flex-col sign-in">
        <div class="form-wrapper">
          <form class="form sign-in"
                method="post"
                action="${pageContext.request.contextPath}/loginProc">
            <h3>로그인</h3>
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text"
                     name="username"
                     placeholder="아이디"
                     required>
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password"
                     name="password"
                     placeholder="비밀번호"
                     required>
            </div>
            <button type="submit">로그인</button>
            <p>
              <b onclick="location.href='${pageContext.request.contextPath}/accountForm'"
                 class="pointer">
                아직 계정이 없으신가요? 회원가입
              </b>
            </p>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
