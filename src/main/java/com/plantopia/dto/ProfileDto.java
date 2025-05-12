package com.plantopia.dto;

import lombok.Data;

@Data
public class ProfileDto {
    private int pro_num;          // Profile 테이블 PK
    private int user_num;         // User 테이블 FK
    private String userNickname;  // User.user_nickname
    private String userEmail;     // User.user_email
}
