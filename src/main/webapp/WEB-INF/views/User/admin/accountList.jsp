<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원 정보 리스트</title>
  <!-- 공통 CSS -->
  <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/grid.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/superfish.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/camera.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/touchTouch.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ie.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/encyclopedia.css">
  <link rel="stylesheet" href="/CSS/button.css" type="text/css">
  <!-- 페이지 전용 간단 스타일 -->
  <style>
    .white-box {
      background: #ffffff;
      padding: 1.5rem;
      margin: 1.5rem auto;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      max-width: 1200px;
    }
    .white-box h3 {
      margin-top: 0;
      margin-bottom: 1rem;
      font-size: 1.5rem;
      color: #333;
    }
    .api-table {
      width: 100%;
      border-collapse: collapse;
    }
    .api-table th,
    .api-table td {
      padding: 0.75rem;
      border: 1px solid #e0e0e0;
      text-align: left;
      color: #555;
    }
    .api-table th {
      background: #f9f9f9;
    }
    .api-table tr:hover {
      background: #fcfcfc;
    }
    .actions a {
      color: #007bff;
      text-decoration: none;
      margin: 0 0.5rem;
    }
    .actions a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="white-box">
    <h3>회원 정보 리스트</h3>
    <table class="api-table">
      <tr>
        <th>번호</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>닉네임</th>
        <th>주소</th>
        <th>상세주소</th>
        <th>우편번호</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>권한등급</th>
        <th>수정/삭제</th>
      </tr>
      <c:forEach var="dto" items="${list}">
        <tr>
          <td>${dto.user_num}</td>
          <td>${dto.user_id}</td>
          <td>••••••••</td>  <!-- 비밀번호는 가림 처리 권장 -->
          <td>${dto.user_name}</td>
          <td>${dto.user_nickname}</td>
          <td>${dto.roadAddrPart1}</td>
          <td>${dto.addrDetail}</td>
          <td>${dto.zipNo}</td>
          <td>${dto.user_email}</td>
          <td>${dto.user_tel}</td>
          <td>${dto.user_authority}</td>
          <td class="actions">
            <a href="accountUpdate?user_num=${dto.user_num}"><button type="button" class="action-btn">수정</button></a>
            <a href="accountDelete?user_num=${dto.user_num}"><button type="button" class="action-btn">삭제</button></a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
</body>
</html>
