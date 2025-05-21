<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/js/clinicFormValidation.js"></script> <!-- 유효성검사 JS -->
<title>클리닉 게시글 수정</title>
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
</head>
<body>
	<%@ include file="../Main/header.jsp" %>
	<div class="content">
    <div class="container_12">	
	  <div class="grid_2">&nbsp;</div>
	  <div class="grid_8">
			<h3>클리닉 게시글 수정</h3>
			<form id="form" name="clinicForm" action="${pageContext.request.contextPath}/Clinic/clinicUpdateProc" method="post" enctype="multipart/form-data">
			   <input type="hidden" name="plc_idx" value="${clinic.plc_idx}" />
			   <input type="hidden" name="original_img" value="${clinic.plc_img}" />
				    제목 <label class="name"><input type="text" name="plc_title" value="${clinic.plc_title}"></label><br>
				    키우는 장소 <label class="name"><input type="text" name="growing_loc" value="${clinic.growing_loc}"></label><br>
				    자라는 환경 <label class="name"><input type="text" name="growth_con" value="${clinic.growth_con}"></label><br>
				    물 주는 방식 <label class="name"><input type="text" name="watering" value="${clinic.watering}"></label><br>
				    마지막 분갈이 <label class="name"><input type="text" name="last_rep" value="${clinic.last_rep}"></label><br>
				    마지막 비료 시기 <label class="name"><input type="text" name="last_fert" value="${clinic.last_fert}"></label><br>
				    마지막 가지치기 <label class="name"><input type="text" name="last_pruned" value="${clinic.last_pruned}"></label><br>
				    식물이 자라는 위치 <label class="name"><input type="text" name="plant_pos" value="${clinic.plant_pos}"></label><br>
				    병충해 피해 유무 <label class="name"><input type="text" name="pest_dmg" value="${clinic.pest_dmg}"></label><br>
				    변색 잎 여부 <label class="name"><input type="text" name="discolored" value="${clinic.discolored}"></label><br>
				    본문 <label class="message">
				    <textarea name="plc_contents" rows="10" cols="50">${clinic.plc_contents}</textarea></label><br>
				    <c:if test="${not empty clinic.plc_img}">
					  기존 이미지 : <img src="${pageContext.request.contextPath}/img/plantClinic/${clinic.plc_img}" width="100" /> <br>
					</c:if>
				    새 이미지 <input type="file" name="imgFile"><br><br>
		      		<div class="btns">
					  <a href="${pageContext.request.contextPath}/Clinic/clinicList" class="btn">목록으로</a>
					  <a href="#" class="btn" onclick="resetClinicForm(); return false;">다시 쓰기</a>
					  <a href="#" class="btn" onclick="if (validateClinicForm()) document.forms['clinicForm'].submit(); return false;">수정 완료</a>
					</div>
			</form>
		 </div>
		<div class="grid_2">&nbsp;</div>
	  </div>
  	 </div>
	<%@ include file="../Main/footer.jsp" %>
</body>
</html>