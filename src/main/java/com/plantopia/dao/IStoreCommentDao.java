package com.plantopia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.plantopia.dto.StoreCommentDto;

@Mapper
public interface IStoreCommentDao {
		// 1. 스토어 후기 보기
		//public List<StoreCommentDto> getCommentByProduct(@Param("p_idx") int p_idx) throws Exception;
		
		// 2. 특정 스토어 후기 하나만 보기
		public StoreCommentDto getCommentByIdx(@Param("scom_idx") int scom_idx) throws Exception;
		
		// 3. 스토어 후기 작성 
		public int insertStoreComment(StoreCommentDto storeCommentDto) throws Exception;
		
		// 4. 스토어 후기 수정
		public int updateStoreComment(StoreCommentDto storeCommentDto) throws Exception;
		
		// 5. 스토어 후기 삭제
		public int deleteStoreComment(@Param("scom_idx") int scom_idx) throws Exception;
		
		// 6. 스토어 후기 페이징 기능 
		
}
