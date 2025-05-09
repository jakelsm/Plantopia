package com.plantopia.dto;

import lombok.Data;

@Data
public class CartDto {
	private int c_idx; // 장바구니 고유 아이디
	private String pname; // 제품 이름 
	private String cimg; // 제품 사진 
	private int cprice; // 제품 합산 가격
	private int c_amount; // 제품 수량
	private int p_idx; // 제품 고유 아이디
	private Integer user_num; // 유저 고유 아이디
}
