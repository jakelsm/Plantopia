<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클리닉 게시판 목록</title>
</head>
<body>
	<h3>클리닉 게시판 목록</h3>
	<a href="/Clinic/clinicWrite">글쓰기</a>
	<table border="1" width="900">
	    <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>작성자</th>
	        <c:if test="${showAction}">
        		<th>관리</th>
      		</c:if>
	    </tr>
	    <c:forEach var="dto" items="${clinicList}">
	        <tr>
	            <td>${dto.plc_idx}</td>
	            <td><a href="/Clinic/clinicDetail?plc_idx=${dto.plc_idx}">${dto.plc_title}</a></td>
	            <td>${dto.writer}</td>
	            <c:if test="${not empty loginInfo}">
                    <c:if test="${loginInfo.user_authority == 'admin' or loginInfo.user_num == dto.user_num}">
			            <td>
			                <a href="/Clinic/clinicUpdate?plc_idx=${dto.plc_idx}">수정</a> | 
			                <a href="/Clinic/clinicDelete?plc_idx=${dto.plc_idx}">삭제</a>
			            </td>
	            	</c:if>
	           </c:if>
	        </tr>
	    </c:forEach>
	</table>
</body>
</html>