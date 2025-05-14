package com.plantopia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.plantopia.dto.PlantDto;

@Mapper
public interface PlantMapper {
	public List<PlantDto> selectPlantList() throws Exception;
	public int insertPlant(PlantDto plant) throws Exception;
	public int updateHitCount(int pla_idx) throws Exception;
	public PlantDto selectPlantDetail(@Param("pla_idx") int pla_idx) throws Exception;
	public int updatePlant(PlantDto plant) throws Exception;
	public int deletePlant(@Param("pla_idx") int pla_idx) throws Exception;
	/** 특정 사용자가 쓴 글만 가져오기 */
    List<PlantDto> selectPlantByUser(@Param("user_num") int userNum) throws Exception;
    /** 인기글 조회 (조회수 + 좋아요수 합산 순, 상위 n개) */
    List<PlantDto> selectPopularPlants(@Param("limit") int limit);
}
