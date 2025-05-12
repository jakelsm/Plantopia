<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 리스트</title>
<!-- jQuery (아임포트 SDK 콜백에서 $.ajax 를 쓰고 싶다면) -->
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <!-- 아임포트 결제 SDK -->
  <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  <script>
    // 가맹점 식별코드(아임포트 콘솔에서 발급된 Client Key)
    const IMP = window.IMP;
    IMP.init('imp15756525');

    // cartIdx, merchantUid, amount 를 받아서 결제창 호출
    function requestPay(pg, merchantUid, amount) {
      IMP.request_pay({
        pg: pg,
        pay_method: 'card',
        merchant_uid: merchantUid,
        name: '플랜토피아 상품',
        amount: amount,
        buyer_email: 'buyer@example.com',
        buyer_name: '홍길동',
        buyer_tel: '010-1234-5678',
      }, function(rsp) {
        if (rsp.success) {
          // imp_uid 로 서버 검증 (예: /verify/{imp_uid} 로 POST)
          $.ajax({
            url: '${pageContext.request.contextPath}/verify/' + rsp.imp_uid,
            type: 'POST'
          }).done(function(data) {
            if (rsp.paid_amount === data.response.amount) {
              alert('결제 성공!');
              location.href = '${pageContext.request.contextPath}/StoreMain';
            } else {
              alert('검증 실패: 결제 금액이 일치하지 않습니다.');
            }
          }).fail(function(err){
            alert('검증 중 에러 발생');
          });
        } else {
          alert('결제 실패: ' + rsp.error_msg);
        }
      });
    }
  </script>
</head>
<body>
	<a href="StoreMain">메인목록으로</a>
	<c:forEach var="cart" items="${cartList}">
		<div>
			<img src="/img/store/${cart.c_img}" width="150px">
			제품명 : ${cart.p_name} <br>
			가격 : ${cart.c_price} <br>
			수량 : ${cart.c_amount} <br>
			
			<!-- 아임포트 결제 버튼 -->
      		<!-- PG 코드, 주문ID, 금액을 모두 넘겨줍니다 -->
		      <button type="button"
		        onclick="requestPay(
		          'tosspay.tosstest',               /* PG 코드 */
		          '${cart.user_num}-${cart.c_idx}',  /* merchantUid */
		          ${cart.c_price}                   /* amount */
		        );">
		        토스페이 결제하기
		      </button>
		
		      <button type="button"
		        onclick="requestPay(
		          'kakaopay.TC0ONETIME',
		          '${cart.user_num}-${cart.c_idx}',
		          ${cart.c_price}
		        );">
		        카카오페이 결제하기
		      </button>
		
		      <button type="button"
		        onclick="requestPay(
		          'payco.PARTNERTEST',
		          '${cart.user_num}-${cart.c_idx}',
		          ${cart.c_price}
		        );">
		        페이코 결제하기
		      </button>
		
		      <button type="button"
		        onclick="requestPay(
		          'smilepay.cnstest25m',
		          '${cart.user_num}-${cart.c_idx}',
		          ${cart.c_price}
		        );">
		        스마일페이 결제하기
		      </button>
			
			<p>
				<a href="CartDelete?c_idx=${cart.c_idx}&user_num=${cart.user_num}">삭제</a>
				<a href="CartUpdate?c_idx=${cart.c_idx}&user_num=${cart.user_num}">수정</a>
			</p>
			<hr>
		</div>
	</c:forEach>
</body>
</html>