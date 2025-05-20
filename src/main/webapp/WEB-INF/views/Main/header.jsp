<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
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
  	<style>
	  	body {
	    	font-family: 'Noto Sans KR', sans-serif;
		}
	
		h1, h2, h3, h4, h5, h6 {
		    font-family: 'Noto Sans KR', sans-serif;
		}
	  	.header-right{
	  		text-align : right;
	  	}
		
		.logo-img {
 			display: flex;
  			justify-content: center;
		}
		
		.color-white {
			color: #E9E9E9;
			font-weight: bold;
		}	
  </style>
</head>
<body>
 <header>
		<div class="container_12">
			<div class="grid_12">
				<div class="header-right">
					<c:if test="${loginInfo.user_authority eq 'admin' or loginInfo.user_num eq dto.user_num}">
					  	<a href="accountList" class="color-white">관리자용 페이지</a> | 
					</c:if>
			        <a href="/profile" class="color-white"><i class="bi bi-person-circle fs-4"></i> <strong>${sessionScope.user_nickname}님</strong></a> | 
			        <a href="/getCartList?user_num=${sessionScope.user_num}" class="color-white">장바구니</a> | 
			        <a href="/logout" class="color-white">로그아웃</a>
      		  	</div>         
				<span class="logo-img">
					<a href="/Main"><img src="/img/newlogo.png" alt="Plantopia 로고" style="width: 300px"></a>
				</span>
			</div>
		</div>
		<div class="clear"></div>
		<div class="menu_block">
			<div class="container_12">
				<div class="grid_12">
					<nav class="horizontal-nav full-width horizontalNav-notprocessed">
						<ul class="sf-menu">
							<li><a href="/Main">Home</a></li>
							<li><a href="/Plant/plantList">반려식물자랑</a></li>
				             <li><a href="/Clinic/clinicList">반려식물클리닉</a></li>
				             <li><a href="/StoreMain">스토어</a></li>
				             <li><a href="/gardenList">식물백과사전</a></li>
						</ul>
					</nav>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</header>
</body>
</html>