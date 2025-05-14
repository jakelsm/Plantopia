<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세보기</title>
<style>
	body {
	    font-family: 'Noto Sans KR', sans-serif;
	    background-color: #f5f5f5;
	    margin: 0;
	    padding: 40px 0;
  	}
  	
  	.notice-container {
	    width: 800px;
	    margin: 0 auto;
	    background: white;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    padding: 30px;
 	 }
 	 
 	.notice-title {
	    font-size: 24px;
	    font-weight: 700;
	    margin-bottom: 10px;
	    padding-bottom: 10px;
	    border-bottom: 1px solid #eee;
 	 }
 	 
 	.notice-meta {
	    font-size: 14px;
	    color: #777;
	    text-align: right;
	    margin-bottom: 20px;
	  }
	.notice-content {
	    font-size: 16px;
	    line-height: 1.8;
	    white-space: pre-line;
	    color: #333;
	    margin-bottom: 30px;
 	 }
 	 	
 	.button-group {
	    text-align: right;
	    margin-top: 20px;
  	}
  	
  	.button-group a button {
	    margin-left: 8px;
	    padding: 8px 16px;
	    border: none;
	    background-color: #4CAF50;
	    color: white;
	    border-radius: 4px;
	    cursor: pointer;
	    font-size: 14px;
  	}
	
	.button-group a button:hover {
	    background-color: #45a049;
	} 	 
 	 
 	.back-button {
	    display: inline-block;
	    margin-top: 20px;
	    padding: 8px 16px;
	    background-color: #777;
	    color: white;
	    text-decoration: none;
	    border-radius: 4px;
 	 }
 	 
 	   .back-button:hover {
	    background-color: #555;
	  }
	  
</style>
</head>
<body>
	<div class="notice-container">
	
	<form name="NoticeDetail" id="NoticeDetail" method="post" action="">
		<div class="notice-title">${notice.n_title}</div>
		<div class="notice-meta">
			작성자 : 운영자 &nbsp;&nbsp;|&nbsp;&nbsp;
			작성일 : <fmt:formatDate value="${notice.n_date}" pattern="yyyy-MM-dd HH:mm" />
		</div>
		<div>
			<img src="/img/notice/${notice.n_img}" width="600" height="600"/> <br>	
		</div>
		<div class="notice-content">
			${notice.n_contents}
		</div>
		<div class="button-group">
			<c:if test="${userAuthority eq 'admin'}">
				<a href="updateNotice?n_idx=${notice.n_idx}"><button type="button">수정</button></a>
				<a href="deleteNotice?n_idx=${notice.n_idx}"><button type="button">삭제</button></a>
			</c:if>
		</div>
	</form>
	<a class="back-button" href="NoticeMain">목록으로</a>	
	</div>
</body>
</html>