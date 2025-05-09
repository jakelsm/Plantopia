package com.plantopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.PlantMapper;
import com.plantopia.dto.PlantDto;

@Service
public class PlantService {
	@Autowired
	private PlantMapper plantMapper;
	
	
	public List<PlantDto> selectPlantList() throws Exception {
		return plantMapper.selectPlantList();
	}
	
	public void insertPlant(PlantDto plant) throws Exception {
		plantMapper.insertPlant(plant);
		
	}
	
	PlantDto selectPlantDetail(int plaIdx) throws Exception {
		plantMapper.updateHitCount(plaIdx);
		return plantMapper.selectPlantDetail(plaIdx);
	}
	
	void updatePlant(PlantDto plant) throws Exception { 
		plantMapper.updatePlant(plant);
	}
	
	void deletePlant(int plaIdx) throws Exception {
		plantMapper.deletePlant(plaIdx);
	}
	
}
