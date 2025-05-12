package com.plantopia.dto;

import lombok.Data;

@Data
public class UserWithScomDto {
	private int scom_idx;
	private String scom_contents;
	private int user_num;
	private String user_nickname;
}
