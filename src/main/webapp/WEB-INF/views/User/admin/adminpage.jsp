<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 페이지</title>
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f4f6f9;
		margin: 0;
		padding: 0;
	}

	h2 {
		text-align: center;
		padding-top: 30px;
		color: #333;
	}

	.admin-container {
		max-width: 800px;
		margin: 30px auto;
		background-color: #fff;
		border-radius: 12px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		padding: 30px;
	}

	.menu-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 20px;
	}

	.menu-grid a {
		display: block;
		text-align: center;
		background-color: #4CAF50;
		color: #fff;
		padding: 15px;
		border-radius: 8px;
		text-decoration: none;
		font-weight: bold;
		transition: background-color 0.3s ease;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}

	.menu-grid a:hover {
		background-color: #388e3c;
	}

	.header-right {
		text-align: right;
		padding: 10px 20px;
		background-color: #2e7d32;
		color: white;
	}

	.logo-img {
		display: flex;
		justify-content: center;
		margin-bottom: 20px;
	}

	.color-white {
		color: #fff;
	}
</style>
</head>
<body>

<div class="header-right">
	관리자 접속 중 | <a href="/logout" class="color-white">로그아웃</a>
</div>

<div class="admin-container">
	<h2>🌿 관리자 페이지</h2>
	<div class="menu-grid">
		<a href="/accountList">회원 관리</a>
		<a href="/StoreMain">상품 관리</a>
		<a href="/addStore">상품 추가</a>
		<a href="/NoticeMain">공지사항 관리</a>
		<a href="/addNotice">공지사항 추가</a>
		<a href="/Plant/plantList">반려식물 게시판 관리</a>
		<a href="/Clinic/clinicList">클리닉 게시판 관리</a>
		<a href="/gardenList">식물 백과사전 관리</a>
	</div>
</div>
</body>
</html>
