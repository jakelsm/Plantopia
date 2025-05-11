package com.plantopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantopia.dao.PlantMapper;
import com.plantopia.dto.PlantDto;

@Service
public class PlantService {
	@Autowired
	PlantMapper plantMapper;
	
	public List<PlantDto> selectPlantList() throws Exception {
		return plantMapper.selectPlantList();
	}
	
	public int insertPlant(PlantDto plant) throws Exception {
		return plantMapper.insertPlant(plant);
	}
	
	public PlantDto selectPlantDetail(int plaIdx) throws Exception {
		plantMapper.updateHitCount(plaIdx);
		PlantDto plant = plantMapper.selectPlantDetail(plaIdx);
		
		return plant;
	}
	
	public int updatePlant(PlantDto plant) throws Exception { 
		return plantMapper.updatePlant(plant);
	}
	
	public int deletePlant(int plaIdx) throws Exception {
		return plantMapper.deletePlant(plaIdx);
	}
	
}
