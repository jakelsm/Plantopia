<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
  <script src="/js/plantFormValidation.js"></script> <!-- 유효성검사 JS 파일  -->
</head>
<style>
	.container {
		display : grid;
		grid-template-columns: repeat(4, 1fr);
		gap : 20px;
		padding : 20px;
	}
</style>
<body>
  <%@ include file="/WEB-INF/views/Main/header.jsp" %>
  <div class="content">
    <div class="container_12">	
	  <div class="grid_2">&nbsp;</div>
	  <div class="grid_8">	
		<h3>게시글 작성</h3>
		<form id="form" name="plantForm" method="post" action="/plantWriteProc" 
		 enctype="multipart/form-data" onsubmit="return validateForm()">
			제목 <label class="name"> <input type="text" name="pla_title" 
			placeholder="*제목은 필수입니다."> </label> <br> 
			내용 <label class="message"> <textarea name="pla_contents" rows="5" cols="40" 
			placeholder="나의 반려 식물을 마음껏 자랑해 보세요!"></textarea> </label> <br>
			<p> <input type="file" name="imgFile"> </p>
			<p>작성자: ${nickname}</p>
			<div class="clear"></div>
			<div class="btns">
			  <a href="/Clinic/clinicList" class="btn">목록으로</a>
			  <a href="#" data-type="reset" class="btn">다시 쓰기</a>
			  <a href="#" class="btn" onclick="if (validateForm()) { document.getElementById('form').submit(); } return false;">글 작성</a>
			</div>
		</form>
		</div>
		<div class="grid_2">&nbsp;</div>
	  </div>
  </div>
  <%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>