package com.plantopia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.plantopia.dto.PlantClinicCommentDto;

public interface PlantClinicCommentMapper {
	List<PlantClinicCommentDto> selectComments(@Param("plc_idx") int plc_idx) throws Exception;
    int insertComment(PlantClinicCommentDto dto) throws Exception;
    int getMaxStep(@Param("plccom_root") int plccom_root) throws Exception;
    int updateStepAfter(@Param("step") int step, @Param("plc_idx") int plc_idx) throws Exception;
    int updateComment(@Param("plccom_idx") int plccom_idx, @Param("plccom_contents") String plccom_contents) throws Exception;
    int deleteComment(@Param("plccom_idx") int plccom_idx) throws Exception;
    PlantClinicCommentDto selectCommentDetail(@Param("plccom_idx") int plccom_idx) throws Exception;
    int updateRoot(@Param("plccom_idx") int plccom_idx) throws Exception;
}
