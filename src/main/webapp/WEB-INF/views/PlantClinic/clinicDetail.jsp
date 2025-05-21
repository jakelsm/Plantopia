<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap 5 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 웹 아이콘 설정 -->
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
<title>클리닉 상세보기</title>
	 <style>
       .comment {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f4fff4;
        }
        
		.comment.reply {
		   background-color: #e3f2fd; /* 연한 하늘색 */
		}
        .stars {
            color: gold;
            font-size: 18px;
        }
        .star {
        font-size: 25px;
        cursor: pointer;
        position: relative;
        transition: transform 0.2s ease, color 0.2s ease, opacity 0.2s ease;
    	}
        .star.animate {
            transform: scale(1.4);
            color: orange;
            opacity: 0;
        }
        /* 반짝이는 효과 추가 */
	    .star::after {
	        content: "\2729"; /* ✩ (U+2729) */
	        position: absolute;
	        top: -10px;
	        left: -10px;
	        font-size: 20px;
	        color: gold;
	        opacity: 0;
	        transform: scale(0.5);
	        pointer-events: none;
	        animation: sparkle 0.6s ease-out forwards;
	        display: none; /* 기본 숨김 */
	    }
        .star.sparkle::after {
        display: block;
	    }
	    @keyframes sparkle {
	        0% {
	            opacity: 1;
	            transform: scale(1);
	        }
	        100% {
	            opacity: 0;
	            transform: scale(2);
	        }
	    }
        .star:hover {
            transform: scale(1.2);
            color: #ffa500;
        }
        .rated {
            color: gold;
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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	 <script>
	 function renderStars(score) {
		  let stars = '';
		  for (let i = 1; i <= 5; i++) {
		    stars += (i <= score ? '★' : '☆') + ' ';
		 }
		 return stars.trim();
		}
	 
	 function appendRatingHtml($commentBox, commentId, newRating, myRating, plcIdx) {
		    // 기존 별점 UI 제거
		    $commentBox.find('#avgRating-' + commentId).remove();
		    $commentBox.find('#myRating-' + commentId).remove();
		    $commentBox.find('form.deleteRatingForm').remove();
		    $commentBox.find('.stars').remove(); 

		 	// 댓글 내용 바로 아래에 삽입
		    $commentBox.find('.comment-body').after(
		    '<p class="stars" id="avgRating-' + commentId + '">' +
		        '평균 별점: ' + renderStars(Math.round(newRating)) + ' (' + newRating.toFixed(1) + '점)</p>' +
		    '<p class="stars" id="myRating-' + commentId + '">' +
		        '내 별점: ' + renderStars(myRating) + ' (' + myRating + '점)</p>' 
// 		        +
// 		    '<form class="deleteRatingForm" action="/Clinic/comment/rating/delete" method="post">' +
// 		        '<input type="hidden" name="plccom_idx" value="' + commentId + '" />' +
// 		        '<input type="hidden" name="plc_idx" value="' + plcIdx + '" />' +
// 		        '<input type="submit" value="별점 삭제" />' +
// 		        '</form>'
		    );
		}
	 
	 $(document).ready(function() {
	        // 별점을 클릭했을 때
		 $(document).on("click", ".star", function () {
		        var $clickedStar = $(this);
		        var rating = $clickedStar.data("rating");
		        var commentId = $clickedStar.data("comment-id");
		        var plcIdx = $clickedStar.data("plc-idx");

		        $clickedStar.addClass("animate");
		        setTimeout(function () {
		            $clickedStar.removeClass("animate");
		        }, 400); 
	
		    	 // 반짝이는 효과 추가
		        $clickedStar.addClass("sparkle");
		        setTimeout(function () {
		            $clickedStar.removeClass("sparkle");
		        }, 600);
		        
		        $.ajax({
		            url: '${pageContext.request.contextPath}/Clinic/comment/rate',
		            type: 'POST',
		            data: {
		                rating: rating,
		                plccom_idx: commentId,
		                plc_idx: plcIdx
		            },
		            success: function (response) {
		            	console.log("응답값:", response); // 디버깅용
		            	
		            	const res = typeof response === 'string' ? JSON.parse(response) : response;
		                const stars = $('.star[data-comment-id="' + commentId + '"]');
		                const $commentBox = stars.closest('.comment');

// 		                stars.each(function (index) {
// 		                    if (index < res.myRating) {
// 		                        $(this).addClass("rated");
// 		                    } else {
// 		                        $(this).removeClass("rated");
// 		                    }
// 		                });

		                appendRatingHtml($commentBox, commentId, res.newRating, res.myRating, plcIdx);
		                
		            },
		            error: function () {
		                console.log("별점 처리에 실패했습니다.");
		            }
		        });
		    });

		    $(document).on('submit', '.deleteRatingForm', function (e) {
		        e.preventDefault();
		        var form = $(this);
		        var commentId = form.find('input[name="plccom_idx"]').val();
		        var plcIdx = form.find('input[name="plc_idx"]').val();

		        $.ajax({
		            url: '${pageContext.request.contextPath}/Clinic/comment/rating/delete',
		            type: 'POST',
		            data: {
		                plccom_idx: commentId,
		                plc_idx: plcIdx
		            },
		            success: function () {
		                const $commentBox = form.closest('.comment');
		                $commentBox.find('#myRating-' + commentId).remove();
		                form.remove();

		                let rateHtml = '<p>별점 매기기:</p><div class="stars">';
		                for (let i = 1; i <= 5; i++) {
		                	  rateHtml += '<span class="star" data-rating="' + i + '" data-comment-id="' + commentId + '" data-plc-idx="' + plcIdx + '">★</span> ';  
		                	}
		                rateHtml += '</div>';
		                $commentBox.append(rateHtml);
		            },
		            error: function () {
		                console.log("별점 삭제에 실패했습니다.");
		            }
		        });
		    });
		});
	</script>
</head>
<body>
    <%@ include file="../Main/header.jsp" %>
      <div class="content">
	   <div class="container_12">
	    
	    <div class="grid_6">
	    <h3>클리닉 게시글 상세보기</h3>
		<div class="clear cl1"></div>
		<c:if test="${not empty clinic.plc_img}">
	        <p><img src="${pageContext.request.contextPath}/img/plantClinic/${clinic.plc_img}" alt="이미지" height="600"></p>
	    </c:if>
		</div>
		
		<div class="grid_6">
		<h3>&nbsp;</h3>
	    <div class="clear cl1"></div>
	    <span class="col1" style="font-size: 22px; font-weight: bold; color: #66bb66;">제목 : ${clinic.plc_title}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    조회수 : ${clinic.plc_hit_cnt} 
	    <p>&nbsp;</p>
	    <p>작성자 : ${clinic.writer}</p>
	    &nbsp;<br> 
	    <p style="font-size: 18px;">키우는 장소 🏠 ${clinic.growing_loc}</p>
	    <p style="font-size: 18px;">자라는 환경 ☀️ ${clinic.growth_con}</p>
	    <p style="font-size: 18px;">물 주는 방식 💧 ${clinic.watering}</p>
	    <p style="font-size: 18px;">마지막 분갈이 🪴 ${clinic.last_rep}</p>
	    <p style="font-size: 18px;">마지막 비료 시기 🌾 ${clinic.last_fert}</p>
	    <p style="font-size: 18px;">마지막 가지치기 ✂️ ${clinic.last_pruned}</p>
	    <p style="font-size: 18px;">식물이 자라는 위치 🌳 ${clinic.plant_pos}</p>
	    <p style="font-size: 18px;">병충해 피해 유무 🦠 ${clinic.pest_dmg}</p>
	    <p style="font-size: 18px;">변색 잎 여부 🌿 ${clinic.discolored}</p>
	    &nbsp;<br>
	    <p><span class="col1" style="font-size: 16px; color: #a8d5a2;">본문 : <c:out value="${clinic.plc_contents}" escapeXml="false"/></span></p>
	    </div>
	    
	    <div class="clear cl1"></div>
	    <div class="btns">
	    <a href="${pageContext.request.contextPath}/Clinic/clinicList" class="btn">목록으로</a>
	    
	    <c:if test="${not empty loginInfo}">
		    <c:if test="${loginInfo.user_authority == 'admin' or loginInfo.user_num == clinic.user_num}">
		            <a href="${pageContext.request.contextPath}/Clinic/clinicUpdate?plc_idx=${clinic.plc_idx}" class="btn">수정</a>
		            <a href="${pageContext.request.contextPath}/Clinic/clinicDelete?plc_idx=${clinic.plc_idx}" class="btn">삭제</a>
		    </c:if>
		</c:if>
	    </div>
	    
	    <div class="grid_12">
	    <hr>
	    <h3>댓글</h3>
	    <c:forEach var="comment" items="${commentList}">
	        <div class="comment ${comment.plccom_indent > 0 ? 'reply' : ''}" style="margin-left: ${comment.plccom_indent * 20}px">
	            <p>작성자: ${comment.writer}</p>
	            <p class="comment-body">댓글 내용 :${comment.plccom_contents}</p>
	
	            <!-- 평균 별점: 일반 댓글만 표시 -->
	           <c:if test="${comment.plccom_indent == 0}">
			    <div id="ratingDisplay-${comment.plccom_idx}" class="rating-section">
			        <c:if test="${not empty comment.avgRating}">
			            <p class="stars" id="avgRating-${comment.plccom_idx}">
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
			            <p class="stars" id="myRating-${comment.plccom_idx}">
			                내 별점:
			                <c:forEach var="i" begin="1" end="5">
			                    <c:choose>
			                        <c:when test="${i <= comment.myRating}">&#9733;</c:when>
			                        <c:otherwise>&#9734;</c:otherwise>
			                    </c:choose>
			                </c:forEach>
			                (${comment.myRating}점)
			            </p>
<!-- 			            <form class="deleteRatingForm" action="/Clinic/comment/rating/delete" method="post"> -->
<%-- 			                <input type="hidden" name="plccom_idx" value="${comment.plccom_idx}" /> --%>
<%-- 			                <input type="hidden" name="plc_idx" value="${clinic.plc_idx}" /> --%>
<!-- 			                <input type="submit" value="별점 삭제" /> -->
<!-- 			            </form> -->
			        </c:if>
			
			        <c:if test="${empty comment.myRating}">
			            <p>&nbsp;</p>
			            <div class="stars">
			                <span class="star" data-rating="1" data-comment-id="${comment.plccom_idx}" data-plc-idx="${clinic.plc_idx}">★</span>
			                <span class="star" data-rating="2" data-comment-id="${comment.plccom_idx}" data-plc-idx="${clinic.plc_idx}">★</span>
			                <span class="star" data-rating="3" data-comment-id="${comment.plccom_idx}" data-plc-idx="${clinic.plc_idx}">★</span>
			                <span class="star" data-rating="4" data-comment-id="${comment.plccom_idx}" data-plc-idx="${clinic.plc_idx}">★</span>
			                <span class="star" data-rating="5" data-comment-id="${comment.plccom_idx}" data-plc-idx="${clinic.plc_idx}">★</span>
			            </div>
			        </c:if>
			    </div>
			</c:if>
	
	            <!-- 수정/삭제 링크 -->
	            <p><a href="${pageContext.request.contextPath}/Clinic/comment/update?plccom_idx=${comment.plccom_idx}&plc_idx=${clinic.plc_idx}">수정 | </a>
	            <a href="${pageContext.request.contextPath}/Clinic/comment/delete?plccom_idx=${comment.plccom_idx}&plc_idx=${clinic.plc_idx}">삭제</a></p>
	
	            <!-- 대댓글 작성 -->
	            <form class="reply-form" action="${pageContext.request.contextPath}/Clinic/comment/write" method="post">
	                <input type="hidden" name="plc_idx" value="${clinic.plc_idx}" />
	                <input type="hidden" name="parentId" value="${comment.plccom_idx}" />
	                <textarea name="plccom_contents" rows="2" cols="50" placeholder="답글 작성"></textarea><br>
	                <input type="submit" value="답글 작성">
	            </form>
	        </div>
	    </c:forEach>
	
	    <hr>
	    <h3>댓글 작성</h3>
	    <form class="comment-form" action="${pageContext.request.contextPath}/Clinic/comment/write" method="post">
	        <input type="hidden" name="plc_idx" value="${clinic.plc_idx}" />
	        <textarea name="plccom_contents" rows="4" cols="50"></textarea><br>
	        <input type="submit" value="댓글 작성">
	    </form>
	    
	    </div>
      </div>
	  </div>
    <%@ include file="../Main/footer.jsp" %>
</body>
</html>