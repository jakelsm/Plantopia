<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세보기</title>
</head>
<body>
	<div>
		<img src="/img/store/${notice.n_img}" width="1000" height="1000"/> <br>
	</div>
	<form name="NoticeDetail" id="NoticeDetail" method="post" action="">
		공지 제목 : ${notice.n_title} <br>
		작성자 : 운영자 <br>
		작성일 : ${notice.n_date} <br>
		공지 내용 : ${notice.n_contents} <br>
		<a href="updateNotice?n_idx=${notice.n_idx}"><button type="button">수정</button></a>
		<a href="deleteNotice?n_idx=${notice.n_idx}"><button type="button">삭제</button></a>
	</form>
	<a href="NoticeMain"><button type="button">목록</button></a>
</body>
</html>