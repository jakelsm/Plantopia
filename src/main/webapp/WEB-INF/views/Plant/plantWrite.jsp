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
	<form name="plantForm" method="post" action="plantWriteProc">
		제목 : <input type="text" name="plaTitle"> <br>
		내용 : <textarea name="plaContents" rows="5" cols="40"></textarea> <br>
		<input type="submit" value="글 작성">
	</form>
</body>
</html>