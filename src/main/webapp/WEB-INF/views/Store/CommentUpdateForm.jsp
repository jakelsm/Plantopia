<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 댓글 수정 폼 페이지</title>
</head>
<body>
	<form name="commentUpdateForm" id="commentUpdateForm" method="post" action="CommentUpdateProcess">
		<input type="hidden" name="scom_idx" value="${comment.scom_idx}">
		<input type="hidden" name="p_idx" value="${p_idx}">
		작성자 : <br>
		후기 내용 : <textarea name="scom_contents"></textarea> <br>
		<input type="submit" value="후기 수정">		
	</form>
</body>
</html>