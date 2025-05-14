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
  <link rel="icon" href="/images/favicon.ico">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/form.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
  <script src="/js/jquery.js"></script>
  <script src="/js/jquery-migrate-1.1.1.js"></script>
  <script src="/js/script.js"></script>
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
	  width: 200px;
	  height: auto;
	}	
  </style>
</head>
<body>
<header>
    <div class="container_12">
      <div class="grid_12">
      	 <div class="header-right">
	        <a href="/profile"><i class="bi bi-person-circle fs-4"></i> <strong>${sessionScope.user_nickname}님</strong>/</a>
	        <a href="/getCartList?user_num=${sessionScope.user_num}">장바구니/</a>
	        <a href="/logout">로그아웃</a>
        </div>         
        <h1>
          <a href="/"><img src="/img/팀로고.png" alt="Plantopia 로고" class="logo-img"></a>
        </h1>     
      </div>    
    </div>
    <div class="menu_block">
      <div class="container_12">
        <div class="grid_12">
          <nav class="horizontal-nav full-width horizontalNav-notprocessed">
            <ul class="sf-menu">
              <li class="current"><a href="/Main">Home</a></li>          
              <li><a href="/Plant/plantList">플랜트</a></li>
              <li><a href="/Clinic/clinicList">클리닉</a></li>
              <li><a href="/StoreMain">스토어</a></li>
              <li><a href="/gardenList">백과사전</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </header>
</body>
</html>