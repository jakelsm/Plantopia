<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판 수정</title>
</head>
<body>
	<form name="updateNoticeForm" id="updateNoticeForm" method="post" action="updateNoticeProcess" enctype="multipart/form-data">
		<input type="hidden" name="n_idx" value="${notice.n_idx}">
		<input type="hidden" name="original_img" value="${notice.n_img}">
			공지 제목 : <input type="text" name="n_title" maxlength="100" value="${notice.n_title}"><br>
			공지 내용 : <textarea name="n_contents" rows="5" cols="50"></textarea><br>
			현재 이미지: <img src="/img/store/${notice.n_img}"><br>
			공지 이미지 : <input type="file" name="imgFile"><br>
		<input type="submit" value="공지 수정">
	</form>
</body>
</html>