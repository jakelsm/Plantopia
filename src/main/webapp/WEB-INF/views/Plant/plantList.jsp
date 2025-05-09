<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
	<h3>게시판 목록</h3>
	<table border="1" width="400">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="dto" items="${plantList}">
		<tr>
			<th>${dto.plaIdx}</th>
			<th>${dto.plaTitle}</th>
			<th>삭제</th>
		</tr>
		</c:forEach>
	</table>
</body>
</html>