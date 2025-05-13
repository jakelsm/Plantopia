package com.plantopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.PlantClinicCommentMapper;
import com.plantopia.dto.PlantClinicCommentDto;

@Service
public class PlantClinicCommentService {
	@Autowired
    PlantClinicCommentMapper plantClinicCommentMapper;

    // 댓글 작성 (일반 댓글과 대댓글 처리)
    public int insertComment(PlantClinicCommentDto dto) throws Exception {
        if (dto.getPlccom_root() == null) {
            // 최상위 댓글 
            dto.setPlccom_indent(0);
            dto.setPlccom_step(0);
            plantClinicCommentMapper.insertComment(dto);
            plantClinicCommentMapper.updateRoot(dto.getPlccom_idx());
            return 1;
        } else {
            // 대댓글 
            int newStep = plantClinicCommentMapper.getMaxStep(dto.getPlccom_root()) + 1;
            plantClinicCommentMapper.updateStepAfter(newStep, dto.getPlc_idx());
            dto.setPlccom_step(newStep);
            dto.setPlccom_indent(dto.getPlccom_indent() + 1);
            return plantClinicCommentMapper.insertComment(dto);
        }
    }

    // 댓글 목록 조회
    public List<PlantClinicCommentDto> selectComments(int plc_idx) throws Exception {
        return plantClinicCommentMapper.selectComments(plc_idx);
    }

    // 댓글 수정
    public int updateComment(int plccom_idx, String contents) throws Exception {
        return plantClinicCommentMapper.updateComment(plccom_idx, contents);
    }

    // 댓글 삭제
    public int deleteComment(int plccom_idx) throws Exception {
        return plantClinicCommentMapper.deleteComment(plccom_idx);
    }

    // 댓글 상세 조회
    public PlantClinicCommentDto selectCommentDetail(int plccom_idx) throws Exception {
        return plantClinicCommentMapper.selectCommentDetail(plccom_idx);
    }
}
