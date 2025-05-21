<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 댓글 수정 폼 페이지</title>
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
<style>
	body {
	 font-family: 'Noto Sans KR'; padding: 20px; 
	 }
	textarea {
	 width: 100%; height: 100px; 
	 }
</style>
</head>
<body>
	<form name="commentUpdateForm" id="commentUpdateForm" method="post" action="${pageContext.request.contextPath}/CommentUpdateProcess">
		<input type="hidden" name="scom_idx" value="${comment.scom_idx}">
		<input type="hidden" name="p_idx" value="${p_idx}">
		작성자 : ${user_nickname}<br>
		후기 내용 : <textarea name="scom_contents" maxlength="200"></textarea> <br>
		<input type="submit" value="후기 수정">		
	</form>
</body>
</html>