package com.plantopia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.plantopia.dto.UserWithScomDto;

@Mapper
public interface IUserWithScomDao {
	public List<UserWithScomDto> getCommentWithUserByProduct(@Param("p_idx") int p_idx) throws Exception;
}
