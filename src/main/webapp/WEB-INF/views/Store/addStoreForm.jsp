<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addStoreForm</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/addStoreForm.css" type="text/css">	
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
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