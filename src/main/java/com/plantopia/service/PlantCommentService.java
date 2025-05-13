package com.plantopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.PlantCommentMapper;
import com.plantopia.dto.PlantCommentDto;

@Service
public class PlantCommentService {
	 @Autowired
	 private PlantCommentMapper plantCommentMapper;
	 
	 public int insertComment(PlantCommentDto dto) throws Exception {
		 if (dto.getPlacom_root() == null) {
		        // 최상위 댓글
		        dto.setPlacom_indent(0);
		        dto.setPlacom_step(0);
		        // 한 번만 insert 
		        plantCommentMapper.insertComment(dto);
		        
		        // 등록된 댓글의 placom_idx를 root로 다시 update
		        plantCommentMapper.updateRoot(dto.getPlacom_idx());
		        
		        return 1;
		    } else {
		        // 대댓글
		        int newStep = plantCommentMapper.getMaxStep(dto.getPlacom_root()) + 1;
		        plantCommentMapper.updateStepAfter(newStep, dto.getPla_idx());
		        dto.setPlacom_step(newStep);
		        dto.setPlacom_indent(dto.getPlacom_indent() + 1);
		        dto.setRating(null); // 별점 무효화
		        
		        return plantCommentMapper.insertComment(dto);
		    }
	    }

	    public List<PlantCommentDto> selectComments(int pla_idx) throws Exception {
	        return plantCommentMapper.selectComments(pla_idx);
	    }

	    public int updateComment(int placom_idx, String contents) throws Exception {
	        return plantCommentMapper.updateComment(placom_idx, contents);
	    }

	    public int deleteComment(int placom_idx) throws Exception {
	        return plantCommentMapper.deleteComment(placom_idx);
	    }
	    
	    public PlantCommentDto selectCommentDetail(int placom_idx) throws Exception {
	        return plantCommentMapper.selectCommentDetail(placom_idx);
	    }

}
