<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 추가</title>
</head>
<body>
	<form name="addNoticeForm" id="addNoticeForm" method="post" action="addNoticeProcess" enctype="multipart/form-data">
		공지 제목 : <input type="text" name="n_title" maxlength="100"><br>
		공지 내용 : <textarea name="n_contents" rows="5" cols="50"></textarea><br>
		공지 이미지 : <input type="file" name="imgFile" ><br>
		<input type="submit" value="공지추가">
	</form>
</body>
</html>