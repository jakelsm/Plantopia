<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	<h2>로그인 성공!</h2>

    <c:if test="${not empty loginInfo}">
        <p>로그인된 사용자 ID: ${loginInfo.user_id}</p>
        <p>권한: ${loginInfo.user_authority}</p>
    </c:if>

    <c:if test="${not empty loginId}">
        <p>로그인된 사용자 ID: ${loginId}</p>
    </c:if>
    
    <!-- 프로필 페이지로 이동하는 버튼 -->
    <p>
      <a href="${pageContext.request.contextPath}/profile">
        프로필 페이지
      </a>
    </p>
    
    <!-- 로그아웃 링크: 클릭 시 /logout 호출 → 시큐리티가 세션 무효화 후 /login으로 이동 -->
    <p><a href="<c:url value='/logout'/>">로그아웃</a></p>
</body>
</html>