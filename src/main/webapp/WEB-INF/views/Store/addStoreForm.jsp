<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addStoreForm</title>
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
	<h2>상품 등록</h2>
	<form name="addStoreForm" id="addStoreForm" method="post" action="addProcess" enctype="multipart/form-data">		
			<label for="p_name">제품명 : </label><input type="text" name="p_name" id="p_name" placeholder="제품명을 입력하세요"><br>
			<label for="p_price">제품 가격 : </label><input type="number" name="p_price" id="p_price" placeholder="제품가격을 입력하세요"><br>
			<label for="p_description">제품 설명 : </label><textarea name="p_description" id="p_description" placeholder="제품설명을 입력하세요"></textarea><br>
			<label for="p_stockQuantity">재고 수량 : </label><input type="number" name="p_stockQuantity"><br>
			<label for="imgFile">제품 이미지 : </label><input type="file" name="imgFile" id="imgFile"><br>
			<input type="submit" value="전송">
	</form>
</body>
</html>