<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 게시글 작성</title>
</head>
<body>
	<h2>클리닉 게시글 작성</h2>

	<form action="/Clinic/clinicWriteProc" method="post" enctype="multipart/form-data">
    제목: <input type="text" name="plc_title"><br>
    키우는 장소: <input type="text" name="growing_loc"><br>
    자라는 환경: <input type="text" name="growth_con"><br>
    물 주는 방식: <input type="text" name="watering"><br>
    마지막 분갈이: <input type="text" name="last_rep"><br>
    마지막 비료 시기: <input type="text" name="last_fert"><br>
    마지막 가지치기: <input type="text" name="last_pruned"><br>
    식물이 자라는 위치: <input type="text" name="plant_pos"><br>
    병충해 피해 유무: <input type="text" name="pest_dmg"><br>
    변색 잎 여부: <input type="text" name="discolored"><br>
    본문:<br>
    <textarea name="plc_contents" rows="10" cols="50"></textarea><br>
    이미지 업로드: <input type="file" name="imgFile"><br><br>
	<p>작성자: ${nickname}</p>
    <input type="submit" value="작성 완료">
	</form> 
</body>
</html>