<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 리스트</title>
<script src="/js/CartPay.js"></script>
<!-- jQuery (아임포트 SDK 콜백에서 $.ajax 를 쓰고 싶다면) -->
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <!-- 아임포트 결제 SDK -->
  <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  <link rel="stylesheet" href="/CSS/cartList.css" type="text/css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <script>
    // 가맹점 식별코드(아임포트 콘솔에서 발급된 Client Key)
    const IMP = window.IMP;
    IMP.init('imp15756525');

    // cartIdx, merchantUid, amount 를 받아서 결제창 호출
//     function requestPay(pg, merchantUid, amount) {
//       IMP.request_pay({
//         pg: pg,
//         pay_method: 'card',
//         merchant_uid: merchantUid,
//         name: '플랜토피아 상품',
//         amount: amount,
//         buyer_email: 'buyer@example.com',
//         buyer_name: '홍길동',
//         buyer_tel: '010-1234-5678',
//       }, function(rsp) {
//         if (rsp.success) {
//           // imp_uid 로 서버 검증 (예: /verify/{imp_uid} 로 POST)
//           $.ajax({
//             url: '${pageContext.request.contextPath}/verify/' + rsp.imp_uid,
//             type: 'POST'
//           }).done(function(data) {
//             if (rsp.paid_amount === data.response.amount) {
//               alert('결제 성공!');
//               location.href = '${pageContext.request.contextPath}/StoreMain';
//             } else {
//               alert('검증 실패: 결제 금액이 일치하지 않습니다.');
//             }
//           }).fail(function(err){
//             alert('검증 중 에러 발생');
//           });
//         } else {
//           alert('결제 실패: ' + rsp.error_msg);
//         }
//       });
//     }   
    	$(document).ready(function () {
	        // 총합 계산 선택 결제 버튼 클릭
	        $('.item-check').on('change', function () {
	          let total = 0;
	          $('.item-check:checked').each(function () {
	            total += parseInt($(this).data('price'));
	          });
	          $('#totalPrice').text(total.toLocaleString());
	        });
	        
	        $('#selectedPayBtn').on('click', function () {
	          const selected = [];
	          let totalAmount = 0;
	
	          $('.item-check:checked').each(function () {
	            const cidx = $(this).data('cidx');
	            const price = $(this).data('price');
	            selected.push(cidx);
	            totalAmount += parseInt(price);
	          });
			
	          // select된 가맹점 받아서 결제창 호출
	          if (selected.length === 0) {
	            alert("선택된 항목이 없습니다.");
	            return;
	          }
	
	          const pg = $('#pg-select').val(); // 선택된 PG사
	          const merchantUid = 'multi-' + new Date().getTime();
	
	          IMP.request_pay({
	            pg: pg,
	            pay_method: 'card',
	            merchant_uid: merchantUid,
	            name: '선택한 플랜토피아 상품들',
	            amount: totalAmount,
	            buyer_email: 'buyer@example.com',
	            buyer_name: '홍길동',
	            buyer_tel: '010-1234-5678',
	          }, function (rsp) {
	            if (rsp.success) {
	              $.ajax({
	                url: '${pageContext.request.contextPath}/verifySelectedPayment',
	                type: 'POST',
	                contentType: 'application/json',
	                data: JSON.stringify({
	                  imp_uid: rsp.imp_uid,
	                  merchant_uid: merchantUid,
	                  c_idx_list: selected
	                }),
	                success: function () {
	                  alert('결제 성공!');
	                  location.href = '${pageContext.request.contextPath}/StoreMain';
	                },
	                error: function () {
	                  alert('서버 검증 실패');
	                }
	              });
	            } else {
	              alert('결제 실패: ' + rsp.error_msg);
	            }
	          });
	        });	
	      });    
  </script>
</head>
<body>
	<div class="cart-wrapper">
  
  <c:forEach var="cart" items="${cartList}">
    <div class="cart-box">
      <div class="cart-item">
        <input type="checkbox" class="item-check" data-price="${cart.c_price}" data-cidx="${cart.c_idx}" style="margin-right:10px;">
        <img src="/img/store/${cart.c_img}" alt="${cart.p_name}">
        <div class="cart-info">
          <a href="StoreDetail?p_idx=${cart.p_idx}">${cart.p_name}</a>
          <p>가격: ${cart.c_price}원</p>
          <p>수량: ${cart.c_amount}</p>
          <div class="cart-actions">
           <a href="#" onclick="window.open('CartUpdate?c_idx=${cart.c_idx}&user_num=${cart.user_num}','cartUpdatePopup', 
                        'width=500,height=400,top=200,left=300,resizable=no,scrollbars=yes'); return false;">수정</a>
            <a href="CartDelete?c_idx=${cart.c_idx}&user_num=${cart.user_num}">삭제</a>
          </div>
        </div>
      </div>
    </div>
  </c:forEach>
  
  <div class="select-payment">
    <div>
      <label>결제수단 선택: </label>
      <select id="pg-select">
        <option value="tosspay.tosstest">토스페이</option>
        <option value="kakaopay.TC0ONETIME">카카오페이</option>
        <option value="payco.PARTNERTEST">페이코</option>
        <option value="smilepay.cnstest25m">스마일페이</option>
      </select>
    </div>
    <div>
      	선택한 상품 총액: <strong id="totalPrice">0</strong> 원
      	<button type="button" id="selectedPayBtn">선택 상품 결제하기</button>
    </div>
  </div>

 	<div style="display: flex; justify-content: center; margin-top: 20px;">
        <button type="button" class="action-btn" onclick="location.href='StoreMain'"><i class="bi bi-list"></i>스토어목록</button>
    </div>
</div>
</body>
</html>