<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
</head>
<style>
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
	 
</style>
<body id="top">
  <%@ include file="/WEB-INF/views/Main/header.jsp" %>
  <!-- 본문 콘텐츠 -->
  <div class="content">
    <div class="container_12">
      <div class="grid_12">
        <!-- 인기글 영역 시작 -->
		  <div class="container_12 popular-section">
		  	<h2 class="black">인기 글 순위</h2>
		  	<!-- 1~4위 (왼쪽 6칸) -->
		    <div class="grid_6">
		      <ol>
		        <c:forEach var="post" items="${popularList}" begin="0" end="3" varStatus="vs">
		          <li>
		          	<div class="word">
			            ${vs.index+1}. 
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
			<h2 class="black">인기 상품 미리보기</h2>
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
	</div>
	</div>
	</div>
   <%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>
