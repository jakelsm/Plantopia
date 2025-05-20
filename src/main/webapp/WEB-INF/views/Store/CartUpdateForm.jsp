<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 수정</title>
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="/img/favicon.ico">
</head>
<body>
	<form name="CartUpdateForm" id="CartUpdateForm" method="post" action="CartUpdateProcess">
		<input type="hidden" name="c_idx" value="${cart.c_idx}">
		<input type="hidden" name="user_num" value="${cart.user_num}">
		수량 : <input type="number" name="c_amount" value="${cart.c_amount}" min="1" max="${stock}"> <br>
		<input type="submit" value="수정">
	</form>
</body>
</html>