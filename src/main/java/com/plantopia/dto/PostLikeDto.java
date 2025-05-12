package com.plantopia.dto;

import lombok.Builder;
import lombok.Data;

@Data
public class PostLikeDto {
	private int pl_idx;           // 좋아요 고유 ID
    private int pla_idx;          // 게시글 ID (FK)
    private int user_num;         // 사용자 ID (FK)
}
