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
	제목 : ${plant.pla_title} <br>
	<img src="/img/plant/${plant.pla_img}" alt="#" width="600" height="600"/> <br>
	내용 : ${plant.pla_contents} <br>
</body>
</html>