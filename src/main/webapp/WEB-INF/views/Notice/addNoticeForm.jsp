<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 추가</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/addNoticeForm.css" type="text/css">
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
</head>
<body>
	<form name="addNoticeForm" id="addNoticeForm" method="post" action="addNoticeProcess" enctype="multipart/form-data">
		<label for="n_title">공지 제목 : </label><input type="text" name="n_title" id="n_title" maxlength="100"><br>
		<label for="n_contents">공지 내용 : </label><textarea name="n_contents" id="n_contents" rows="5" cols="50"></textarea><br>
		<label for="imgFile">공지 이미지 : </label><input type="file" name="imgFile" id="imgFile"><br>
		<input type="submit" value="공지추가">
	</form>
</body>
</html>