<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려식물 클리닉 게시판</title>
 <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
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
  <%@ include file="../Main/header.jsp" %>
	<div class="content">
	 <div class="container_12">
		<div class="grid_12">
			<h3>반려식물 클리닉 게시판</h3>
		</div>
		<div class="clear cl1"></div>
		   <div class="grid_9">
				<p>🌿 식물이 아파 보이거나 잎이 노랗게 변했나요?<br>
					반려식물에 대한 고민을 나누고 조언을 받을 수 있는 공간입니다.<br>
					식물도 함께 살아가는 가족입니다.<br>
					정성을 다해 돌보고, 함께 키워나가요! 🌱</p>
		   </div>
		   <div class="clear cl1"></div>
	    <c:forEach var="dto" items="${clinicList}" varStatus="status">
	          <c:if test="${status.index % 3 == 0 && status.index != 0}">
			        <div class="clear cl2"></div>
			  </c:if>  
	            
	            <div class="grid_4">
	            <div class="text1" style="font-size: 20px; font-weight: bold; color: #66cc66;">
				    <c:choose>
				        <c:when test="${fn:length(dto.plc_title) > 15}">
				            <a href="${pageContext.request.contextPath}/Clinic/clinicDetail?plc_idx=${dto.plc_idx}" style="color: #66cc66;">
				                ${fn:substring(dto.plc_title, 0, 15)}...
				            </a>
				        </c:when>
				        <c:otherwise>
				            <a href="${pageContext.request.contextPath}/Clinic/clinicDetail?plc_idx=${dto.plc_idx}" style="color: #66cc66;">
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
			                <a href="${pageContext.request.contextPath}/Clinic/clinicUpdate?plc_idx=${dto.plc_idx}">수정</a> | 
			                <a href="${pageContext.request.contextPath}/Clinic/clinicDelete?plc_idx=${dto.plc_idx}">삭제</a>
			            </td>
	            	</c:if>
	           </c:if>
	           </div>
	    </c:forEach>
	
	<div class="clear cl1"></div>
	<div class="grid_10">&nbsp;</div>
	    <div class="grid_2">
		<a href="${pageContext.request.contextPath}/Clinic/clinicWrite">글쓰기</a></div>
	</div>
	<div class="clear cl1"></div>	  
	  
	  	  <div class="ctn">	
			<form action="${pageContext.request.contextPath}/Clinic/clinicList" method="get">
			    <input type="text" name="search" value="${search}" placeholder="제목을 입력하세요.">
			    <input type="submit" value="검색">
			</form>
		  </div>	
		<div class="clear cl1"></div>	
		<!-- 페이지네이션 -->
	    <div class="pagination">
	    <c:if test="${currentPage > 1}">
	        <a href="${pageContext.request.contextPath}/Clinic/clinicList?page=${currentPage - 1}&search=${param.search}">이전</a>
	    </c:if>
	    <c:forEach var="i" begin="1" end="${totalPage}">
	        <a href="${pageContext.request.contextPath}/Clinic/clinicList?page=${i}&search=${param.search}" class="${i == currentPage ? 'active' : ''}">${i}</a>
	    </c:forEach>
	    <c:if test="${currentPage < totalPage}">
	        <a href="${pageContext.request.contextPath}/Clinic/clinicList?page=${currentPage + 1}&search=${param.search}">다음</a>
	    </c:if>
    	</div>
	</div>
	   
	<div class="bottom_block">
	<div class="container_12">
		  <!-- Store Location -->
	    <div class="grid_3">
	      <h3>Store Location</h3>
	      <div id="owl1" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
	        <div class="owl-wrapper-outer">
	          <div class="owl-wrapper" style="width: 600px; left: 0px; display: block; transform: translate3d(0px, 0px, 0px);">
	
<!--  	            <div class="owl-item" style="width: 180px;"> -->
<!--  	              <div class="item">  -->
<!-- 	                <div class="img_block ib1"> -->
<!--  	                  <img src="/img/store_front.png" alt="Plantopia Store Front" class="img_inner"> -->
<!--  	                </div> -->
<!--  	              </div> -->
<!-- 	            </div> -->
	
 	            <div class="owl-item" style="width: 180px;">
 	              <div class="item">
 	                <div class="img_block ib1">
 	                  <img src="${pageContext.request.contextPath}/img/store_inside.png" alt="Inside Plantopia Store" class="img_inner">
 	                </div>
 	              </div>
 	            </div>
	
	          </div>
	        </div>
	      </div>
	      <p>서울특별시 성동구 성수일로 123, 플랜토피아 스토어</p>
	      <p>운영시간: 평일 09:00–18:00</p>
	    </div>
	
	    <!-- Contact Information -->
	    <div class="grid_4 prefix_1">
	      <h3>Contact Information</h3>
	      <p class="col1">
	        전화: 02-1234-5678<br>
	        이메일: support@plantopia.com
	      </p>
	      <p>고객센터 운영시간: 평일 09:00–18:00</p>
	    </div>
	
	    <!-- Follow Us -->
		<div class="grid_4">
		  <h3>Follow Us</h3>
		  <p>Plantopia의 새로운 소식과 이벤트를 SNS에서 만나보세요.</p>
		  <ul class="social-links">
		    <li><a href="https://www.facebook.com/plantopia" target="_blank"><i class="bi bi-facebook"></i> Facebook</a></li>
		    <li><a href="https://www.instagram.com/plantopia" target="_blank"><i class="bi bi-instagram"></i> Instagram</a></li>
		    <li><a href="https://www.twitter.com/plantopia" target="_blank"><i class="bi bi-twitter"></i> Twitter</a></li>
		  </ul>
		</div>
	  </div>
	</div>
  <%@ include file="../Main/footer.jsp" %>	
</body>
</html>