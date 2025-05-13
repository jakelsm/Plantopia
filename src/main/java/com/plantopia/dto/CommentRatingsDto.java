package com.plantopia.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentRatingsDto {
	private int cr_idx;         // 별점 고유 ID
    private int rating;         // 별점 값 (1~5)
    private int user_num;       // 사용자 ID (FK)
    private int plccom_idx; 	// 댓글 ID (FK)
}
