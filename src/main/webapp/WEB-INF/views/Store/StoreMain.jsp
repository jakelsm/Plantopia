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
</style>
<body>
	<form name="StoreMain" id="StoreMain" method="post" action="/addStore">
	<h2>Plantopia 쇼핑몰</h2>	
	<div class="container">
	<c:forEach var="dto" items="${lists}">	
	<div class="store-item">
		<img src="/img/store/${dto.p_img}" alt="${dto.p_name}" />
		<h4><a href="StoreDetail?p_idx=${dto.p_idx}">${dto.p_name}</a></h4>
		<p>${dto.p_price}</p>
		<a href="StoreUpdate?p_idx=${dto.p_idx}">수정</a>
		<a href="StoreDelete?p_idx=${dto.p_idx}">삭제</a>
	</div>	
	</c:forEach>
	</div>
	<input type="submit" value="제품추가">
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
</body>
</html>