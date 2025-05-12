package com.plantopia.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class StoreCommentDto {
	private int scom_idx; // 후기 고유 아이디
	private String scom_contents; // 후기 본문
	private int p_idx; // 스토어 제품 아이디
	private Integer user_num; // 사용자 고유 번호
}
