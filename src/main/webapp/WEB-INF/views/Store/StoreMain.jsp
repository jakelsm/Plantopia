<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StoreMain</title>
</head>
<style>
	.container {
		display : grid;
		grid-template-columns: repeat(4, 1fr);
		gap : 20px;
		padding : 20px;
	}
	
	img {
		width : 250px;
		height : 250px;
		object-fit : cover;
	}
	
	.store-item {
		padding : 10px;
		text-align : center;
	}
	
	.ctn {
		text-align : center;
	}
	
	.pagination {
		text-align : center;
	}
	
	.right {
		text-align : right;
	}
</style>
<body id="top">
	 <%@ include file="/WEB-INF/views/Main/header.jsp" %> 
	 <div class="content">
    	<div class="container_12">
      	<div class="grid_12">
			<form name="StoreMain" id="StoreMain" method="post" action="/addStore">
			<h2>Plantopia 쇼핑몰</h2>
			<div class="right">
				<p><strong>${sessionScope.user_nickname}님</strong></p>
				<a href="getCartList?user_num=${sessionScope.user_num}">장바구니</a>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
 					<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
				</svg>
			</div>		
			<div class="container">
			<c:forEach var="dto" items="${lists}">	
			<div class="store-item">
				<img src="/img/store/${dto.p_img}" alt="${dto.p_name}" />
				<h4><a href="StoreDetail?p_idx=${dto.p_idx}">${dto.p_name}</a></h4>
				<p>${dto.p_price}</p>
				<c:if test="${userAuthority eq 'admin'}">
					<a href="StoreUpdate?p_idx=${dto.p_idx}">수정</a>
					<a href="StoreDelete?p_idx=${dto.p_idx}">삭제</a>
				</c:if>
			</div>	
			</c:forEach>
			</div>
			<c:if test="${userAuthority eq 'admin'}">
				<input type="submit" value="제품추가">
			</c:if>
			</form>
			<form name="StoreSearch" id="StoreSearch" method="get" action="/StoreSearch">
				<div class="ctn">
					<input type="text" name="keyword" placeholder="제품명을 입력하세요">
					<input type="submit" value="검색">
				</div>
			</form>
			<div class="pagination">
			<c:forEach var="i" begin="1" end="${totalPage}">
				<a href="/StoreMain?page=${i}">${i}</a>
			</c:forEach>
			</div>
	 	</div>
    	</div>
  	</div>
	<%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>