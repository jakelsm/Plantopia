<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addStoreForm</title>
</head>
<body>
	<h2>상품 등록</h2>
	<form name="addStoreForm" id="addStoreForm" method="post" action="addProcess" enctype="multipart/form-data">		
			제품명 : <input type="text" name="p_name"><br>
			제품 가격 : <input type="number" name="p_price"><br>
			제품 설명 : <textarea name="p_description"></textarea><br>
			재고 수량 : <input type="number" name="p_stockQuantity"><br>
			제품 이미지 : <input type="file" name="imgFile"><br>
			<input type="submit" value="전송">
	</form>
</body>
</html>