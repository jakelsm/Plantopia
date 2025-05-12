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
		<input type="hidden" name="pla_idx" value="${plant.pla_idx}" />
	    제목 : <input type="text" name="pla_title" value="${plant.pla_title}" /> <br>
	    내용 : <textarea name="pla_contents" rows="5" cols="40">${plant.pla_contents}</textarea> <br>
	    기존 이미지 : <img src="/img/plant/${plant.pla_img}" width="100" /> <br>
	    <input type="hidden" name="original_img" value="${plant.pla_img}" />
	    새 이미지 : <input type="file" name="imgFile"> <br>
		<input type="submit" value="수정">
	</form>
</body>
</html>