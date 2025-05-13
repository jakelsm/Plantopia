package com.plantopia.dto;

import java.util.List;

import lombok.Data;

@Data
public class PaymentVerifyRequest {
	private String imp_uid;
    private String merchant_uid;
    private List<Integer> c_idx_list;
}
