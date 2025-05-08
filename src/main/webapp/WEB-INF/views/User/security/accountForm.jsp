<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="/JS/check.js"></script>
</head>
<body>
	<h3>회원가입</h3>
	<form name="member" id="member" method="post" action="accountWrite">
		아이디 : <input type="text" name="user_id" id="user_id"> <br>
		비밀번호 : <input type="password" name="user_passwd" id="user_passwd"> <br>
		비밀번호 확인 : <input type="password" name="passwdconfirm" id="passwdconfirm"> <br>
		이름 : <input type="text" name="user_name" id="user_name"> <br>
		닉네임 : <input type="text" name="user_nickname" id="user_nickname"> <br>
		주소 : <input type="text" name="roadAddrPart1" id="roadAddrPart1" size="30" readonly> 
			  <input type="button" value="주소검색" onclick="goPopup();"> <br>
		상세주소 : <input type="text" name="addrDetail" id="addrDetail" readonly> <br>
		우편번호 : <input type="text" name="zipNo" id="zipNo" readonly> <br>
		이메일 : <input type="text" name="user_email" id="user_email"> <br>
		연락처 : <input type="text" name="user_tel" id="user_tel"> <br>
		<input type="submit" value="회원가입">
		<input type="reset" value="가입취소">
	</form>
</body>
</html>