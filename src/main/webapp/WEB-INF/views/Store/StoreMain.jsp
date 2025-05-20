<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StoreMain</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="/CSS/storeMain.css" type="text/css">
<link rel="icon" href="/img/favicon.ico" type="image/x-icon">
<script>

</script>	
</head>
<style>

</style>
<body>
	 <%@ include file="/WEB-INF/views/Main/header.jsp" %> 
	 <div class="content">
    	<div class="container_12">
      	<div class="grid_12">
			<form name="StoreMain" id="StoreMain" method="post" action="/addStore">
			<div class="right" style="padding-top:50px;">
				<p>
					<button type="button" class="action-btn" onclick="location.href='getCartList?user_num=${sessionScope.user_num}'">
					<i class="bi bi-cart"></i>장바구니</button>
				</p>				
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
					<a href="StoreUpdate?p_idx=${dto.p_idx}"><button type="button" class="action-btn">수정</button></a>			
					<a href="StoreDelete?p_idx=${dto.p_idx}"><button type="button" class="action-btn">삭제</button></a>
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
  		<img src="/img/teamlogo1.png" style="width:150px; height:150px;">
  		<div class="bottom-box">
  			<p><span class="bottom-text1"><i class="bi bi-exclamation-circle-fill"></i> 반품 배송비, 반품 배송주소 등은 해당 상품 페이지 내 안내를 참고해주세요.</span></p>
  			<p><span style="font-size:14px;">주식회사 플랜토피아 농업회사법인 플랜토피아 인증</span> |<span class="bottom-text1"><a href="#">판매자 상세정보 확인 </a></span>|
  			<span style="font-size : 12px; font-weight:bold;"><a href="https://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EA%B0%9C%EC%9D%B8%EC%A0%95%EB%B3%B4%20%EB%B3%B4%ED%98%B8%EB%B2%95/%EC%A0%9C30%EC%A1%B0"> 판매자 개인정보 처리방침 </a></span></p>
			   <a href="https://www.facebook.com/plantopia" target="_blank"><i class="bi bi-facebook"></i> Facebook |</a>
			   <a href="https://www.instagram.com/plantopia" target="_blank"><i class="bi bi-instagram"></i> Instagram |</a>
			   <a href="https://www.twitter.com/plantopia" target="_blank"><i class="bi bi-twitter"></i> Twitter</a>
  		</div>
  </div>
</div>
	
	<%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>