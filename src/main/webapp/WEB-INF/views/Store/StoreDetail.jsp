<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<style>
	.container {
		display: flex;
	    align-items: flex-start;
	    gap: 40px;
	    max-width: 1200px;
	    margin: 40px auto;
	    padding: 20px;
	    background: #fff;
	    border-radius: 8px;
	}
	
	.product-img img {
	    width: 500px;
	    height: 500px;
	    border-radius: 6px;
 	 }
	
	.product-detail {
	    flex: 1;
	    font-family: 'Noto Sans KR', sans-serif;
	  }
	
	.product-detail h1 {
	    font-size: 24px;
	    font-weight: bold;
	    margin-bottom: 10px;
	  }
	  
	 .product-detail .price {
	    font-size: 22px;
	    font-weight: bold;
	    color: #d9230f;
	    margin: 10px 0;
	  }
	  
	 .product-detail .desc {
	    font-size: 15px;
	    line-height: 1.6;
	    margin-bottom: 20px;
	    color: #444;
	  }
	  
	 .product-detail label {
	    font-weight: 600;
	  }
	  
	 .product-detail input[type="number"] {
	    width: 80px;
	    padding: 4px;
	    margin-left: 10px;
	  }
	  
	 .product-detail input[type="submit"] {
	    margin-top: 20px;
	    padding: 10px 20px;
	    background: #a3d977;
	    color: white;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	  }
  
	 .product-detail input[type="submit"]:hover {
	    background: #58c22e;
	  }
	  
	   hr {
	    margin: 40px 0 20px;
	  }
	  
	 .back-link {
	    display: inline-block;
	    margin-top: 30px;
	    padding: 6px 14px;
	    background-color: #eee;
	    border-radius: 4px;
	    text-decoration: none;
	    color: #333;
	  }
	  
	.back-link:hover {
	    background-color: #ccc;
	  }
	  
	.comment-section {
		  max-width: 1200px;
		  margin: 0 auto;
		  padding: 20px;
		  background: #fafafa;
		  border-radius: 8px;
		  font-family: 'Noto Sans KR', sans-serif;
		}
		
	.comment-form {
		  margin-bottom: 20px;
		}	
	.comment-form textarea {
	    width: 50%;
	    height: 80px;
	    padding: 8px;
	    margin-top: 10px;
	    resize: vertical;
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

	.comment-box {
	   	background-color: #fff;
	  	padding: 15px;
	  	margin-bottom: 16px;
	  	border-radius: 6px;
	  	border-bottom : 1px solid #c0c0c0;
	  }

	.comment-box p {
		 margin: 4px 0;
		 font-size: 14px;
		 color: #333;
	}

	.comment-box .actions a {
		  margin-left: 10px;
		  font-size: 13px;
		  color: #007bff;
		  text-decoration: none;
		}
		
	.comment-box .actions a:hover {
		  text-decoration: underline;
		}
	 
	 .center {
	 	max-width: 1200px;
		margin: 0 auto;
		padding: 20px;		
		font-family: 'Noto Sans KR', sans-serif;
	 }
	 
	  .product-detail .right{
	 	text-align : right;
	 }

	.action-btn {
	  padding: 6px 12px;
	  background-color: #f1f1f1;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  cursor: pointer;
	  margin-right: 5px;
	}

	.action-btn:hover {
	  background-color: #e0e0e0;
	}

</style>
<body>	
	<div class="container">
		<div class="product-img">		
			<img src="/img/store/${store.p_img}" alt="${store.p_name}" width="600" height="600"/> <br>
		</div>
		<div class="product-detail">
		<div class="right">
			<a href="getCartList?user_num=${user_num}">장바구니<i class="bi bi-cart"></i></a>
		</div>
			<form name="StoreDetail" id="StoreDetail" method="post" action="/addCart">
				<p><label>등록일 : </label><fmt:formatDate value="${store.p_addedDate}" pattern="yyyy-MM-dd HH:mm" /></p>
				<h1>${store.p_name}</h1>
				<div class="price">${store.p_price}원</div>
				<div class="desc"> ${store.p_description}</div>
				<hr>
							
				<input type="hidden" name="c_img" value="${store.p_img}">
				<input type="hidden" name="p_idx" value="${store.p_idx}">								
				<input type="hidden" name="c_price" value="${store.p_price}">
				
				<p><label>재고 수량 : </label>${store.p_stockQuantity}</p>
								
				<p>
					<label>수량 선택:</label>
					<input type="number" name="c_amount" value="1" min="1" max="${store.p_stockQuantity}">
				</p>
				<input type="submit" value="장바구니 담기">
				<c:if test="${userAuthority eq 'admin'}">
					<button type="button" class="action-btn" onclick="location.href='StoreUpdate?p_idx=${store.p_idx}'">수정</button>
					<button type="button" class="action-btn" onclick="location.href='StoreDelete?p_idx=${store.p_idx}'">삭제</button>
				</c:if>	
			</form>
		</div>
	</div>
	<div class="center">
	<a class="back-link" href="StoreMain">목록으로</a>
	</div>
	<hr>
	<h3 class="center">상품후기</h3>
	<div class="comment-section">
	<form class="comment-form" name="StoreComment" id="StoreComment" method="post" action="/addCommentProcess?p_idx=${store.p_idx}">
		<input type="hidden" name="p_idx" value="${store.p_idx}">		
			<c:if test="${not empty user_nickname}">
				<p><i class="bi bi-person-circle fs-4"></i> ${user_nickname}</p>				
			</c:if>
			후기입력 : <br>
			<textarea name="scom_contents" maxlength="200"></textarea><br>
		<input type="submit" value="후기등록">	
	</form>
	<c:forEach var="comment" items="${commentList}">
	<div class="comment-box">
		<p>닉네임 : ${comment.user_nickname}</p>
		<p>후기내용 : ${comment.scom_contents}</p>
		<c:if test="${user_num == comment.user_num}">
			<a href="CommentUpdate?scom_idx=${comment.scom_idx}&p_idx=${store.p_idx}">수정</a>
			<a href="CommentDelete?scom_idx=${comment.scom_idx}&p_idx=${store.p_idx}">삭제</a>
		</c:if>
		</div>
	</c:forEach>
	</div>
</body>
</html>