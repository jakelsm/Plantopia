<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판 수정</title>
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="/img/favicon.ico">
<link rel="stylesheet" href="/CSS/addNoticeForm.css" type="text/css">
</head>
<body>
	<form name="updateNoticeForm" id="updateNoticeForm" method="post" action="updateNoticeProcess" enctype="multipart/form-data">
		<input type="hidden" name="n_idx" value="${notice.n_idx}">
		<input type="hidden" name="original_img" value="${notice.n_img}">
			<label for="n_title">공지 제목 : </label><input type="text" name="n_title" id="n_title" maxlength="100" value="${notice.n_title}"><br>
			<label for="n_contents">공지 내용 : </label><textarea name="n_contents" id="n_contents" rows="5" cols="50"></textarea><br>
			현재 이미지: <img src="/img/store/${notice.n_img}" style="width:500px;"><br>
			<label for="imgFile">공지 이미지 : </label><input type="file" name="imgFile" id="imgFile"><br>
		<input type="submit" value="공지 수정">
	</form>
</body>
</html>