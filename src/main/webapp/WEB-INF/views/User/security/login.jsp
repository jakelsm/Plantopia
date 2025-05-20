<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
   <link rel="icon" href="/img/favicon.ico">
  <title>로그인</title>
  <!-- 외부 CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
  <!-- jQuery (아임포트 등에서 필요하다면) -->
  <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <!-- 로그인 전용 JS -->
  <script src="${pageContext.request.contextPath}/js/auth.js"></script>

  <!-- 배경 및 환영문구 스타일 -->
  <style>
    /* 전체 배경에 블러 처리된 자연 이미지 */
    body {
      margin: 0;
      padding: 0;
      position: relative;
      min-height: 100vh;
      overflow: hidden;
    }
    .bg-blur {
      position: fixed;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background: url('${pageContext.request.contextPath}/img/nature.png') no-repeat center center;
      background-size: cover;
      filter: blur(8px);
      z-index: -1;
    }
    /* 로그인 박스 위에 내용이 잘 보이도록 */
    .form-wrapper {
      position: relative;
      z-index: 1;
      background: rgba(255,255,255,0.85);
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }
    .form-wrapper h2 {
      margin-top: 0;
      color: #2a5d3b;
      text-align: center;
      font-size: 1.5rem;
    }
    .form-wrapper p.welcome-desc {
      text-align: center;
      color: #555;
      margin-bottom: 1.5rem;
    }
  </style>
</head>
<body>
  <!-- 블러 처리된 배경 이미지 -->
  <div class="bg-blur"></div>

  <div id="container" class="container sign-in">
    <div class="row">
      <div class="col align-items-center flex-col sign-in">
        <div class="form-wrapper">
          <!-- 환영 문구 -->
          <h2>Plantopia에 오신 것을 환영합니다</h2>
          <p class="welcome-desc">로그인 후 사이트를 이용하실 수 있습니다.</p>

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
