package com.plantopia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.plantopia.dto.PlantDto;

@Mapper
public interface PlantMapper {
	List<PlantDto> selectPlantList() throws Exception;
	void insertPlant(PlantDto plant) throws Exception;
	void updateHitCount(int plaIdx) throws Exception;
	PlantDto selectPlantDetail(int plaIdx) throws Exception;
	void updatePlant(PlantDto plant) throws Exception;
	void deletePlant(int plaIdx) throws Exception;
}
