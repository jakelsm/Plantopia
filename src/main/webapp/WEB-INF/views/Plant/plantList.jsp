<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려식물 자랑 게시판</title>
 <link rel="icon" href="/img/favicon.ico">
</head>
<style>
	.ctn {
		text-align : center;
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
	
	.img_block img {
	  height: 400px;
	  object-fit: cover;
	  display: block;
	  margin: 0 auto;
	  border-radius: 8px;
	}
	
</style>
<body>
  <%@ include file="../Main/header.jsp" %>
	<div class="content">
	 <div class="container_12">
		 <div class="grid_12">
			<h3>반려식물 자랑 게시판</h3>
		 </div>
		 <div class="clear cl1"></div>
		 <div class="gallery">
		 	<div class="grid_12">
				<p>🌿 우리 집 반려식물, 함께 자랑해요! <br>
				&nbsp;<br>
				예쁘게 자란 몬스테라, 새 잎이 돋아난 고무나무, 귀여운 다육이까지! <br>
				키우고 있는 반려식물을 자랑하고, 서로의 식물 키우는 팁도 공유해보세요. <br>
				사진 한 장, 짧은 한 줄 소개도 좋아요 :) <br>
				여러분의 반려식물 이야기를 기다립니다.</p>
			</div>
			<div class="clear cl1"></div>
			<c:forEach var="dto" items="${plantList}" varStatus="status">
		     <c:if test="${status.index % 4 == 0 && status.index != 0}">
			    <div class="clear cl2"></div>
			 </c:if>
		     
		     <div class="grid_3"> 
		      <a href="/img/plant/${dto.pla_img}" class="gal">
 					<div class="img_block"> 
						<img src="/img/plant/${dto.pla_img}" alt="" >
					</div>	
			  </a>
		      <div class="title" style="font-size: 18px; font-weight: bold; color: #66cc66;">
		      <a href="<c:url value='/Plant/plantDetail?pla_idx=${dto.pla_idx}'/>">${dto.pla_title}</a></div>
		      <a class="btn">${dto.writer}</a>
			  	<!-- 로그인 상태일 때만 검사 -->
	          	<c:if test="${not empty loginInfo}">
		            <!-- admin 이거나, 내가 쓴 글이면 버튼 보임 -->
		            <c:if test="${loginInfo.user_authority eq 'admin' or loginInfo.user_num eq dto.user_num}">
					  	<a href="<c:url value='/Plant/plantUpdate?pla_idx=${dto.pla_idx}'/>">수정</a> | 
					  	<a href="<c:url value='/Plant/plantdelete?pla_idx=${dto.pla_idx}'/>">삭제</a>
					</c:if>
	          	</c:if>
	          </div>  
			</c:forEach>
			
		  </div>
		
		<div class="clear cl1"></div>
		<div class="grid_10">&nbsp;</div>
		    <div class="grid_2">
			<a href="/Plant/plantWrite">글쓰기</a></div>
			</div>
			
			<div class="clear cl1"></div>
			<div class="ctn">		
				<form action="/Plant/plantList" method="get">
				    <input type="text" name="search" value="${search}" placeholder="제목을 입력하세요.">
				    <input type="submit" value="검색">
				</form>
			
			<div class="clear cl1"></div>
			<!-- 페이징 처리 -->
			<div class="pagination">
			    <c:if test="${currentPage > 1}">
			        <a href="/Plant/plantList?page=${currentPage - 1}&search=${param.search}">이전</a>
			    </c:if>
			    <c:forEach var="i" begin="1" end="${totalPage}">
			        <a href="/Plant/plantList?page=${i}&search=${param.search}" class="${i == currentPage ? 'active' : ''}">${i}</a>
			    </c:forEach>
			    <c:if test="${currentPage < totalPage}">
			        <a href="/Plant/plantList?page=${currentPage + 1}&search=${param.search}">다음</a>
			    </c:if>
			 </div>
		</div>	 
		</div>
		
		<div class="bottom_block">
		  <div class="container_12">
			<!-- Store Location -->
			    <div class="grid_3">
			      <h3>Store Location</h3>
			      <div id="owl1" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
			        <div class="owl-wrapper-outer">
			          <div class="owl-wrapper" style="width: 600px; left: 0px; display: block; transform: translate3d(0px, 0px, 0px);">
			
		<!--  	            <div class="owl-item" style="width: 180px;"> -->
		<!--  	              <div class="item">  -->
		<!-- 	                <div class="img_block ib1"> -->
		<!--  	                  <img src="/img/store_front.png" alt="Plantopia Store Front" class="img_inner"> -->
		<!--  	                </div> -->
		<!--  	              </div> -->
		<!-- 	            </div> -->
			
		 	            <div class="owl-item" style="width: 180px;">
		 	              <div class="item">
		 	                <div class="img_block ib1">
		 	                  <img src="/img/store_inside.png" alt="Inside Plantopia Store" class="img_inner" style="height: 50%;">
		 	                </div>
		 	              </div>
		 	            </div>
			
			          </div>
			        </div>
			      </div>
			      <p>서울특별시 성동구 성수일로 123, 플랜토피아 스토어</p>
			      <p>운영시간: 평일 09:00–18:00</p>
			    </div>
			
			    <!-- Contact Information -->
			    <div class="grid_4 prefix_1">
			      <h3>Contact Information</h3>
			      <p class="col1">
			        전화: 02-1234-5678<br>
			        이메일: support@plantopia.com
			      </p>
			      <p>고객센터 운영시간: 평일 09:00–18:00</p>
			    </div>
			
			    <!-- Follow Us -->
				<div class="grid_4">
				  <h3>Follow Us</h3>
				  <p>Plantopia의 새로운 소식과 이벤트를 SNS에서 만나보세요.</p>
				  <ul class="social-links">
				    <li><a href="https://www.facebook.com/plantopia" target="_blank"><i class="bi bi-facebook"></i> Facebook</a></li>
				    <li><a href="https://www.instagram.com/plantopia" target="_blank"><i class="bi bi-instagram"></i> Instagram</a></li>
				    <li><a href="https://www.twitter.com/plantopia" target="_blank"><i class="bi bi-twitter"></i> Twitter</a></li>
				  </ul>
				</div>
				</div>
			</div>
  <%@ include file="../Main/footer.jsp" %>	
</body>
</html>