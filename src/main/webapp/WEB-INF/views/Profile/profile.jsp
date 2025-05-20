<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>내 프로필</title>
  <!-- 공통 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/grid.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <!-- 프로필 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
  <!-- 웹 아이콘 설정 -->
  <link rel="icon" href="/img/favicon.ico">
</head>
<body>
  <div class="container_12 profile-container">
	  <!-- 프로필 정보 박스 -->
	  <div class="white-box">
	  	<h3>내 정보</h3>
	      <table class="profile-table">
	        <tr><th>닉네임</th><td>${profile.userNickname}</td></tr>
	        <tr><th>이메일</th><td>${profile.userEmail}</td></tr>
	        <tr><th>평균 별점</th><td>${avgRating} ★</td></tr>
	      </table>
	
	    <p class="btn-group">
	      <a href="accountUpdate?user_num=${profile.user_num}" class="btn btn-primary">회원정보수정</a>
	      <a href="accountDelete?user_num=${profile.user_num}" class="btn btn-danger">회원탈퇴</a>
	    </p>
	  </div>
	  
	  <div class="white-box">
	  	<h3>Plant게시판 작성글 목록</h3>
	      <c:if test="${empty myPosts}">
	        <p>아직 작성하신 글이 없습니다.</p>
	      </c:if>
	      <c:if test="${not empty myPosts}">
	        <table class="list-table">
	          <thead>
	            <tr><th>번호</th><th>제목</th><th>작성일</th></tr>
	          </thead>
	          <tbody>
	          <c:forEach var="post" items="${myPosts}">
	            <tr>
	              <td>${post.pla_idx}</td>
	              <td>
	                <a href="${pageContext.request.contextPath}/Plant/plantDetail?pla_idx=${post.pla_idx}">
	                  ${post.pla_title}
	                </a>
	              </td>
	              <td>${post.pla_date}</td>
	            </tr>
	          </c:forEach>
	          </tbody>
	        </table>
	        <!-- Plant 게시판 페이징 -->
		    <c:if test="${totalPlantPage > 1}">
		      <div class="pagination">
		        <c:if test="${currentPlantPage > 1}">
		          <a href="?plantPage=${currentPlantPage - 1}&clinicPage=${currentClinicPage}">이전</a>
		        </c:if>
		        <c:forEach var="i" begin="1" end="${totalPlantPage}">
		          <c:choose>
		            <c:when test="${i == currentPlantPage}">
		              <span class="active">${i}</span>
		            </c:when>
		            <c:otherwise>
		              <a href="?plantPage=${i}&clinicPage=${currentClinicPage}">${i}</a>
		            </c:otherwise>
		          </c:choose>
		        </c:forEach>
		        <c:if test="${currentPlantPage < totalPlantPage}">
		          <a href="?plantPage=${currentPlantPage + 1}&clinicPage=${currentClinicPage}">다음</a>
		        </c:if>
		      </div>
		    </c:if>
		  </c:if>
	  </div>
	  
	  <div class="white-box">
	  	<h3>PlantClinic게시판 작성글 목록</h3>
	      <c:if test="${not empty clinicList}">
	        <table class="list-table">
	          <thead><tr><th>번호</th><th>제목</th><th>작성일</th></tr></thead>
	          <tbody>
	          <c:forEach var="dto" items="${clinicList}">
	            <tr>
	              <td>${dto.plc_idx}</td>
	              <td>
	                <a href="<c:url value='/Clinic/clinicDetail?plc_idx=${dto.plc_idx}'/>">
	                  ${dto.plc_title}
	                </a>
	              </td>
	              <td>${dto.plc_date}</td>
	            </tr>
	          </c:forEach>
	          </tbody>
	        </table>
	        <!-- Clinic 게시판 페이징 -->
		    <c:if test="${totalClinicPage > 1}">
		      <div class="pagination">
		        <c:if test="${currentClinicPage > 1}">
		          <a href="?plantPage=${currentPlantPage}&clinicPage=${currentClinicPage - 1}">이전</a>
		        </c:if>
		        <c:forEach var="i" begin="1" end="${totalClinicPage}">
		          <c:choose>
		            <c:when test="${i == currentClinicPage}">
		              <span class="active">${i}</span>
		            </c:when>
		            <c:otherwise>
		              <a href="?plantPage=${currentPlantPage}&clinicPage=${i}">${i}</a>
		            </c:otherwise>
		          </c:choose>
		        </c:forEach>
		        <c:if test="${currentClinicPage < totalClinicPage}">
		          <a href="?plantPage=${currentPlantPage}&clinicPage=${currentClinicPage + 1}">다음</a>
		        </c:if>
		      </div>
		    </c:if>
	      </c:if>
	      <c:if test="${empty clinicList}">
	        <p>작성한 글이 없습니다.</p>
	      </c:if>
	 </div>
	<p class="btn-group">
		<a href="${pageContext.request.contextPath}/Main" class="btn btn-secondary">⬅️ 메인으로 돌아가기</a>
		<a href="<c:url value='/logout'/>" class="btn btn-secondary">🚪 로그아웃</a>
	</p>
  </div>
</body>
</html>
