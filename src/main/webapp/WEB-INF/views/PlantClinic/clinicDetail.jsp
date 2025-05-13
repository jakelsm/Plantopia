<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 상세보기</title>
	<style>
        .comment {
            margin-bottom: 15px;
	        padding: 10px;
	        border: 1px solid #ccc;
	        border-radius: 5px;
	        background-color: #f9f9f9;
        }
        .stars {
            color: gold;
            font-size: 18px;
        }
    </style>
</head>
<body>
		<h2>클리닉 상세보기</h2>
	
	<p>제목: ${clinic.plc_title}</p>
	<p>작성자: ${clinic.writer}</p>
	<p>키우는 장소: ${clinic.growing_loc}</p>
	<p>자라는 환경: ${clinic.growth_con}</p>
	<p>물 주는 방식: ${clinic.watering}</p>
	<p>마지막 분갈이: ${clinic.last_rep}</p>
	<p>마지막 비료 시기: ${clinic.last_fert}</p>
	<p>마지막 가지치기: ${clinic.last_pruned}</p>
	<p>식물이 자라는 위치: ${clinic.plant_pos}</p>
	<p>병충해 피해 유무: ${clinic.pest_dmg}</p>
	<p>변색 잎 여부: ${clinic.discolored}</p>
	<p>본문:<br>${clinic.plc_contents}</p>
	
	<c:if test="${not empty clinic.plc_img}">
	    <p><img src="/img/plantClinic/${clinic.plc_img}" alt="이미지" style="max-width:400px;"></p>
	</c:if>
	
	<hr>
	<h3>댓글</h3>
	<c:forEach var="comment" items="${commentList}">
	    <div class="comment" style="margin-left: ${comment.plccom_indent * 20}px">
	        <p>작성자: ${comment.writer}</p>
	        <p>댓글 내용 :${comment.plccom_contents}</p>
	
	        <!-- 별점 시각화 -->
	        <c:if test="${not empty comment.avgRating}">
	            <p class="stars">
	                평균 별점:
	                <c:forEach var="i" begin="1" end="5">
	                    <c:choose>
	                        <c:when test="${i <= comment.avgRating}">&#9733;</c:when>
	                        <c:otherwise>&#9734;</c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                (${comment.avgRating}점)
	            </p>
	        </c:if>
	
	        <c:if test="${not empty comment.myRating}">
	            <p class="stars">
	                내 별점:
	                <c:forEach var="i" begin="1" end="5">
	                    <c:choose>
	                        <c:when test="${i <= comment.myRating}">&#9733;</c:when>
	                        <c:otherwise>&#9734;</c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                (${comment.myRating}점)
	            </p>
	            <form action="/Clinic/comment/rating/delete" method="post">
	                <input type="hidden" name="plccom_idx" value="${comment.plccom_idx}" />
	                <input type="hidden" name="plc_idx" value="${clinic.plc_idx}" />
	                <input type="submit" value="별점 삭제" />
	            </form>
	        </c:if>
	
	        <!-- 별점 등록/수정 -->
	        <form action="/Clinic/comment/rate" method="post">
	            <input type="hidden" name="plccom_idx" value="${comment.plccom_idx}" />
	            <input type="hidden" name="plc_idx" value="${clinic.plc_idx}" />
	            별점:
	            <select name="rating">
	                <option value="1">1</option>
	                <option value="2">2</option>
	                <option value="3">3</option>
	                <option value="4">4</option>
	                <option value="5">5</option>
	            </select>
	            <input type="submit" value="별점 등록/수정">
	        </form>
	
	        <!-- 수정/삭제 링크 -->
	        <a href="/Clinic/comment/update?plccom_idx=${comment.plccom_idx}&plc_idx=${clinic.plc_idx}">수정</a>
	        <a href="/Clinic/comment/delete?plccom_idx=${comment.plccom_idx}&plc_idx=${clinic.plc_idx}">삭제</a>
	
	        <!-- 대댓글 작성 -->
	        <form action="/Clinic/comment/write" method="post">
	            <input type="hidden" name="plc_idx" value="${clinic.plc_idx}" />
	            <input type="hidden" name="parentId" value="${comment.plccom_idx}" />
	            <textarea name="plccom_contents" rows="2" cols="50" placeholder="대댓글 작성..."></textarea><br>
	            <input type="submit" value="대댓글 작성">
	        </form>
	    </div>
	</c:forEach>
	
	<hr>
	<h3>댓글 작성</h3>
	<form action="/Clinic/comment/write" method="post">
	    <input type="hidden" name="plc_idx" value="${clinic.plc_idx}" />
	    <textarea name="plccom_contents" rows="4" cols="50"></textarea><br>
	    <input type="submit" value="댓글 작성">
	</form>
</body>
</html>