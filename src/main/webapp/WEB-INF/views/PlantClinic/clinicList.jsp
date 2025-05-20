<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려식물 클리닉 게시판</title>
 <link rel="icon" href="/img/favicon.ico">
</head>
<style>
	.ctn {
		text-align : center;
	}
	
	.pagination {
		text-align: center;
 		margin: 30px 0 10px 0;
	}
	
	.pagination a {
	    display: inline-block;
	    margin: 0 5px;
	    padding: 6px 12px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	    background-color: #f9f9f9;
	    text-decoration: none;
	    color: #333;
 	 }
 	
 	.pagination a:hover {
    	background-color: #e0e0e0;
  	}
  	
  	.pagination a.active {
	  background-color: #4CAF50;
	  color: white;
	  font-weight: bold;
	}
	
	input[type="text"], input[type="submit"] {
	  padding: 8px 12px;
	  margin: 10px 5px;
	  border-radius: 5px;
	  border: 1px solid #ccc;
	}
	input[type="submit"] {
	  background-color: #4CAF50;
	  color: white;
	  font-weight: bold;
	  cursor: pointer;
	}
	input[type="submit"]:hover {
	  background-color: #45a049;
	}
	
</style>
<body>
  <%@ include file="/WEB-INF/views/Main/header.jsp" %>
	<div class="content">
	 <div class="container_12">
		<div class="grid_12">
			<h3>반려식물 클리닉 게시판</h3>
		</div>
		<div class="clear cl1"></div>
		   <div class="grid_9">
				<p>클리닉 게시판 설명</p>
		   </div>
	    <c:forEach var="dto" items="${clinicList}" varStatus="status">
	          <c:if test="${status.index % 3 == 0 && status.index != 0}">
			        <div class="clear cl2"></div>
			  </c:if>  
	            
	            <div class="grid_4">
	            <div class="text1">
				    <c:choose>
				        <c:when test="${fn:length(dto.plc_title) > 17}">
				            <a href="/Clinic/clinicDetail?plc_idx=${dto.plc_idx}">
				                ${fn:substring(dto.plc_title, 0, 17)}...
				            </a>
				        </c:when>
				        <c:otherwise>
				            <a href="/Clinic/clinicDetail?plc_idx=${dto.plc_idx}">
				                ${dto.plc_title}
				            </a>
				        </c:otherwise>
				    </c:choose>
				</div>
	            <br>
                    <c:choose>
					    <c:when test="${fn:length(dto.plc_contents) > 89}">
					        ${fn:substring(dto.plc_contents, 0, 89)}...
					    </c:when>
					    <c:otherwise>
					        ${dto.plc_contents}
					    </c:otherwise>
					</c:choose>
	            <br><a class="btn">${dto.writer}</a>
	            <div class="clear"></div>
	            <c:if test="${not empty loginInfo}">
                    <c:if test="${loginInfo.user_authority == 'admin' or loginInfo.user_num == dto.user_num}">
			            <td>
			                <a href="/Clinic/clinicUpdate?plc_idx=${dto.plc_idx}">수정</a> | 
			                <a href="/Clinic/clinicDelete?plc_idx=${dto.plc_idx}">삭제</a>
			            </td>
	            	</c:if>
	           </c:if>
	           </div>
	    </c:forEach>
	
	<div class="clear cl1"></div>
	<div class="grid_10">&nbsp;</div>
	    <div class="grid_2">
		<a href="/Clinic/clinicWrite">글쓰기</a></div>
	</div>
	</div>
	
	<div class="bottom_block">
	  <div class="clear cl1"></div>	  
	  
	  	  <div class="ctn">	
			<form action="/Clinic/clinicList" method="get">
			    <input type="text" name="search" value="${search}" placeholder="제목을 입력하세요.">
			    <input type="submit" value="검색">
			</form>
		  </div>	
		<div class="clear cl1"></div>	
		<!-- 페이지네이션 -->
	    <div class="pagination">
	    <c:if test="${currentPage > 1}">
	        <a href="/Clinic/clinicList?page=${currentPage - 1}&search=${param.search}">이전</a>
	    </c:if>
	    <c:forEach var="i" begin="1" end="${totalPage}">
	        <a href="/Clinic/clinicList?page=${i}&search=${param.search}" class="${i == currentPage ? 'active' : ''}">${i}</a>
	    </c:forEach>
	    <c:if test="${currentPage < totalPage}">
	        <a href="/Clinic/clinicList?page=${currentPage + 1}&search=${param.search}">다음</a>
	    </c:if>
    	</div>
	</div>
  <%@ include file="/WEB-INF/views/Main/footer.jsp" %>	
</body>
</html>