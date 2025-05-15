package com.plantopia.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CommentRatingsMapper {
	// 별점 등록
    int insertRating(@Param("plccom_idx") int plccom_idx, 
                     @Param("user_num") int user_num, 
                     @Param("rating") int rating) throws Exception;
    // 별점 수정
    int updateRating(@Param("plccom_idx") int plccom_idx, 
                     @Param("user_num") int user_num, 
                     @Param("rating") int rating) throws Exception;
    // 별점 삭제
    int deleteRating(@Param("plccom_idx") int plccom_idx, 
                     @Param("user_num") int user_num) throws Exception;
    // 사용자가 매긴 별점 조회
    Integer getRatingByUser(@Param("plccom_idx") int plccom_idx, 
                            @Param("user_num") int user_num) throws Exception;
    // 댓글의 평균 별점 조회
    Double getAverageRating(@Param("plccom_idx") int plccom_idx) throws Exception;
    // 댓글의 평균 별점 갱신 (평균 별점을 갱신하는 파라미터 추가)
    int updateCommentAverageRating(@Param("plccom_idx") int plccom_idx, 
                                   @Param("averageRating") double averageRating) throws Exception;
}
