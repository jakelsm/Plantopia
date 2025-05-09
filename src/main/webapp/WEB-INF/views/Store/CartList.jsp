<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 리스트</title>
</head>
<body>
	<a href="StoreMain">메인목록으로</a>
	<c:forEach var="cart" items="${cartList}">
		<div>
			<img src="/img/store/${cart.cimg}" width="150px">
			제품명 : ${cart.pname} <br>
			가격 : ${cart.cprice} <br>
			수량 : ${cart.c_amount} <br>
			<a href="CartDelete?c_idx=${cart.c_idx}&user_num=${cart.user_num}">삭제</a>
			<a href="CartUpdate?c_idx=${cart.c_idx}&user_num=${cart.user_num}">수정</a>
			<hr>
		</div>
	</c:forEach>
</body>
</html>