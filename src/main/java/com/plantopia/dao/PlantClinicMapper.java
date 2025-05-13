package com.plantopia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.plantopia.dto.PlantClinicDto;

@Mapper
public interface PlantClinicMapper {
	List<PlantClinicDto> selectClinicList() throws Exception;
    PlantClinicDto selectClinicDetail(@Param("plc_idx") int plc_idx) throws Exception;
    int insertClinic(PlantClinicDto dto) throws Exception;
    int updateClinic(PlantClinicDto dto) throws Exception;
    int deleteClinic(@Param("plc_idx") int plc_idx) throws Exception;
    int updateHitCount(@Param("plc_idx") int plc_idx) throws Exception;
}
