<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/noticeMain.css" type="text/css">
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
</head>
<body>
	<%@ include file="../Main/header.jsp" %> 
	<div class="content">
   		<div class="container_12">
      		<div class="grid_12">
      		
			<form name="NoticeMain" id="NoticeMain" method="post">
				<div class="table-wrapper">
				<table>
					<tr>
						<th style="width: 6%;">글번호</th>
						<th style="width: 55%;">제목</th>
						<th style="width: 17%;">작성일</th>
						<th style="width: 8%;">작성자</th>
						<c:if test="${userAuthority eq 'admin'}">
							<th style="width: 14%;">수정/삭제</th>
						</c:if>
					</tr>
					<c:forEach var="notice" items="${noticeLists}">
					<tr>
						<td>${notice.n_idx}</td>
						<td><a href="NoticeDetail?n_idx=${notice.n_idx}">${notice.n_title}</a></td>
						<td><fmt:formatDate value="${notice.n_date}" pattern="yyyy-MM-dd HH:mm" /></td>
						<td>운영자</td>
						<c:if test="${userAuthority eq 'admin'}">								
						<td>
						<a href="${pageContext.request.contextPath}/updateNotice?n_idx=${notice.n_idx}">수정</a> | 			
						<a href="${pageContext.request.contextPath}/deleteNotice?n_idx=${notice.n_idx}">삭제</a>						
						</td>
						</c:if>
					</tr>
					</c:forEach>
				</table>
				</div>
			</form>
			<c:if test="${userAuthority eq 'admin'}">	
				<a href="${pageContext.request.contextPath}/addNotice"><button type="button" class="action-btn">공지추가</button></a>
			</c:if>
		</div>
	</div>
		<div class="pagination">
		<c:forEach var="i" begin="1" end="${totalPage}">
			<a href="${pageContext.request.contextPath}/NoticeMain?page=${i}">${i}</a>
		</c:forEach>
	</div>
	</div>
	
	<!-- 아래쪽 영역 시작 -->
	<div class="bottom_block">
  		<div class="container_12">
  		</div>
	</div>	
	<%@ include file="../Main/footer.jsp" %>
</body>
</html>