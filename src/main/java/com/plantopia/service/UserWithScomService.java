package com.plantopia.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.IUserWithScomDao;
import com.plantopia.dto.UserWithScomDto;

@Service
public class UserWithScomService {
	@Autowired
	IUserWithScomDao userWithScomDao;
	
	public List<UserWithScomDto> getCommentWithUserByProduct(@Param("p_idx") int p_idx) throws Exception{
		return userWithScomDao.getCommentWithUserByProduct(p_idx);
	}
}
