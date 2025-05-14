package com.plantopia.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlantDto {
	private int pla_idx;
	private String pla_title;
	private String pla_contents;
	private String pla_img;
	private LocalDateTime pla_date;
	private int pla_hit_cnt;
	private int user_num; // 외래키
	private String writer; // 조회 시 닉네임 담는 용도
	private int likeCount;      // PostLike 테이블에서 집계된 좋아요 수
}
	