<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
	<h3>게시글 상세보기</h3>
	제목 : ${plant.pla_title} <br>
	<img src="/img/plant/${plant.pla_img}" alt="#" width="600" height="600"/> <br>
	내용 : ${plant.pla_contents} <br>
	
	<p> 좋아요 수 : ${likeCount} </p>
	
	<c:if test="${!userLiked}">
        좋아요
	</c:if>
	<c:if test="${userLiked}">
		좋아요 취소
	</c:if>
	
	<!-- 댓글 목록 출력 -->
	<h3>댓글</h3>
	<c:forEach var="comment" items="${commentList}">
	    <div style="margin-left: ${comment.placom_indent * 20}px; border: 1px solid #ccc; padding: 5px; margin-bottom: 5px;">
        <p><strong>댓글 내용:</strong> ${comment.placom_contents}</p>

        <!-- 대댓글 작성 폼 -->
        <form action="/Plant/plantList/comment" method="post" style="margin-top: 5px;">
            <input type="hidden" name="pla_idx" value="${param.pla_idx}" />
            <input type="hidden" name="placom_root" value="${comment.placom_root}" />
            <input type="hidden" name="placom_indent" value="${comment.placom_indent}" />
            <textarea name="placom_contents" placeholder="답글을 입력하세요" rows="2" cols="50"></textarea><br>
            <input type="submit" value="답글 작성" />
        </form>

        <!-- 수정/삭제 링크 -->
        <a href="/Plant/plantList/comment/update?scom_idx=${comment.placom_idx}&pla_idx=${param.pla_idx}">수정</a> |
        <a href="/Plant/plantList/comment/delete?scom_idx=${comment.placom_idx}&pla_idx=${param.pla_idx}">삭제</a>
    </div>
	</c:forEach>

	<!-- 최상위 댓글 작성 폼 -->
	<h4>댓글 작성</h4>
	<form action="/Plant/plantList/comment" method="post">
	    <input type="hidden" name="pla_idx" value="${param.pla_idx}" />
	    <textarea name="placom_contents" placeholder="댓글을 입력하세요" rows="3" cols="60"></textarea><br>
	    <input type="submit" value="댓글 등록" />
	</form>
	
</body>
</html>