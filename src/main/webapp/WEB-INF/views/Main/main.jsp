<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoYz1G+LcOV2e1zF1ikGmF5j5Qe1VVtS3IQfTbtE3MoK7nr"
        crossorigin="anonymous">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
        rel="stylesheet">
  <link rel="icon" href="/img/favicon.ico">
  		<link rel="stylesheet" href="/css/style.css">
  		<link rel="stylesheet" href="/css/form.css">
  		<link rel="stylesheet" href="owl.carousel.css">	
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
		<script src="JS/jquery.js"></script>
		<script src="JS/jquery-migrate-1.1.1.js"></script>
		<script src="JS/script.js"></script>
		<script src="JS/jquery.ui.totop.js"></script>
		<script src="JS/superfish.js"></script>
		<script src="JS/sForm.js"></script>
		<script src="JS/jquery.equalheights.js"></script>
		<script src="JS/jquery.mobilemenu.js"></script>
		<script src="JS/jquery.easing.1.3.js"></script>
		<script src="JS/owl.carousel.js"></script>
		<script>
		$(document).ready(function() {
  		$().UItoTop({ easingType: 'easeOutQuart' });

		  $("#owl").owlCarousel({
		    items: 1,
		    nav: true,
		    navText: ["<", ">"], // 버튼 텍스트 또는 아이콘
		    dots: false,
		    loop: true
		  });
		
		  $("#owl1").owlCarousel({
		    items: 1,
		    nav: true,
		    navText: ["<", ">"], // 버튼 텍스트 또는 아이콘
		    dots: false,
		    loop: true
		  });
		});
		</script>
  <title>메인 페이지</title>
</head>
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

	.store-preview-card:hover {
	  transform: scale(1.03);
	} 
</style>
<body id="top">
  	<%@ include file="/WEB-INF/views/Main/header.jsp" %>
 	 <!-- 본문 콘텐츠 -->
  <div class="content" style="padding-top: 50px;"><div class="ic">Plantopia!</div>
  		<div class="container_12">
			<div class="grid_4">
				<div class="block1">
					<div class="img_block">
						<img src="img/mainpage/planticon.png" alt="" class="img_inner" style="width: 222px;">
						<span class="l"></span>
						<span class="ll"></span>
						<span class="r"></span>
						<span class="rr"></span>
						<span class="lb"></span>
						<span class="llb"></span>
						<span class="rb"></span>
						<span class="rrb"></span>
					</div>
					<div class="text1">다른 식물 집사들과 소통해보세요!</div><br>
						<a href="/Plant/plantList" class="btn">more</a>
					</div>
				</div>
				<div class="grid_4">
					<div class="block1">
						<div class="img_block">
							<img src="img/mainpage/clinicicon.png" alt="" class="img_inner" style="width: 222px;">
							<span class="l"></span>
							<span class="ll"></span>
							<span class="r"></span>
							<span class="rr"></span>
							<span class="lb"></span>
							<span class="llb"></span>
							<span class="rb"></span>
							<span class="rrb"></span>
						</div>
						<div class="text1">시들시들한 식물도 다시 푸르게!</div><br>
						<a href="/Clinic/clinicList" class="btn">more</a>
					</div>
				</div>
				<div class="grid_4">
					<div class="block1">
						<div class="img_block">
							<img src="img/mainpage/storeicon.png" alt="" class="img_inner" style="width: 222px;">
							<span class="l"></span>
							<span class="ll"></span>
							<span class="r"></span>
							<span class="rr"></span>
							<span class="lb"></span>
							<span class="llb"></span>
							<span class="rb"></span>
							<span class="rrb"></span>
						</div>
						<div class="text1">반려식물, 여기서 바로 데려가세요!</div><br>
						<a href="/StoreMain" class="btn">more</a>
					</div>			
				</div>
				<div class="grid_4" style="padding-top: 50px; padding-bottom: 50px;">
				<div class="block1">
					<div class="img_block">
						<img src="img/mainpage/apiicon.png" alt="" class="img_inner" style="width: 222px;">
						<span class="l"></span>
						<span class="ll"></span>
						<span class="r"></span>
						<span class="rr"></span>
						<span class="lb"></span>
						<span class="llb"></span>
						<span class="rb"></span>
						<span class="rrb"></span>
					</div>
					<div class="text1">궁금한 식물 정보, 여기서 검색해보세요!</div><br>
						<a href="/gardenList" class="btn">more</a>
					</div>
				</div>
				<div class="clear"></div>	
				<hr>			
			</div>	
    <div class="container_12">
      <div class="grid_12">
      <!-- 인기글 영역 시작 -->
		  <div class="container_12 popular-section">
		  	<h2>🏆 인기 글 순위</h2>
		  	<!-- 1~4위 (왼쪽 6칸) -->
		    <div class="grid_6" style="padding-bottom: 50px;">
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
		    <div class="grid_6" style="padding-bottom: 50px;">
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
		
		<!-- 공지사항 시작 -->  
		
		<div class="container_12"> 
			<div class="grid_12" style="padding-bottom: 50px;">
			<hr>
			<h2><a href="NoticeMain">📢 공지사항</a></h2>
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
			<hr>
  		</div>
  		
        <!-- Store 게시판 미리보기 영역 -->
		<div class="container_12">
			<div class="grid_12" style="padding-bottom: 50px;">
			<h2>인기 상품 미리보기</h2>
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
			  <hr>
		</div>
		
		<!-- 회사소개 -->
		<div id="owl" class="owl-carousel owl-theme">		
		   <div class="company-section">
		    <div class="company-img">
     		 	<img src="/img/hands.jpg" alt="회사 이미지">
   			</div>	  
		    <div class="company-text">
		      <h2>Plantopia 소개</h2>
		      <div class="company-textsize">
		        Plantopia는 식물(Plant)과 유토피아(Utopia)의 결합으로, 식물이 주는 이상적인 삶을 제안하는 반려식물 플랫폼입니다.<br>
		        우리는 도심 속에서도 누구나 식물을 쉽고 즐겁게 기를 수 있도록, 지식과 일상을 함께 나눕니다.<br>
		        Plantopia는 초보자부터 전문가까지 모두를 위한 식물 동반자입니다.
		      </div>
		    </div>
		    </div>		 
		</div>
	</div>
	</div>
	</div>
	
	<!-- 아래쪽 영역 시작 -->
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
 	                  <img src="/img/store_interior.png" alt="Inside Plantopia Store" class="img_inner">
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

   <%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>
