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
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="/img/favicon.ico">
<title>게시글 상세보기</title>
	<style>
	  .like-button {
	  font-size: 18px;
	  padding: 10px 20px;
	  border: none;
	  border-radius: 6px;
	  background-color: #e0f7fa; /* 연한 하늘색 배경 */
	  color: #00796b;            /* 진한 청록 글자 */
	  display: inline-flex;
	  align-items: center;
	  gap: 8px;
	  cursor: pointer;
	  transition: background-color 0.3s ease, transform 0.2s ease;
	}
	.like-button:hover {
	  background-color: #b2ebf2; /* hover 시 더 진한 하늘색 */
	  transform: scale(1.05);    /* 약간 커지는 효과 */
	}
	.like-button.active {
	  background-color: #ffcdd2;
	  color: #c62828;
	}	
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
  .like-count {
  font-size: 27px;
  margin-left: 10px;
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
	  background: #eaffea;
	}
	.comment-bubble.root::after {
	  content: "";
	  position: absolute;
	  bottom: -12px;
	  left: 18px;
	  border-width: 12px 12px 0 0;
	  border-style: solid;
	  border-color: #eaffea transparent transparent transparent;
	}
	
	/* 대댓글 (들여쓰기된): 파스텔 배경 + 오른쪽 아래 꼬리 */
	.comment-bubble.reply {
	  background: #e0f7fa;
	}
	.comment-bubble.reply::after {
	  content: "";
	  position: absolute;
	  bottom: -12px;
	  right: 18px;
	  border-width: 12px 0 0 12px;
	  border-style: solid;
	  border-color: #e0f7fa transparent transparent transparent;
	}

	.comment-form input[type="submit"] {
	  margin-top: 10px;
	  padding: 6px 16px;
	  background-color: #4caf50;
	  color: white;
	  border: none;
	  border-radius: 4px;
	  cursor: pointer;
	}
	
	.comment-form input[type="submit"]:hover {
	  background-color: #388e3c;
	}

	.reply-form input[type="submit"] {
	  margin-top: 10px;
	  padding: 6px 16px;
	  background-color: #b3e5fc;  /* 연한 하늘색 */
	  color: white;               /* 흰색 텍스트 */
	  border: none;
	  border-radius: 4px;
	  cursor: pointer;
	}
	
	.reply-form input[type="submit"]:hover {
	  background-color: #81d4fa; /* hover 시 약간 진한 하늘색 */
	}
	</style>
</head>
<body>
	<%@ include file="../Main/header.jsp" %>
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
	    <span class="col1" style="font-size: 22px; font-weight: bold; color: #66bb66;">제목 : ${plant.pla_title}</span><br>
	    조회수 : ${plant.pla_hit_cnt}
	    <p>작성자 : ${plant.writer} </p>
	    <p>내용 : ${plant.pla_contents} </p>
	    </div>
	    
	    <div class="grid_12" style="text-align: center;">
		    <!-- 좋아요 -->
		    <div class="clear cl1"></div>
			<button class="like-button ${userLiked ? 'active' : ''}" data-pla_idx="${plant.pla_idx}">
			  <span class="like-text">${userLiked ? '좋아요 취소' : '좋아요'}</span>
			  <svg class="heart-icon" width="30" height="28" viewBox="0 0 90.65 85.04">
			    <path class="heart-fill" 
			          d="M45.137,23.041c4.912-24.596,40.457-27.775,42.128-0.435
			             c1.398,22.88-21.333,40.717-42.128,50.522
			             M45.137,23.041C40.225-1.555,5.057-4.734,3.387,22.606
			             c-1.398,22.88,20.955,40.717,41.75,50.522"/>
			  </svg>
			</button> <span id="likeCount" class="like-count">${likeCount}</span>
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
				
				<p>
				  <a href="/Plant/plantList/comment/update?placom_idx=${comment.placom_idx}&pla_idx=${plant.pla_idx}">수정</a> |
				  <a href="/Plant/plantList/comment/delete?placom_idx=${comment.placom_idx}&pla_idx=${plant.pla_idx}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
				</p>
				
	            <!-- 대댓글 작성 폼 -->
	            <form class="reply-form" action="/Plant/plantList/comment" method="post" style="margin-top: 5px;">
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
		    <form class="comment-form" action="/Plant/plantList/comment" method="post">
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
	<%@ include file="../Main/footer.jsp" %>
</body>
</html>