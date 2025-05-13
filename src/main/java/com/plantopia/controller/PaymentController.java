package com.plantopia.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
