package com.plantopia.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class TossPayDto {
    private int      payment_idx;
    private String   paymentKey;
    private String   type;
    private String   orderId;
    private String   method;
    private int      totalAmount;
    private int      balanceAmount;
    private LocalDateTime requestedAt;
    private String   cancels;
    private Integer  c_idx;
}
