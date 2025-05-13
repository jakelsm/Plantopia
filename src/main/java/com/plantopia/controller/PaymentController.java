package com.plantopia.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plantopia.dto.CartDto;
import com.plantopia.dto.PaymentVerifyRequest;
import com.plantopia.service.CartService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {

    private final IamportClient iamportClient;

    @Autowired
    public PaymentController(IamportClient iamportClient) {
        this.iamportClient = iamportClient;
    }
    
    @Autowired
    CartService cartService;	
    
    /**
     *  POST /verify/{imp_uid}
     *  - AJAX 콜백에서 imp_uid 만 서버로 전달
     *  - 아임포트로부터 실제 결제 정보 조회
     */
    @ResponseBody
    @RequestMapping("/verify/{imp_uid}")
    public IamportResponse<Payment> verifyPayment(
            @PathVariable("imp_uid") String impUid)
        throws IamportResponseException, IOException {
        return iamportClient.paymentByImpUid(impUid);
    }
    
    @PostMapping("/verifySelectedPayment")
    @ResponseBody
    public ResponseEntity<String> verifySelectedPayment(@RequestBody PaymentVerifyRequest dto)
            throws IamportResponseException, IOException, Exception {

        IamportResponse<Payment> iamportResponse = iamportClient.paymentByImpUid(dto.getImp_uid());
        Payment payment = iamportResponse.getResponse();
        int paidAmount = payment.getAmount().intValue();

        int expectedAmount = 0;
        for (Integer c_idx : dto.getC_idx_list()) {
            CartDto cart = cartService.getCartbyIdx(c_idx);
            expectedAmount += cart.getC_price();
        }

        if (paidAmount != expectedAmount) {
            return ResponseEntity.badRequest().body("결제 금액 불일치");
        }

        return ResponseEntity.ok("결제 검증 성공");
    }   
    
}
