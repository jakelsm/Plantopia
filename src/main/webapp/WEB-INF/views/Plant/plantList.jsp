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
	<table border="1" width="600">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="dto" items="${plantList}">
		<tr>
  		  <td>${dto.pla_idx}</td>
	      <td><a href="/Plant/plantDetail?pla_idx=${dto.pla_idx}">${dto.pla_title}</a></td>
		  <td>${dto.writer}</td>
		  <td><a href="/Plant/plantdelete?pla_idx=${dto.pla_idx}">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>