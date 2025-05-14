package com.plantopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	// 특정 사용자가 쓴 글만 반환
    public List<PlantDto> selectPlantByUser(int userNum) throws Exception {
        return plantMapper.selectPlantByUser(userNum);
    }
    
    // 인기글 상위 n개 가져오기 
    public List<PlantDto> getPopularPlants(int topN) throws Exception {
        return plantMapper.selectPopularPlants(topN);
    }
}
