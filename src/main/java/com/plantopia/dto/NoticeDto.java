package com.plantopia.dto;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class NoticeDto {
	private int n_idx;
	private String n_title;
	private String n_contents;
	private String n_img;
	private Timestamp n_date;
}
