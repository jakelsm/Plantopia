<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
  <script src="/js/plantFormValidation.js"></script> <!-- 유효성검사 JS 파일  -->
</head>
<body>
	<%@ include file="/WEB-INF/views/Main/header.jsp" %>
	<div class="content">
    <div class="container_12">	
	  <div class="grid_2">&nbsp;</div>
	  <div class="grid_8">	
		<h3>게시글 수정</h3>
			<form id="form" name="plantForm" method="post" action="plantUpdateProc" enctype="multipart/form-data"
			 onsubmit="return validateForm()">
				<input type="hidden" name="pla_idx" value="${dto.pla_idx}" />
			    제목 <label class="name"><input type="text" name="pla_title" value="${dto.pla_title}" /> </label><br>
			    내용 <label class="message"><textarea name="pla_contents" rows="5" cols="40">${dto.pla_contents}</textarea> </label><br>
			    기존 이미지 : <img src="/img/plant/${dto.pla_img}" width="100" /> <br>
			    <input type="hidden" name="original_img" value="${dto.pla_img}" />
			    새 이미지 <input type="file" name="imgFile"> <br>
				<div class="clear"></div>
				<div class="btns">
					<a href="/Plant/plantList" class="btn">목록으로</a>
			  		<a href="#" class="btn" onclick="document.forms['plantForm'].reset(); return false;">다시 쓰기</a>
					<a href="#" class="btn" onclick="if (validateForm()) document.forms['plantForm'].submit(); return false;">수정 완료</a>
				</div>
			</form>
		  </div>
		<div class="grid_2">&nbsp;</div>
	  </div>
  </div>
	
	<%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>