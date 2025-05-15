<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
	<style>
		.like-button {
		    background-color: #f0f0f0;
		    border: 1px solid #ccc;
		    padding: 5px 10px;
		    cursor: pointer;
		}
		
		.like-button:hover {
		    background-color: #e0e0e0;
		}
		
		.like-button:active {
		    background-color: #d0d0d0;
		}
	</style>
</head>
<body>
	<h3>게시글 상세보기</h3>
    제목 : ${plant.pla_title} <br>
    작성자 : ${plant.writer} <br>
    <p>조회수 : ${plant.pla_hit_cnt}</p>
    <img src="/img/plant/${plant.pla_img}" alt="#" width="300" height="300"/> <br>
    내용 : ${plant.pla_contents} <br>
    
    <p> 좋아요 수 : ${likeCount} </p>

    <!-- 좋아요 버튼 -->
    <button class="like-button" data-pla_idx="${plant.pla_idx}">
        ${userLiked ? '좋아요 취소' : '좋아요'}
    </button>

    <!-- 댓글 목록 출력 -->
    <h3>댓글</h3>
    <c:forEach var="comment" items="${commentList}">
        <div style="margin-left: ${comment.placom_indent * 20}px; border: 1px solid #ccc; padding: 5px; margin-bottom: 5px;">
            <p><strong>작성자:</strong> ${comment.writer}</p>
            <p><strong>댓글 내용:</strong> ${comment.placom_contents}</p>

            <!-- 대댓글 작성 폼 -->
            <form action="/Plant/plantList/comment" method="post" style="margin-top: 5px;">
                <input type="hidden" name="pla_idx" value="${plant.pla_idx}" />
                <input type="hidden" name="placom_root" value="${comment.placom_root}" />
                <input type="hidden" name="placom_indent" value="${comment.placom_indent}" />
                <textarea name="placom_contents" placeholder="답글을 입력하세요" rows="2" cols="50"></textarea><br>
                <input type="submit" value="답글 작성" />
            </form>
        </div>
    </c:forEach>

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
        $(document).ready(function() {
            $(".like-button").click(function() {
                var pla_idx = $(this).data("pla_idx"); // 게시글 ID 가져오기
                var button = $(this);
                
                $.ajax({
                    type: "GET",
                    url: "/Plant/plantList/detail/like",
                    data: { pla_idx: pla_idx },
                    success: function(response) {
                        if (response === "liked") {
                            button.text("좋아요 취소");
                        } else {
                            button.text("좋아요");
                        }
                    },
                    error: function() {
                        alert("오류가 발생했습니다.");
                    }
                });
            });
        });
    </script>
	
</body>
</html>