<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/clinicFormValidation.js"></script> <!-- 유효성검사 JS -->
<title>클리닉 게시글 작성</title>
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="/img/favicon.ico">
</head>
<body>
  <%@ include file="/WEB-INF/views/Main/header.jsp" %>
  <div class="content">
    <div class="container_12">	
	  <div class="grid_2">&nbsp;</div>
	  <div class="grid_8">
		<h3>클리닉 게시글 작성</h3>
			<form id="form" name="clinicForm" action="/Clinic/clinicWriteProc" method="post" enctype="multipart/form-data">
			    제목 <label class="name"> <input type="text" name="plc_title" placeholder="*제목은 필수입니다."> </label> <br>
			    키우는 장소 <label class="name"><input type="text" name="growing_loc"></label><br>
			    자라는 환경 <label class="name"><input type="text" name="growth_con"></label><br>
			    물 주는 방식 <label class="name"><input type="text" name="watering"></label><br>
			    마지막 분갈이 <label class="name"><input type="text" name="last_rep"></label><br>
			    마지막 비료 시기 <label class="name"><input type="text" name="last_fert"></label><br>
			    마지막 가지치기 <label class="name"><input type="text" name="last_pruned"></label><br>
			    식물이 자라는 위치 <label class="name"><input type="text" name="plant_pos"></label><br>
			    병충해 피해 유무 <label class="name"><input type="text" name="pest_dmg"></label><br>
			    변색 잎 여부 <label class="name"><input type="text" name="discolored"></label><br>
			    본문 <label class="message">
			    <textarea name="plc_contents" rows="10" cols="50"></textarea></label><br>
			    <input type="file" name="imgFile"><br>
				<p>작성자: ${nickname}</p>
				<div class="clear"></div>
				<div class="btns">
				  <a href="/Clinic/clinicList" class="btn">목록으로</a>
				  <a href="#" class="btn" onclick="document.forms['clinicForm'].reset(); return false;">다시 쓰기</a>
				  <a href="#" class="btn" onclick="document.forms['clinicForm'].requestSubmit(); return false;">작성 완료</a>
				</div>
			</form> 
		</div>
		<div class="grid_2">&nbsp;</div>
	  </div>
  </div>
  <%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>