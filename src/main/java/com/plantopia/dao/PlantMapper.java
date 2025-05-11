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
}
