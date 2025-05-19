<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap 5 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nunito:400" rel="stylesheet" type="text/css">
<title>게시글 상세보기</title>
	<style>
	.heart-icon {
    vertical-align: middle;
  }

  .heart-fill {
    fill: none;
    stroke: #ccc;
    stroke-width: 5;
    stroke-linecap: round;
    stroke-linejoin: round;
    transition: fill 0.4s ease, stroke 0.4s ease;
  }

  .like-button.active .heart-fill {
    fill: #ec6d46;
    stroke: #ec6d46;
  }
  
	  /* 공통 말풍선 스타일 */
	.comment-bubble {
	  position: relative;
	  border: 1px solid #ccc;
	  border-radius: 10px;
	  padding: 10px 15px;
	  display: inline-block;
	  max-width: 500px;
	  margin-bottom: 5px;
	}
	
	/* 댓글 (최상위):  + 왼쪽 아래 꼬리 */
	.comment-bubble.root {
	  background: #e6f4e6;
	}
	.comment-bubble.root::after {
	  content: "";
	  position: absolute;
	  bottom: -10px;
	  left: 20px;
	  border-width: 10px 10px 0 0;
	  border-style: solid;
	  border-color: #e6f4e6 transparent transparent transparent;
	}
	
	/* 대댓글 (들여쓰기된): 파스텔 배경 + 오른쪽 아래 꼬리 */
	.comment-bubble.reply {
	  background: #e0f7fa;
	}
	.comment-bubble.reply::after {
	  content: "";
	  position: absolute;
	  bottom: -10px;
	  right: 20px;
	  border-width: 10px 0 0 10px;
	  border-style: solid;
	  border-color: #e0f7fa transparent transparent transparent;
	}

	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/Main/header.jsp" %>
	  <div class="content">
	   <div class="container_12">
		
		<div class="grid_7">		 	
		<h3>게시글 상세보기</h3>
		<div class="clear cl1"></div>
		<img src="/img/plant/${plant.pla_img}" alt="#" height="600"/>
	    </div>
	    
	    <div class="grid_5">
	    <h3>&nbsp;</h3>
	    <div class="clear cl1"></div>
	    <p><span class="col1">제목 : ${plant.pla_title}</span></p> 
	    작성자 : ${plant.writer} <br>
	    <p>조회수 : ${plant.pla_hit_cnt}</p>
	    <p>내용 : ${plant.pla_contents} </p>
	    </div>
	    
	    <div class="grid_12" style="text-align: center;">
		    <!-- 좋아요 -->
		    <div class="clear cl1"></div>
			<button class="like-button ${userLiked ? 'active' : ''}" data-pla_idx="${plant.pla_idx}">
			  <span class="like-text">${userLiked ? '좋아요 취소' : '좋아요'}</span>
			  <svg class="heart-icon" width="24" height="22" viewBox="0 0 90.65 85.04">
			    <path class="heart-fill" 
			          d="M45.137,23.041c4.912-24.596,40.457-27.775,42.128-0.435
			             c1.398,22.88-21.333,40.717-42.128,50.522
			             M45.137,23.041C40.225-1.555,5.057-4.734,3.387,22.606
			             c-1.398,22.88,20.955,40.717,41.75,50.522"/>
			  </svg>
			</button> <span id="likeCount">${likeCount}</span>
		
			
			<div class="btns">
			<!-- 글 목록으로 이동 -->
			<p><a href="/Plant/plantList" class="btn">목록으로</a></p>
		
			<!-- 로그인 상태일 때만 검사 -->
			<c:if test="${not empty loginInfo}">
			    <!-- admin 이거나, 내가 쓴 글이면 버튼 보임 -->
			    <c:if test="${loginInfo.user_authority eq 'admin' or loginInfo.user_num eq plant.user_num}">
			            <a href="<c:url value='/Plant/plantUpdate?pla_idx=${plant.pla_idx}'/>" class="btn">수정</a> | 
			            <a href="<c:url value='/Plant/plantdelete?pla_idx=${plant.pla_idx}'/>" class="btn">삭제</a>
			    </c:if>
			</c:if>
			</div>
		</div>	
		
		<div class="grid_12">
		<hr>	
	    <!-- 댓글 목록 출력 -->
	    <h3>댓글</h3>
	    <c:forEach var="comment" items="${commentList}">
	        <c:if test="${comment.placom_indent == 0}">
	        	<div class="clear cl1"></div>
	    	</c:if>
	        
	        <div style="margin-left: ${comment.placom_indent * 20}px;">
		        <c:choose>
			        <c:when test="${comment.placom_indent == 0}">
			            <div class="comment-bubble root">
			                <p><strong>${comment.placom_contents}</strong></p>
			            </div>
			        </c:when>
			        <c:otherwise>
			            <div class="comment-bubble reply">
			                <p><strong>${comment.placom_contents}</strong></p>
			            </div>
			        </c:otherwise>
			    </c:choose>
	            
	            <p><strong>${comment.writer}</strong></p>
				
	            <!-- 대댓글 작성 폼 -->
	            <form action="/Plant/plantList/comment" method="post" style="margin-top: 5px;">
	                <input type="hidden" name="pla_idx" value="${plant.pla_idx}" />
	                <input type="hidden" name="placom_root" value="${comment.placom_root}" />
	                <input type="hidden" name="placom_indent" value="${comment.placom_indent}" />
	                <textarea name="placom_contents" placeholder="답글을 입력하세요" rows="2" cols="50"></textarea><br>
	                <p><input type="submit" value="답글 작성" /></p>
	            </form>
	         </div>
	    </c:forEach>
	
		<div class="clear cl1"></div>	
	    <!-- 최상위 댓글 작성 폼 -->
		    <h4>댓글 작성</h4>
		    <form action="/Plant/plantList/comment" method="post">
		        <input type="hidden" name="pla_idx" value="${plant.pla_idx}" />
		        <textarea name="placom_contents" placeholder="댓글을 입력하세요" rows="3" cols="60"></textarea><br>
		        <input type="submit" value="댓글 등록" />
		    </form>
	
	    <!-- AJAX 코드 추가 -->
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	    <script>
	    $(document).ready(function () {
	    	  $('.like-button').click(function () {
	    	    const pla_idx = $(this).data('pla_idx');
	    	    const button = $(this);
	    	    const text = $(this).find('.like-text');
	    	    const likeCountSpan = $('#likeCount');
	
	    	    $.ajax({
	    	      type: 'GET',
	    	      url: '/Plant/plantList/detail/like',
	    	      data: { pla_idx: pla_idx },
	    	      success: function (response) {
	    	    	  if (response.result === 'liked') {
	    	    	    button.addClass('active');
	    	    	    text.text('좋아요 취소');
	    	    	  } else {
	    	    	    button.removeClass('active');
	    	    	    text.text('좋아요');
	    	    	  }
	    	    	  likeCountSpan.text(response.likeCount);
	    	    	},
	    	      error: function () {
	    	        alert('오류가 발생했습니다.');
	    	        button.removeClass('active');
	    	      },
	    	    });
	    	  });
	    	});
	    </script>
	    </div>
	  </div>
	  </div>
	<%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>