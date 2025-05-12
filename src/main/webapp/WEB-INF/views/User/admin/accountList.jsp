<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 리스트</title>
</head>
<body>
	<h3>회원 정보 리스트</h3>
	<table border="1" width="3000">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>우편번호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>권한등급</th>
			<th>수정/삭제</th>
		</tr>
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.user_num}</td>
			<td>${dto.user_id}</td>
			<td>${dto.user_passwd}</td>
			<td>${dto.user_name}</td>
			<td>${dto.user_nickname}</td>
			<td>${dto.roadAddrPart1}</td>
			<td>${dto.addrDetail}</td>
			<td>${dto.zipNo}</td>
			<td>${dto.user_email}</td>
			<td>${dto.user_tel}</td>
			<td>${dto.user_authority}</td>
			<td>
				<a href="accountUpdate?user_num=${dto.user_num}">수정</a> /
				<a href="accountDelete?user_num=${dto.user_num}">삭제</a>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>