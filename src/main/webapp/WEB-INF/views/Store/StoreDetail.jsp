<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
</head>
<style>
	.container {
		display : flex;
		align-items : flex-start;
		gap : 30px;
		margin-bottom : 30px;
	}
	
	.product {
		font-size : 16px;
		line-height : 1.6;
	}
</style>
<body>
	<a href="getCartList?user_num=1">장바구니</a> <!-- ${sessionScope.user_num} -->	
	<div class="container">
		<div>
			<img src="/img/store/${store.p_img}" alt="${store.p_name}" width="600" height="600"/> <br>
		</div>
		<div class="product">
			<form name="StoreDetail" id="StoreDetail" method="post" action="/addCart">
				제품명 : ${store.p_name} <br> 
				제품 설명 : ${store.p_description} <br>
				제품 가격 : ${store.p_price} <br>
				제품 수량 : ${store.p_stockQuantity} <br>
				등록된 시간 : ${store.p_addedDate} <br>		
				<input type="hidden" name="cimg" value="${store.p_img}">
				<input type="hidden" name="p_idx" value="${store.p_idx}">				
				<input type="hidden" name="user_num" value="${sessionScope.user_num}">
				<input type="hidden" name="c_price" value="${store.p_price}">
				수량 선택 : <input type="number" name="c_amount" value="1" min="1" max="${store.p_stockQuantity}"><br>
				<input type="submit" value="장바구니 담기">		
			</form>
		</div>
	</div>
	<a href="StoreMain">목록</a><br>	
	<hr>
	<h3>후기</h3>
	<form name="StoreComment" id="StoreComment" method="post" action="/addCommentProcess?p_idx=${store.p_idx}">
		<input type="hidden" name="p_idx" value="${store.p_idx}">
		 <input type="hidden" name="user_num" value="${sessionScope.user_num}">
			<p> 닉네임 : ${sessionScope.user_nickname}</p>
			후기입력 : <textarea name="scom_contents"></textarea><br>
		<input type="submit" value="후기등록">	
	</form>
	<c:forEach var="comment" items="${commentList}">
	<input type="hidden" name="user_num" value="${comment.user_num}">
	<hr>
		<p>닉네임 : ${comment.user_nickname}</p>
		<p>후기내용 : ${comment.scom_contents}</p>
		<a href="CommentUpdate?scom_idx=${comment.scom_idx}&p_idx=${store.p_idx}">수정</a>
		<a href="CommentDelete?scom_idx=${comment.scom_idx}&p_idx=${store.p_idx}">삭제</a>
	</c:forEach>
</body>
</html>