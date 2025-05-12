package com.plantopia.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlantCommentDto {
	private int placom_idx;           // 댓글 고유 ID
    private String placom_contents;   // 댓글 내용
    private LocalDateTime placom_date; // 작성/수정 시간

    private Integer placom_root;      // 최상위 댓글 ID (nullable)
    private int placom_step;          // 정렬 순서
    private int placom_indent;        // 들여쓰기 깊이

    private int user_num;             // 작성자 ID
    private int pla_idx;              // 게시글(식물) ID
    private String writer; // 댓글 작성자 닉네임
}
