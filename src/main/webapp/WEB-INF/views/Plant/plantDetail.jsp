<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
	<h3>게시글 상세보기</h3>
	제목 : ${plant.plaTitle} <br>
	<c:if test="${not empty plant.plaImg}">
		<img src="/upload/plant/${plant.plaImg}" width="300" />
	</c:if>
	내용 : ${plant.plaContents} <br>
</body>
</html>