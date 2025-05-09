<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<script>
      // 페이지 로드 직후
      document.addEventListener('DOMContentLoaded', function() {
        if (window.location.search.includes('error')) {
          alert('아이디 또는 비밀번호가 잘못되었습니다.');
        }
      });
</script>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/loginProc">
        <input type="text" name="username" placeholder="아이디"><br>
        <input type="password" name="password" placeholder="비밀번호"><br>
        <input type="submit" value="로그인">
    </form>
</body>
</html>