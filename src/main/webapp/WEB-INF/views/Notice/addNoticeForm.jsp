<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 추가</title>
<style>
	body {
	  font-family: 'Noto Sans KR', sans-serif;
	  background-color: #f9f9f9;
	  margin: 0;
	  padding: 0;
	}
	
	form {
	  background-color: #fff;
	  border-radius: 8px;
	  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	  max-width: 600px;
	  margin: 40px auto;
	  padding: 20px;
	}
	
	form input[type="text"], form input[type="number"], form textarea, form input[type="file"] {
	  width: 100%;
	  padding: 12px;
	  margin: 10px 0;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  box-sizing: border-box;
	  font-size: 16px;
	}
	
	form textarea {
	  resize: vertical;
	  height: 120px;
	}
	
	form input[type="submit"] {
	  background-color: #4CAF50;
	  color: white;
	  padding: 14px 20px;
	  border: none;
	  border-radius: 4px;
	  cursor: pointer;
	  font-size: 16px;
	  width: 100%;
	  margin-top: 10px;
	}
	
	form input[type="submit"]:hover {
	  background-color: #45a049;
	}
	
	form label {
	  font-size: 16px;
	  color: #333;
	  margin-top: 10px;
	  display: block;
	}
</style>
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