<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
</head>
<body>
	<form>
		이미지 : <img src="/img/store/${store.p_img}" alt="${store.p_name}" width="600" height="600"/> <br>
		제품명 : ${store.p_name} <br> 
		제품 설명 : ${store.p_description} <br>
		제품 가격 : ${store.p_price} <br>
		제품 수량 : ${store.p_stockQuantity} <br>
		등록된 시간 : ${store.p_addedDate} <br>
	</form>
	<a href="StoreMain">목록</a><br>	
	<h3>후기</h3>
	<form name="StoreComment" id="StoreComment" method="post" action="/addCommentProcess?p_idx=${store.p_idx}">
		<input type="hidden" name="p_idx" value="${store.p_idx}">
		
			후기 : <textarea name="scom_contents"> </textarea><br>
		<input type="submit" value="후기등록">	
	</form>
	<c:forEach var="comment" items="${commentList}">
		<p>후기내용 : ${comment.scom_contents}</p>
		<a href="CommentUpdate?scom_idx=${comment.scom_idx}&p_idx=${store.p_idx}">수정</a>
		<a href="CommentDelete?scom_idx=${comment.scom_idx}&p_idx=${store.p_idx}">삭제</a>
	</c:forEach>
</body>
</html>