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
	
	// 전체 게시글 조회
	public List<PlantDto> selectPlantList() throws Exception {
		return plantMapper.selectPlantList();
	}
	
	// 게시글 작성
	public int insertPlant(PlantDto plant) throws Exception {
		return plantMapper.insertPlant(plant);
	}
	
	// 게시글 상세 조회
	public PlantDto selectPlantDetail(int plaIdx) throws Exception {
		plantMapper.updateHitCount(plaIdx);
		PlantDto plant = plantMapper.selectPlantDetail(plaIdx);
		
		return plant;
	}
	
	// 게시글 수정
	public int updatePlant(PlantDto plant) throws Exception { 
		return plantMapper.updatePlant(plant);
	}

	// 게시글 삭제
	public int deletePlant(int plaIdx) throws Exception {
		return plantMapper.deletePlant(plaIdx);
	}
	
}
