package com.plantopia.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PlantDto {
	private int plaIdx;
	private String plaTitle;
	private String plaContents;
	private String plaImg;
	private LocalDateTime plaDate;
	private int plaHitCnt;
	private int userNum;
}
