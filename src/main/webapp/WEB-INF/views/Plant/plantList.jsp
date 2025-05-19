<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려식물 자랑 게시판</title>
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
  <%@ include file="/WEB-INF/views/Main/header.jsp" %>
	<div class="content">
	 <div class="container_12">
		 <div class="grid_12">
			<h3>반려식물 자랑 게시판</h3>
		 </div>
		 <div class="clear cl1"></div>
		 <div class="gallery">
		 	<div class="grid_12">
				<p>🌿 우리 집 반려식물, 함께 자랑해요! <br>
				예쁘게 자란 몬스테라, 새 잎이 돋아난 고무나무, 귀여운 다육이까지!
				키우고 있는 반려식물을 자랑하고, 서로의 식물 키우는 팁도 공유해보세요.
				사진 한 장, 짧은 한 줄 소개도 좋아요 :)
				여러분의 반려식물 이야기를 기다립니다.</p>
			</div>
			<div class="clear"></div>
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
		      <div class="title"><a href="<c:url value='/Plant/plantDetail?pla_idx=${dto.pla_idx}'/>">${dto.pla_title}</a></div>
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
		</div>
		
		<div class="bottom_block">
		  <div class="clear cl1"></div>
			<div class="ctn">		
				<form action="/Plant/plantList" method="get">
				    <input type="text" name="search" value="${search}" placeholder="제목을 입력하세요.">
				    <input type="submit" value="검색">
				</form>
			</div>
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
  <%@ include file="/WEB-INF/views/Main/footer.jsp" %>	
</body>
</html>