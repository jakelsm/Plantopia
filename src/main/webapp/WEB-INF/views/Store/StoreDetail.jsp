<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
	<!-- 웹 아이콘 설정 -->
	<link rel="icon" href="/img/favicon.ico">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="/CSS/storeDetail.css" type="text/css">		
</head>
<body>	
	<div class="container">
		<div class="product-img">		
			<img src="/img/store/${store.p_img}" alt="${store.p_name}" width="600" height="600"/> <br>
		</div>
		<div class="product-detail">
		<div class="right">
			<button type="button" class="action-btn" onclick="location.href='getCartList?user_num=${user_num}'">장바구니<i class="bi bi-cart"></i></button>
		</div>
			<form name="StoreDetail" id="StoreDetail" method="post" action="/addCart">
				<p><label>등록일 : </label><fmt:formatDate value="${store.p_addedDate}" pattern="yyyy-MM-dd HH:mm" /></p>
				<h1>${store.p_name}</h1>
				<div class="price">${store.p_price}원</div>
				<div class="desc"> ${store.p_description}</div>
				<hr>
							
				<input type="hidden" name="c_img" value="${store.p_img}">
				<input type="hidden" name="p_idx" value="${store.p_idx}">								
				<input type="hidden" name="c_price" value="${store.p_price}">
				
				<p><label>재고 수량 : </label>${store.p_stockQuantity}</p>
								
				<p>
					<label>수량 선택:</label>
					<input type="number" name="c_amount" value="1" min="1" max="${store.p_stockQuantity}">
				</p>
				<input type="submit" value="장바구니 담기">
				<c:if test="${userAuthority eq 'admin'}">
					<button type="button" class="action-btn" onclick="location.href='StoreUpdate?p_idx=${store.p_idx}'">수정</button>
					<button type="button" class="action-btn" onclick="location.href='StoreDelete?p_idx=${store.p_idx}'">삭제</button>
				</c:if>	
			</form>
		</div>
	</div>
	<div class="center">
	<a class="back-link" href="StoreMain">목록으로</a>
			
	<hr>
	</div>
	
	<!-- 후기  -->

	<h3 class="center">상품후기</h3>
	<div class="comment-section">
	<form class="comment-form" name="StoreComment" id="StoreComment" method="post" action="/addCommentProcess?p_idx=${store.p_idx}">
		<input type="hidden" name="p_idx" value="${store.p_idx}">		
			<c:if test="${not empty user_nickname}">
				<p><i class="bi bi-person-circle fs-4"></i> ${user_nickname}</p>				
			</c:if>
			후기입력 : <br>
			<textarea name="scom_contents" maxlength="200"></textarea><br>
		<input type="submit" value="후기등록">	
	</form>
	
	<c:forEach var="comment" items="${commentList}">
	<div class="comment-box">
		<p>닉네임 : ${comment.user_nickname}</p>
		<p>후기내용 : ${comment.scom_contents}</p>
		<c:if test="${user_num == comment.user_num || userAuthority == 'admin'}">
    		<button type="button" class="action-btn" onclick="window.open('CommentUpdate?scom_idx=${comment.scom_idx}&p_idx=${store.p_idx}','후기수정',
                            'width=500,height=400,top=200,left=300,resizable=no,scrollbars=yes');">수정</button>
    		<button type="button" class="action-btn" onclick="location.href='CommentDelete?scom_idx=${comment.scom_idx}&p_idx=${store.p_idx}'">삭제</button>
		</c:if>
		</div>
	</c:forEach>
	</div>
</body>
</html>