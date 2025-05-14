<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  <link rel="icon" href="/images/favicon.ico">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/form.css">
  <script src="/js/jquery.js"></script>
  <script src="/js/jquery-migrate-1.1.1.js"></script>
  <script src="/js/script.js"></script>
</head>
<body id="top">
  <!-- 헤더 영역 -->
  <header>
    <div class="container_12">
      <div class="grid_12">
        <h1>
          <a href="/"><img src="/img/logo.png" alt="Plantopia 로고"></a>
        </h1>
        <a href="/profile">내 프로필</a>
        <a href="/logout">로그아웃</a>
      </div>
    </div>
    <div class="menu_block">
      <div class="container_12">
        <div class="grid_12">
          <nav class="horizontal-nav full-width horizontalNav-notprocessed">
            <ul class="sf-menu">
              <li class="current"><a href="/">Home</a></li>
              <li><a href="/StoreMain">스토어</a></li>
              <li><a href="/Plant/plantList">플랜트</a></li>
              <li><a href="/Clinic/clinicList">클리닉</a></li>
              <li><a href="/gardenList">백과사전</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </header>

  <!-- 본문 콘텐츠 -->
  <div class="content">
    <div class="container_12">
      <div class="grid_12">
        <h2>Welcome to Plantopia!</h2>

        <c:if test="${not empty loginInfo}">
          <p>✅ <strong>${loginInfo.user_nickname}</strong></p>
        </c:if>
      </div>
    </div>
  </div>

  <!-- 푸터 -->
  <footer>
    <div class="container_12">
      <div class="grid_12">
        <div class="copy">
          &copy; Plantopia 2025 | Template from TemplateMonster
        </div>
      </div>
    </div>
  </footer>
</body>
</html>
