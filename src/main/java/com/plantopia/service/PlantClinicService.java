package com.plantopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.PlantClinicMapper;
import com.plantopia.dto.PlantClinicDto;

@Service
public class PlantClinicService {
	 @Autowired
	 PlantClinicMapper plantClinicMapper;

	 // 전체 게시글 조회
	 public List<PlantClinicDto> selectClinicList() throws Exception {
	     return plantClinicMapper.selectClinicList();
	 }

	 // 게시글 상세 조회 (조회수 증가 포함)
	 public PlantClinicDto selectClinicDetail(int plc_idx) throws Exception {
	 plantClinicMapper.updateHitCount(plc_idx);
	     return plantClinicMapper.selectClinicDetail(plc_idx);
	 }

	 // 게시글 작성
	 public int insertClinic(PlantClinicDto dto) throws Exception {
	     return plantClinicMapper.insertClinic(dto);
	 }

	 // 게시글 수정
	 public int updateClinic(PlantClinicDto dto) throws Exception {
	     return plantClinicMapper.updateClinic(dto);
	 }

	 // 게시글 삭제
	 public int deleteClinic(int plc_idx) throws Exception {
	     return plantClinicMapper.deleteClinic(plc_idx);
	 }
}
