package com.plantopia.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.plantopia.dto.ProfileDto;

@Mapper
public interface IProfileDao {
    /**
     * Profile 테이블과 User 테이블을 JOIN
     * 로그인된 user_num 으로 닉네임·이메일 조회
     */
    ProfileDto selectProfileByUserNum(@Param("user_num") int userNum);
    /** 회원가입 직후 user_num 으로 프로필 기본 레코드 삽입 */
    int insertProfile(@Param("user_num") int userNum);
    // 내가 작성한 댓글에 달린 별점의 평균
    Double selectAverageRatingByUserNum(@Param("user_num") int userNum);
}