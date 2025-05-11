package com.plantopia.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PostLikeMapper {
	int insertLike(@Param("pla_idx") int pla_idx, @Param("user_num") int user_num) throws Exception;
    int deleteLike(@Param("pla_idx") int pla_idx, @Param("user_num") int user_num) throws Exception;
    int countLike(@Param("pla_idx") int pla_idx) throws Exception;
    int checkIfLiked(@Param("pla_idx") int pla_idx, @Param("user_num") int user_num) throws Exception;
}
