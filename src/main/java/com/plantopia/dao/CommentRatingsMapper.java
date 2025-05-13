package com.plantopia.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CommentRatingsMapper {
	int insertRating(@Param("plccom_idx") int plccom_idx, @Param("user_num") int user_num, @Param("rating") int rating) throws Exception;
    int updateRating(@Param("plccom_idx") int plccom_idx, @Param("user_num") int user_num, @Param("rating") int rating) throws Exception;
    int deleteRating(@Param("plccom_idx") int plccom_idx, @Param("user_num") int user_num) throws Exception;
    Integer getRatingByUser(@Param("plccom_idx") int plccom_idx, @Param("user_num") int user_num) throws Exception;
    Double getAverageRating(@Param("plccom_idx") int plccom_idx) throws Exception;
}
