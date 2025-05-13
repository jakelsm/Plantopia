<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 게시글 수정</title>
</head>
<body>
	<h2>클리닉 게시글 수정</h2>

	<form action="/Clinic/clinicUpdateProc" method="post" enctype="multipart/form-data">
    <input type="hidden" name="plc_idx" value="${clinic.plc_idx}" />
    <input type="hidden" name="original_img" value="${clinic.plc_img}" />

    제목: <input type="text" name="plc_title" value="${clinic.plc_title}"><br>
    키우는 장소: <input type="text" name="growing_loc" value="${clinic.growing_loc}"><br>
    자라는 환경: <input type="text" name="growth_con" value="${clinic.growth_con}"><br>
    물 주는 방식: <input type="text" name="watering" value="${clinic.watering}"><br>
    마지막 분갈이: <input type="text" name="last_rep" value="${clinic.last_rep}"><br>
    마지막 비료 시기: <input type="text" name="last_fert" value="${clinic.last_fert}"><br>
    마지막 가지치기: <input type="text" name="last_pruned" value="${clinic.last_pruned}"><br>
    식물이 자라는 위치: <input type="text" name="plant_pos" value="${clinic.plant_pos}"><br>
    병충해 피해 유무: <input type="text" name="pest_dmg" value="${clinic.pest_dmg}"><br>
    변색 잎 여부: <input type="text" name="discolored" value="${clinic.discolored}"><br>
    본문:<br>
    <textarea name="plc_contents" rows="10" cols="50">${clinic.plc_contents}</textarea><br>

    기존 이미지: <c:if test="${not empty clinic.plc_img}">${clinic.plc_img}</c:if><br>
    새 이미지 업로드: <input type="file" name="imgFile"><br><br>

    <input type="submit" value="수정 완료">
	</form>
</body>
</html>