<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
<style>
	.table-wrapper {
	    max-width: 1000px;
	    margin: 40px auto;
	    background: #fff;
	    padding: 20px;
	    border: 1px solid #ccc;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
    	border-radius: 8px;
 	 }

	table {
		width: 100%;
		table-layout: fixed; /* 고정된 열 폭 적용 */
   	 	border-collapse: collapse;
    	font-family: 'Noto Sans KR', sans-serif;
    	font-size: 15px;
	}
	
	td,th {
		border: 1px solid #ddd;
   		padding: 12px 10px;
   		text-align: center;
	}
	
	td a {
		 display: inline-block;
		 overflow: hidden;
		 white-space: nowrap;
		 text-overflow: ellipsis;
		 max-width: 100%;
	}
	
	th {
	    background-color: #f7f7f7;
	    font-weight: 600;
  	}
	
	tr:hover {
  		background-color: #fafafa;
	}
	
	.pagination {
		text-align: center;
 		margin: 30px 0 10px 0;
	}
	
	.pagination a {
	    display: inline-block;
	    margin: 0 5px;
	    padding: 6px 12px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	    background-color: #f9f9f9;
	    text-decoration: none;
	    color: #333;
 	 }
 	
 	.pagination a:hover {
    	background-color: #e0e0e0;
  	}
  	
  	.pagination a.active {
	  background-color: #4CAF50;
	  color: white;
	  font-weight: bold;
	}
 	 
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/Main/header.jsp" %> 
	<div class="content">
   		<div class="container_12">
      		<div class="grid_12">
      		
			<form name="NoticeMain" id="NoticeMain" method="post">
				<div class="table-wrapper">
				<table>
					<tr>
						<th style="width: 8%;">글번호</th>
						<th style="width: 57%;">제목</th>
						<th style="width: 15%;">작성일</th>
						<th style="width: 10%;">작성자</th>
						<c:if test="${userAuthority eq 'admin'}">
							<th style="width: 10%;">수정/삭제</th>
						</c:if>
					</tr>
					<c:forEach var="notice" items="${noticeLists}">
					<tr>
						<td>${notice.n_idx}</td>
						<td><a href="NoticeDetail?n_idx=${notice.n_idx}">${notice.n_title}</a></td>
						<td><fmt:formatDate value="${notice.n_date}" pattern="yyyy-MM-dd HH:mm" /></td>
						<td>운영자</td>
						<c:if test="${userAuthority eq 'admin'}">			
						<td><a href="updateNotice?n_idx=${notice.n_idx}">수정</a>
							/<a href="deleteNotice?n_idx=${notice.n_idx}">삭제</a></td>
						</c:if>
					</tr>
					</c:forEach>
				</table>
				</div>
			</form>
			<c:if test="${userAuthority eq 'admin'}">	
				<a href="/addNotice"><button type="button">공지추가</button></a>
			</c:if>
		</div>
	</div>
		<div class="pagination">
		<c:forEach var="i" begin="1" end="${totalPage}">
			<a href="/NoticeMain?page=${i}">${i}</a>
		</c:forEach>
	</div>
	</div>
	<%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>