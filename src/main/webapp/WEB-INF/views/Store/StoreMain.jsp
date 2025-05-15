<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StoreMain</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<style>
	body {
	  background-color: #f6f6f6;
	  font-family: 'Noto Sans KR', sans-serif;
	}	
	
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
	
	.store-item .name {
		font-size: 15px;
		color: #c0c0c0;
	}
		
	.store-item .price {
		font-size: 20px;
	    font-weight: bold;
	    color: #696969;
	}
		
	.store-item:hover {
	  transform: scale(1.03);
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
	
	.pagination {
		text-align: center;
 		margin: 30px 0 10px 0;
	}
	
	.pagination a {
	    display: inline-block;
	    margin: 0 5px;
	    padding: 6px 12px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	    background-color: #f9f9f9;
	    text-decoration: none;
	    color: #333;
 	 }
 	
 	.pagination a:hover {
    	background-color: #e0e0e0;
  	}
  	
  	.pagination a.active {
	  background-color: #4CAF50;
	  color: white;
	  font-weight: bold;
	}
	
	input[type="text"], input[type="submit"] {
	  padding: 8px 12px;
	  margin: 10px 5px;
	  border-radius: 5px;
	  border: 1px solid #ccc;
	}
	input[type="submit"] {
	  background-color: #4CAF50;
	  color: white;
	  font-weight: bold;
	  cursor: pointer;
	}
	input[type="submit"]:hover {
	  background-color: #45a049;
	}
		
</style>
<body id="top">
	 <%@ include file="/WEB-INF/views/Main/header.jsp" %> 
	 <div class="content">
    	<div class="container_12">
      	<div class="grid_12">
			<form name="StoreMain" id="StoreMain" method="post" action="/addStore">
			<div class="right">
				<p>🌱<strong>${sessionScope.user_nickname}님</strong></p>
				<a href="getCartList?user_num=${sessionScope.user_num}">장바구니<i class="bi bi-cart"></i></a>
			</div>		
			<div class="container">
			<c:forEach var="dto" items="${lists}">	
			<div class="store-item">
				<a href="StoreDetail?p_idx=${dto.p_idx}">
				<img src="/img/store/${dto.p_img}" alt="${dto.p_name}" />
				</a>
				<div class="name"><h4><a href="StoreDetail?p_idx=${dto.p_idx}">${dto.p_name}</a></h4></div>
				<span class="price"><p>${dto.p_price}원</p></span>
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
  	
  	<!-- 아래쪽 영역 시작 -->
	<div class="bottom_block">
  	<div class="container_12">
 
  </div>
</div>
	
	<%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>