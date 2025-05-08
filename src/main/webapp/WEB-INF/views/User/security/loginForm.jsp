<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<h3>로그인</h3>
	<form name="login" id="login" method="post" action="#">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="user_passwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="로그인">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>