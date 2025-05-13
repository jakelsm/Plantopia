<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
</head>
<body>
  <h2>Welcome to Plantopia!</h2>

  <c:if test="${not empty loginInfo}">
    <p>로그인된 사용자 ID: ${loginInfo.user_id}</p>
    <p>권한: ${loginInfo.user_authority}</p>
  </c:if>

  <!-- 스토어 게시판 이동 -->
  <p>
    <a href="<c:url value='/StoreMain'/>"><button type="button">🛒 스토어 게시판</button></a>
  </p>

  <!-- 플랜트 게시판 이동 -->
  <p>
    <a href="<c:url value='/Plant/plantList'/>"><button type="button">🌱 플랜트 게시판</button></a>
  </p>

  <!-- 플랜트api 게시판 이동 -->
  <p>
    <a href="<c:url value='/gardenList'/>"><button type="button">📖 식물 백과사전</button></a>
  </p>
  
  <!-- 모든 링크에 c:url 을 써서 contextPath 문제를 방지 -->
  <p>
    <a href="<c:url value='/profile'/>"><button type="button">👤 내 프로필</button></a>
  </p>

  <p>
    <a href="<c:url value='/logout'/>"><button type="button">🔒 로그아웃</button></a>
  </p>
</body>
</html>
