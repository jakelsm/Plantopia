<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
	<h2>상품 수정</h2>
	<form name="updateStore" id="updateStore" method="post" action="StoreUpdateProcess" enctype="multipart/form-data">
		<input type="hidden" name="p_idx" value="${store.p_idx}">
		<input type="hidden" name="original_img" value="${store.p_img}">		
			제품명 : <input type="text" name="p_name" value="${store.p_name}"><br>
			제품 가격 : <input type="number" name="p_price" value="${store.p_price}"><br>
			제품 설명 : <textarea name="p_description">${store.p_description}</textarea><br>
			재고 수량 : <input type="number" name="p_stockQuantity" value="${store.p_stockQuantity}"><br>
			제품 이미지 : <input type="file" name="imgFile"><br>
			<input type="submit" value="수정">
	</form>
</body>
</html>