package com.plantopia.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlantClinicCommentDto {
	 private int plccom_idx;           // 댓글 ID
	 private String plccom_contents;   // 댓글 내용
	 private LocalDateTime plccom_date;// 작성/수정일

	 private Integer plccom_root;      // 최상위 댓글 ID
	 private int plccom_step;          // 정렬 순서
	 private int plccom_indent;        // 들여쓰기 깊이

	 private int plc_idx;              // 게시글 ID (FK)
	 private int user_num;             // 작성자 ID (FK)
	 private String writer;            // 작성자 닉네임
	 
	 private Double avgRating;     	   // JSP에서 쓰이는 필드
	 private Integer myRating;         // JSP에서 쓰이는 필드
}
