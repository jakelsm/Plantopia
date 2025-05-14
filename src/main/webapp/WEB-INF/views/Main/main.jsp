<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<style>
	 /* 메달 색상 정의 */
    .medal-1 { color: #FFD700; } /* 골드 */
    .medal-2 { color: #C0C0C0; } /* 실버 */
    .medal-3 { color: #CD7F32; } /* 브론즈 */
    /* 아이콘과 텍스트 간격 */
    .word i {
      margin-right: 4px;
      font-size: 1.2rem;
      vertical-align: middle;
    }
	.letter {
		font-size: 30px;
		color: green;
	}
	.word {
		font-size: 20px;
		color: black;
	}
	
	.wcolor {
		color: black;
	}
	
	.word2 {
		font-size: 20px;
	}
	
	.store-preview-list {
	  display: flex;
	  gap: 20px;
	  flex-wrap: wrap;
	  margin-top: 20px;
	}

	.store-preview-card {
	  	flex: 1 1 calc(25% - 20px); /* 한 줄에 4개 */
  		max-width: calc(25% - 20px);
  		box-sizing: border-box;
  		padding: 3px;
  		border: 1px solid #ccc;
  		text-align: center;
  		border-radius: 8px;
  		background: #fff;
	}
	
	.store-preview-card h3 {
	  font-size: 14px;
	  margin: 4px 0;
	}

	.store-preview-card p {
	  font-size: 13px;
	  margin: 2px 0;
	}

	.store-thumb {
	  width: 100%;
	  height: 180px;
	  object-fit: cover;	
	}
	
	 .black {
	 	color : black;
	 }
	 
	 .company-section {
	  display: flex;
	  gap: 30px;
	  margin: 50px auto;
	  max-width: 1000px;
	  align-items: center;
	  padding: 20px;
	  background-color: #fff;
	  border-radius: 8px;
	}
	
	.company-img img {
	  width: 500px;
	  height: auto;
	  border-radius: 8px;
	  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
	}
	
	.company-text {
	  flex: 1;
	  font-size: 16px;
	  line-height: 1.8;
	  color: #333;
	}
	
	.company-textsize ::first-letter {
		margin-right: 10px;
		  font-size: xx-large;
		  font-weight: bold;
		  float: left;
	}
	 
</style>
<body id="top">
  <%@ include file="/WEB-INF/views/Main/header.jsp" %>
  <!-- 본문 콘텐츠 -->
  <div class="content">
    <div class="container_12">
      <div class="grid_12">
        <!-- 인기글 영역 시작 -->
		  <div class="container_12 popular-section">
		  	<h2 class="black">🏆 인기 글 순위</h2>
		  	<!-- 1~4위 (왼쪽 6칸) -->
		    <div class="grid_6">
		      <ol>
		        <c:forEach var="post" items="${popularList}" begin="0" end="3" varStatus="vs">
		          <li>
		          	<div class="word">
			          	<c:choose>
				            <c:when test="${vs.index == 0}">
				              <i class="bi bi-trophy-fill medal-1"></i>
				            </c:when>
				            <c:when test="${vs.index == 1}">
				              <i class="bi bi-trophy-fill medal-2"></i>
				            </c:when>
				            <c:when test="${vs.index == 2}">
				              <i class="bi bi-trophy-fill medal-3"></i>
				            </c:when>
				        </c:choose>
				        ${vs.index + 1}.
			            <a href="<c:url value='/Plant/plantDetail?pla_idx=${post.pla_idx}'/>">
			              ${post.pla_title}
			            </a>
			            <p></p>
		            </div>
		          </li>
		        </c:forEach>
		      </ol>
		    </div>
		    <!-- 5~8위 (오른쪽 6칸) -->
		    <div class="grid_6">
		      <ol start="5">
		        <c:forEach var="post" items="${popularList}" begin="4" end="7" varStatus="vs">
			      <li>
			      	<div class="word">
				        ${vs.index+1}. <!-- vs.index 는 0~3 이고, 여기에 5를 더하면 5~8 -->
				        <a href="<c:url value='/Plant/plantDetail?pla_idx=${post.pla_idx}'/>">
				          ${post.pla_title}
				        </a>
				        <p></p>
			        </div>
			      </li>
			    </c:forEach>
		      </ol>
		    </div>
		  </div>
		
		<div class="container_12"> 
			<div class="grid_12">
			<h2><a href="NoticeMain" style="color: black;">📢 공지사항</a></h2>
			<ul>
			  <c:forEach var="notice" items="${noticeList}">
			    <li>
			      <div class="word">
			      <a href="/NoticeDetail?n_idx=${notice.n_idx}">${notice.n_title}</a>
			      <span style="font-size: 20px; color: gray;">(${notice.n_date})</span>
			      </div>
			    </li>
			  </c:forEach>
			  <c:if test="${empty noticeList}">
			    <li>등록된 공지사항이 없습니다.</li>
			  </c:if>
			</ul>
			</div>
  		</div>
  		
        <!-- Store 게시판 미리보기 영역 -->
		<div class="container_12">
			<div class="grid_12">
			<h2 class="black">🎁 인기 상품 미리보기</h2>
			   <div class="store-preview-list">
			   		<c:forEach var="store" items="${storeList}" begin="0" end="3">
			        <div class="store-preview-card">
			        	<a href="/StoreDetail?p_idx=${store.p_idx}">	          
			           	<img src="/img/store/${store.p_img}" alt="${store.p_name}" class="store-thumb">
			           	</a>           
			         	<h3>${store.p_name}</h3>
			          	<p>${store.p_price}원</p>
			        </div>
			      	</c:forEach>
			    </div>
			  </div>
		</div>
		
		<!-- 회사 소개 영역 -->
		<div class="container_12">
		  <div class="company-section">
		    <div class="company-img">
		      <img src="/img/hands.jpg" alt="회사 이미지">
		    </div>
		    <div class="company-text">
		      <h2>Plantopia 소개</h2>
		        <div class="company-textsize">Plantopia는 식물(Plant)과 유토피아(Utopia)의 결합으로, 
		        식물이 주는 이상적인 삶을 제안하는 반려식물 플랫폼입니다.<br>
		        우리는 도심 속에서도 누구나 식물을 쉽고 즐겁게 기를 수 있도록, 지식과 일상을 함께 나눕니다. <br>
		        Plantopia는 초보자부터 전문가까지 모두를 위한 식물 동반자입니다. <br>
		      </div>
		    </div>
		  </div>
		</div>      
	</div>
	</div>
	</div>
   <%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>
