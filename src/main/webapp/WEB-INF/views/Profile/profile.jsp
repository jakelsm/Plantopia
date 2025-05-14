<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필</title>
</head>
<body>
  <fieldset>
    <legend>내 프로필</legend>
    <table width="500">
      <tr><th>닉네임</th><td>${profile.userNickname}</td></tr>
      <tr><th>이메일</th><td>${profile.userEmail}</td></tr>
    </table>
  </fieldset>

  <p>
    <a href="accountUpdate?user_num=${profile.user_num}">회원정보수정</a> /
    <a href="accountDelete?user_num=${profile.user_num}">회원탈퇴</a>
  </p>

  <!-- 내가 작성한 Plant 글 목록 -->
  <fieldset>
    <legend>내가 작성한 식물 게시판 글</legend>
    <c:if test="${empty myPosts}">
      <p>아직 작성하신 글이 없습니다.</p>
    </c:if>
    <c:if test="${not empty myPosts}">
      <table border="1" width="600">
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성일</th>
        </tr>
        <c:forEach var="post" items="${myPosts}">
          <tr>
            <td>${post.pla_idx}</td>
            <td>
              <a href="${pageContext.request.contextPath}/Plant/plantDetail?pla_idx=${post.pla_idx}">
                ${post.pla_title}
              </a>
            </td>
            <td>${post.pla_date}</td>
          </tr>
        </c:forEach>
      </table>
    </c:if>
  </fieldset>
  
  <!-- Clinic 게시판 내가 쓴 글 목록 -->
  <fieldset>
    <legend>내가 쓴 Plant Clinic 글</legend>
    <c:if test="${not empty clinicList}">
      <table border="1" width="100%">
        <tr><th>번호</th><th>제목</th><th>작성일</th></tr>
        <c:forEach var="dto" items="${clinicList}">
          <tr>
            <td>${dto.plc_idx}</td>
            <td>
              <a href="<c:url value='/Clinic/clinicDetail?plc_idx=${dto.plc_idx}'/>">
                ${dto.plc_title}
              </a>
            </td>
            <td>${dto.plc_date}</td>
          </tr>
        </c:forEach>
      </table>
    </c:if>
    <c:if test="${empty clinicList}">
      <p>작성한 글이 없습니다.</p>
    </c:if>
  </fieldset>

  <p><a href="${pageContext.request.contextPath}/Main"><button type="button">⬅️ 메인으로 돌아가기</button></a></p>
  <p><a href="<c:url value='/logout'/>"><button type="button">🚪 로그아웃</button></a></p>
</body>
</html>
