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
	private PlantMapper plantMapper;
	
	
	public List<PlantDto> selectPlantList() throws Exception {
		return plantMapper.selectPlantList();
	}
	
	public void insertPlant(PlantDto plant) throws Exception {
		plantMapper.insertPlant(plant);
		
	}
	
	public PlantDto selectPlantDetail(@RequestParam("plaIdx") int plaIdx) throws Exception {
		plantMapper.updateHitCount(plaIdx);
		PlantDto plant = plantMapper.selectPlantDetail(plaIdx);
		
		return plant;
	}
	
	public void updatePlant(PlantDto plant) throws Exception { 
		plantMapper.updatePlant(plant);
	}
	
	public void deletePlant(@RequestParam("plaIdx") int plaIdx) throws Exception {
		plantMapper.deletePlant(plaIdx);
	}
	
}
