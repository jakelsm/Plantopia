<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
</head>
<body>
	<h3>댓글 수정</h3>
	<form action="/Plant/plantList/comment/update" method="post">
	    <input type="hidden" name="placom_idx" value="${param.placom_idx}" />
	    <input type="hidden" name="pla_idx" value="${param.pla_idx}" />
		작성자 :
	    내용 : <textarea name="placom_contents" rows="4" cols="50">${param.placom_contents}</textarea><br>
	    <input type="submit" value="수정 완료" />
	</form>
</body>
</html>