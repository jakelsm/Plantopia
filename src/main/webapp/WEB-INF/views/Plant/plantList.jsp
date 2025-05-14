<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
	<h3>게시판 목록</h3>
	<a href="/Plant/plantWrite">글쓰기</a>
	<table border="1" width="600">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<c:if test="${showAction}">
        		<th>관리</th>
      		</c:if>
		</tr>
		<c:forEach var="dto" items="${plantList}">
		<tr>
  		  <td>${dto.pla_idx}</td>
	      <td><a href="<c:url value='/Plant/plantDetail?pla_idx=${dto.pla_idx}'/>">${dto.pla_title}</a></td>
		  <td>${dto.writer}</td>
		  	<!-- 로그인 상태일 때만 검사 -->
          	<c:if test="${not empty loginInfo}">
	            <!-- admin 이거나, 내가 쓴 글이면 버튼 보임 -->
	            <c:if test="${loginInfo.user_authority eq 'admin' or loginInfo.user_num eq dto.user_num}">
	            <td>
				  	<a href="<c:url value='/Plant/plantUpdate?pla_idx=${dto.pla_idx}'/>">수정</a> | 
				  	<a href="<c:url value='/Plant/plantdelete?pla_idx=${dto.pla_idx}'/>">삭제</a>
				</td>
				</c:if>
          	</c:if>
		</tr>
		</c:forEach>
	</table>
</body>
</html>