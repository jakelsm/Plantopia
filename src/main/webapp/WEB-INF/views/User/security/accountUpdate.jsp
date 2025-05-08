<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정페이지</title>
<script src="/JS/checkForm.js"></script>
</head>
<body>
	<h3>회원정보수정</h3>
	<form name="member" id="member" method="post" action="memberUpdateOk">
		<input type="hidden" name="user_num" value="${dto.user_num}">
		아이디 : ${dto.user_id} <br>
		비밀번호 : <input type="password" name="user_passwd" id="user_passwd"> <br>
		비밀번호 확인 : <input type="password" name="passwdconfirm" id="passwdconfirm"> <br>
		이름 : ${dto.user_name} <br>
		닉네임 : <input type="text" name="user_nickname" id="user_nickname"> <br>
		주소 : <input type="text" name="roadAddrPart1" id="roadAddrPart1" size="30" value="${dto.roadAddrPart1}" readonly> 
			  <input type="button" value="주소검색" onclick="goPopup();"> <br>
		상세주소 : <input type="text" name="addrDetail" id="addrDetail" value="${dto.addrDetail}" readonly> <br>
		우편번호 : <input type="text" name="zipNo" id="zipNo" value="${dto.zipNo}" readonly> <br>
		이메일 : <input type="text" name="user_email" id="user_email"> <br>
		연락처 : <input type="text" name="user_tel" id="user_tel"> <br>
		<input type="button" value="회원정보수정" onclick="check()">
		<input type="button" value="수정취소" onclick="history.back()">
	</form>
</body>
</html>