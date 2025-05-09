package com.plantopia.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.IStoreDao;
import com.plantopia.dto.StoreDto;

@Service
public class StoreService {
	
	@Autowired
	IStoreDao storeDao;
	
	// 1. 스토어 게시판 전체 조회
	public List<StoreDto> getAllStore() throws Exception{		
		return storeDao.getAllStore();
	}
	
	// 2. 스토어 게시판 상세 조회	
	public StoreDto getStore(@Param("p_idx") int p_idx) throws Exception{		
		return storeDao.getStore(p_idx);
	}
		
	// 3. 스토어 게시판 제품 추가	
	public int insertStore(StoreDto store) throws Exception {		
		return storeDao.insertStore(store);
	}
		
	// 4. 스토어 게시판 제품 수정	
	public int updateStore(StoreDto store) throws Exception {		
		return storeDao.updateStore(store);
	}
		
	// 5. 스토어 게시판 제품 삭제	
	public int deleteStore(@Param("p_idx") int p_idx) throws Exception {
		return storeDao.deleteStore(p_idx);
	}
		
	// 6. 스토어 게시판 제품명으로 검색	
	public List<StoreDto> searchStore(@Param("keyword") String keyword) throws Exception {
		return storeDao.searchStore(keyword);
	}
	
	// 7. 스토어 게시판 페이징 기능 
	public List<StoreDto> getStorePaging(int page, int pageSize) throws Exception{
		int offset = (page-1) * pageSize;
		return storeDao.getStorePaging(offset, pageSize);
	}
	
	public int getToalStoreCount(int pageSize) throws Exception{
		int total = storeDao.getTotalStoreCount();
		return (int) Math.ceil((double) total / pageSize);
	}
	
}
