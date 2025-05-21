<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
</head>
<body>
	<h3>댓글 수정</h3>
	<form action="/Clinic/comment/updateProc" method="post">
    <input type="hidden" name="plccom_idx" value="${dto.plccom_idx}" />
    <input type="hidden" name="plc_idx" value="${plc_idx}" />
    <p>작성자: ${nickname}</p>
    <p>내용:</p>
    <textarea name="plccom_contents" rows="4" cols="50">${dto.plccom_contents}</textarea><br>
    <input type="submit" value="수정 완료">
</form>
</body>
</html>