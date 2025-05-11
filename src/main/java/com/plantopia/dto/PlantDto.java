package com.plantopia.dto;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class PlantDto {
	private int pla_idx;
	private String pla_title;
	private String pla_contents;
	private String pla_img;
	private LocalDateTime pla_date;
	private int pla_hit_cnt;
	private int user_num; // 외래키
	private String writer; // 조회 시 닉네임 담는 용도
	
}
	