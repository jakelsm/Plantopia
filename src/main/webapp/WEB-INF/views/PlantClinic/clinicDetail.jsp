<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
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
        .star {
            font-size: 25px;
            cursor: pointer;
        }
        .rated {
            color: gold;
        }
    </style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	 <script>
	 $(document).ready(function() {
	        // 별점을 클릭했을 때
	        $(".star").click(function() {
	            var rating = $(this).data("rating");  // 클릭된 별점 값
	            var commentId = $(this).data("comment-id");  // 댓글 ID
	            var plcIdx = $(this).data("plc-idx");  // 플랜트(클리닉) ID

	            // AJAX 요청
	            $.ajax({
	                url: '/Clinic/comment/rate',  // 별점 처리하는 서버 URL
	                type: 'POST',
	                data: {
	                    rating: rating,
	                    plccom_idx: commentId,  // 댓글 ID 파라미터 전달
	                    plc_idx: plcIdx  // 플랜트 ID 추가
	                },
	                success: function(response) {
	                    // 성공 시 별점 반영
	                    // 별점을 클릭한 후 UI 업데이트
	                    $(".star").each(function(index) {
	                        if (index < rating) {
	                            $(this).addClass("rated");  // 클릭한 별점 수 만큼 색상 변경
	                        } else {
	                            $(this).removeClass("rated");
	                        }
	                    });

	                    // 평균 별점 갱신 (서버에서 전달된 새로운 평균 별점)
	                    $("#currentRating").text(response.newRating);  // 새로운 평균 별점

	                    // 내 별점 갱신
	                    $("#myRating").text(response.myRating); // 사용자가 매긴 별점

	                    // 별점 UI 즉시 갱신 후, 페이지 내용도 업데이트 (avgRating은 avgRating에 반영)
	                    $("#currentRating").text(response.newRating);  // 평균 별점

	                    // 내 별점도 갱신
	                    $("#myRating").text(response.myRating); // 사용자가 매긴 별점
	                },
	                error: function() {
	                    // 실패 시 처리 (예: 별점 처리 실패)
	                    console.log("별점 처리에 실패했습니다.");
	                }
	            });
	        });
	    });
	</script>
</head>
<body>
    <h2>클리닉 상세보기</h2>

    <p>제목: ${clinic.plc_title}</p>
    <p>작성자: ${clinic.writer}</p>
    <p>조회수: ${clinic.plc_hit_cnt}</p>
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

            <!-- 평균 별점: 일반 댓글만 표시 -->
            <c:if test="${comment.plccom_indent == 0 && not empty comment.avgRating}">
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

            <!-- 내 별점: 일반 댓글만 표시 -->
            <c:if test="${comment.plccom_indent == 0 && not empty comment.myRating}">
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

            <!-- 별점 등록/수정: 일반 댓글만 표시 -->
            <c:if test="${comment.plccom_indent == 0 && empty comment.myRating}">
                <p>별점 매기기:</p>
                <div class="stars">
					<span class="star" data-rating="1" data-comment-id="${comment.plccom_idx}" data-plc-idx="${clinic.plc_idx}">★</span>
					<span class="star" data-rating="2" data-comment-id="${comment.plccom_idx}" data-plc-idx="${clinic.plc_idx}">★</span>
					<span class="star" data-rating="3" data-comment-id="${comment.plccom_idx}" data-plc-idx="${clinic.plc_idx}">★</span>
					<span class="star" data-rating="4" data-comment-id="${comment.plccom_idx}" data-plc-idx="${clinic.plc_idx}">★</span>
					<span class="star" data-rating="5" data-comment-id="${comment.plccom_idx}" data-plc-idx="${clinic.plc_idx}">★</span>
                </div>
            </c:if>

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
</body>
</html>