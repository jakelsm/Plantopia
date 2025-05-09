<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<h3>게시글 수정</h3>
	<form name="plantUpdate" method="post" action="plantUpdateProc" enctype="multipart/form-data">
		제목 : <input type="text" name="pla_title"> <br>
		내용 : <textarea name="pla_contents" rows="5" cols="40"></textarea> <br>
		<input type="file" name="imgFile">
		<input type="submit" value="수정">
	</form>
</body>
</html>