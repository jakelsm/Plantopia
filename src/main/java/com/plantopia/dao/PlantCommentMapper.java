package com.plantopia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.plantopia.dto.PlantCommentDto;

@Mapper
public interface PlantCommentMapper {
    public List<PlantCommentDto> selectComments(@Param("pla_idx") int pla_idx) throws Exception;
    public int insertComment(PlantCommentDto dto) throws Exception;
    public int getMaxStep(@Param("placom_root") int placom_root) throws Exception;
    public int updateStepAfter(@Param("step") int step, @Param("pla_idx") int pla_idx) throws Exception;
    // 댓글 수정
    public int updateComment(@Param("placom_idx") int placom_idx,@Param("placom_contents") 
    	String placom_contents) throws Exception;
    // 댓글 삭제
    public int deleteComment(@Param("placom_idx") int placom_idx) throws Exception;
    public PlantCommentDto selectCommentDetail(@Param("placom_idx") int placom_idx) throws Exception;
    public int updateRoot(@Param("placom_idx") int placom_idx) throws Exception;
}
