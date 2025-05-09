package com.plantopia.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.IStoreCommentDao;
import com.plantopia.dto.StoreCommentDto;

@Service
public class StoreCommentService {
		@Autowired
		IStoreCommentDao storeCommentDao;
	
		// 1. 스토어 후기 보기
		public List<StoreCommentDto> getCommentByProduct(@Param("p_idx") int p_idx) throws Exception{
			return storeCommentDao.getCommentByProduct(p_idx);
		}
		
		// 2. 특정 스토어 후기 하나만 보기 
		public StoreCommentDto getCommentByIdx(@Param("scom_idx") int scom_idx) throws Exception {
			return storeCommentDao.getCommentByIdx(scom_idx);
		}
		
		// 3. 스토어 후기 작성 
		public int insertStoreComment(StoreCommentDto storeCommentDto) throws Exception{
			return storeCommentDao.insertStoreComment(storeCommentDto);
		}
		
		// 4. 스토어 후기 수정
		public int updateStoreComment(StoreCommentDto storeCommentDto) throws Exception{
			return storeCommentDao.updateStoreComment(storeCommentDto);
		}
		
		// 5. 스토어 후기 삭제
		public int deleteStoreComment(@Param("scom_idx") int scom_idx) throws Exception {
			return storeCommentDao.deleteStoreComment(scom_idx);
		}
		
		// 6. 스토어 후기 페이징 기능 
}
