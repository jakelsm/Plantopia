package com.plantopia.dto;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class StoreDto {
	private int p_idx; // 제품 고유 아이디
	private String p_name; // 제품명
	private String p_img; // 제품 이미지
	private int p_price; // 제품 가격
	private String p_description; // 제품 설명 
	private int p_stockQuantity; // 재고 수량
	private Timestamp p_addedDate; // 등록 날짜
}
