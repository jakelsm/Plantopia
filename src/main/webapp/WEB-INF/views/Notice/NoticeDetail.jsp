<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세보기</title>
<link rel="stylesheet" href="/CSS/noticeDetail.css" type="text/css">
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="/img/favicon.ico">ㄴ
</head>
<body>
	<div class="notice-container">
	
	<form name="NoticeDetail" id="NoticeDetail" method="post" action="">
		<div class="notice-title">${notice.n_title}</div>
		<div class="notice-meta">
			작성자 : 운영자 &nbsp;&nbsp;|&nbsp;&nbsp;
			작성일 : <fmt:formatDate value="${notice.n_date}" pattern="yyyy-MM-dd HH:mm" />
		</div>
		<div>
			<img src="/img/notice/${notice.n_img}" width="600" height="600"/> <br>	
		</div>
		<div class="notice-content">
			${notice.n_contents}
		</div>
		<div class="button-group">
			<c:if test="${userAuthority eq 'admin'}">
				<a href="updateNotice?n_idx=${notice.n_idx}"><button type="button">수정</button></a>
				<a href="deleteNotice?n_idx=${notice.n_idx}"><button type="button">삭제</button></a>
			</c:if>
		</div>
	</form>
	<a class="back-button" href="NoticeMain">목록으로</a>	
	</div>
</body>
</html>