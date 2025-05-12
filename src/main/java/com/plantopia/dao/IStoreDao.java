package com.plantopia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.plantopia.dto.StoreDto;

@Mapper
public interface IStoreDao {
	public List<StoreDto> getAllStore() throws Exception; // 스토어 게시판 전체 조회
	
	public StoreDto getStore(@Param("p_idx") int p_idx) throws Exception; // 스토어 게시판 상세 조회
	
	public int insertStore(StoreDto store) throws Exception; // 스토어 게시판 제품 추가
	
	public int updateStore(StoreDto store) throws Exception; // 스토어 게시판 제품 수정
	
	public int deleteStore(@Param("p_idx") int p_idx) throws Exception; // 스토어 게시판 제품 삭제
	
	public List<StoreDto> searchStore(@Param("keyword") String keyword) throws Exception; // 스토어 게시판 제품명으로 검색
	
	public List<StoreDto> getStorePaging(@Param("offset") int offset, @Param("limit") int limit); // 스토어 게시판 페이징 
	
	public int getTotalStoreCount(); // 스토어 게시판 페이징 총 카운트 
	
}
