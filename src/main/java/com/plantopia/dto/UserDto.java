package com.plantopia.dto;

import lombok.Data;

@Data
public class UserDto {
	private int user_num;
	private String user_id;
	private String user_passwd;
	private String user_name;
	private String user_nickname;
	private String roadAddrPart1;
	private String addrDetail;
	private String zipNo;
	private String user_email;
	private String user_tel;
	private String user_authority;
}
