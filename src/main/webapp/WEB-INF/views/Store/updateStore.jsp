<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/addStoreForm.css" type="text/css">	
</head>
<body>
	<h2>상품 수정</h2>
	<form name="updateStore" id="updateStore" method="post" action="StoreUpdateProcess" enctype="multipart/form-data">
		<input type="hidden" name="p_idx" value="${store.p_idx}">
		<input type="hidden" name="original_img" value="${store.p_img}">		
			<label for="p_name">제품명 : </label><input type="text" name="p_name" id="p_name" value="${store.p_name}"><br>
			<label for="p_price">제품 가격 : </label><input type="number" name="p_price" id="p_price" value="${store.p_price}"><br>
			<label for="p_description">제품 설명 : </label><textarea name="p_description" id="p_description">${store.p_description}</textarea><br>
			<label for="p_stockQuantity">재고 수량 : </label><input type="number" name="p_stockQuantity" id="p_stockQuantity" value="${store.p_stockQuantity}"><br>
			<label for="imgFile">제품 이미지 : </label><input type="file" name="imgFile" id="imgFile"><br>
			<input type="submit" value="수정">
	</form>
</body>
</html>