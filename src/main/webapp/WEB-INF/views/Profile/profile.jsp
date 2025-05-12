<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필</title>
</head>
<body>
	<fieldset>
	<legend>내 프로필</legend>
		<table width="500">
			<tr>
				<th>닉네임</th>
				<td>${profile.userNickname}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${profile.userEmail}</td>
			</tr>
		</table>
	</fieldset>	
		
	<!-- 향후 확장 영역: 별점 평균, 작성글 목록 등 -->
		
	<p><a href="${pageContext.request.contextPath}/loginTest">뒤로</a></p>
</body>
</html>