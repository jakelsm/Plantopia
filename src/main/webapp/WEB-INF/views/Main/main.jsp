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
    <a href="<c:url value='/StoreMain'/>">스토어 게시판</a>
  </p>

  <!-- 플랜트 게시판 이동 -->
  <p>
    <a href="<c:url value='/Plant/plantList'/>">플랜트 게시판</a>
  </p>

  <!-- 플랜트api 게시판 이동 -->
  <p>
    <a href="<c:url value='/gardenList'/>">식물 백과사전</a>
  </p>
  
  <!-- 모든 링크에 c:url 을 써서 contextPath 문제를 방지 -->
  <p>
    <a href="<c:url value='/profile'/>">프로필 페이지</a>
  </p>

  <p>
    <a href="<c:url value='/logout'/>">로그아웃</a>
  </p>
</body>
</html>
