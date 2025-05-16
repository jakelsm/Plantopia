<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<style>
	.container {
		display : grid;
		grid-template-columns: repeat(4, 1fr);
		gap : 20px;
		padding : 20px;
	}
	
	.pagination {
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
	
</style>
<body>
  <%@ include file="/WEB-INF/views/Main/header.jsp" %>
	<div class="content">
	 <div class="container_12">
	 <div class="grid_12">
		<h3>게시판 목록</h3>
		<a href="/Plant/plantWrite">글쓰기</a>
		<table border="1" width="600">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<c:if test="${showAction}">
	        		<th>관리</th>
	      		</c:if>
			</tr>
			<c:forEach var="dto" items="${plantList}">
			<tr>
	  		  <td>${dto.pla_idx}</td>
		      <td><a href="<c:url value='/Plant/plantDetail?pla_idx=${dto.pla_idx}'/>">${dto.pla_title}</a></td>
			  <td>${dto.writer}</td>
			  	<!-- 로그인 상태일 때만 검사 -->
	          	<c:if test="${not empty loginInfo}">
		            <!-- admin 이거나, 내가 쓴 글이면 버튼 보임 -->
		            <c:if test="${loginInfo.user_authority eq 'admin' or loginInfo.user_num eq dto.user_num}">
		            <td>
					  	<a href="<c:url value='/Plant/plantUpdate?pla_idx=${dto.pla_idx}'/>">수정</a> | 
					  	<a href="<c:url value='/Plant/plantdelete?pla_idx=${dto.pla_idx}'/>">삭제</a>
					</td>
					</c:if>
	          	</c:if>
			</tr>
			</c:forEach>
		</table>
				
		<form action="/Plant/plantList" method="get">
		    <input type="text" name="search" placeholder="제목을 입력하세요.">
		    <button type="submit">검색</button>
		</form>
		
		<!-- 페이징 처리 -->
	<div class="pagination">
	    <!-- 이전 버튼 -->
	    <c:if test="${currentPage > 1}">
	        <a href="/Plant/plantList?page=${currentPage - 1}&search=${param.search}">이전</a>
	    </c:if>
	
	    <!-- 페이지 번호 -->
	    <c:forEach var="i" begin="1" end="${totalPage}">
	        <a href="/Plant/plantList?page=${i}&search=${param.search}" class="${i == currentPage ? 'active' : ''}">${i}</a>
	    </c:forEach>
	
	    <!-- 다음 버튼 -->
	    <c:if test="${currentPage < totalPage}">
	        <a href="/Plant/plantList?page=${currentPage + 1}&search=${param.search}">다음</a>
	    </c:if>
	</div>
	</div>
	</div>	
  </div>	
  <%@ include file="/WEB-INF/views/Main/footer.jsp" %>	
</body>
</html>