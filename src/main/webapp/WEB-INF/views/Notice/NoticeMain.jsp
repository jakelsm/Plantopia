<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
</head>
<body>
	<form name="NoticeMain" id="NoticeMain" method="post">
		<table border="1">
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성일</td>
				<td>글쓴이</td>
				<td>수정/삭제</td>
			</tr>
			<c:forEach var="notice" items="${noticeLists}">
			<tr>
				<td>${notice.n_idx}</td>
				<td><a href="NoticeDetail?n_idx=${notice.n_idx}">${notice.n_title}</a></td>
				<td>${notice.n_date}</td>
				<td>운영자</td>
				<td><a href="updateNotice?n_idx=${notice.n_idx}">수정</a>/<a href="deleteNotice?n_idx=${notice.n_idx}">삭제</a></td>
			</tr>
			</c:forEach>
		</table>
	</form>
	<a href="/addNotice"><button type="button">공지추가</button></a>
	<div class="pagination">
	<c:forEach var="i" begin="1" end="${totalPage}">
		<a href="/NoticeMain?page=${i}">${i}</a>
	</c:forEach>
	</div>
</body>
</html>