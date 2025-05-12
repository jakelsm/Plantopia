<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
</head>
<body>
	<h3>게시판 작성</h3>
	<form name="plantForm" method="post" action="/plantWriteProc" enctype="multipart/form-data">
		제목 : <input type="text" name="pla_title"> <br>
		내용 : <textarea name="pla_contents" rows="5" cols="40"></textarea> <br>
		<input type="file" name="imgFile"> <br>
		<p>작성자: ${nickname}</p>
		<input type="submit" value="글 작성">
	</form>
</body>
</html>