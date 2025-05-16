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
    List<PlantClinicDto> selectClinicByUser(int user_num);
    // 페이지마다 가져올 것 (offset, limit)
    List<PlantClinicDto> getClinicPaging(@Param("offset") int offset, @Param("limit") int limit);
    // 전체 게시글 수
    int getTotalClinicCount();
    // 내가 쓴 Clinic 글을 페이징해서 조회
    List<PlantClinicDto> selectClinicByUserPaging(
        @Param("userNum")   int userNum,
        @Param("offset")    int offset,
        @Param("pageSize")  int pageSize
    ) throws Exception;
    // 내가 쓴 Clinic 글 총 개수 
    int countByUser(@Param("userNum") int userNum) throws Exception;
    // 제목으로 검색된 게시글 리스트 조회
    List<PlantClinicDto> selectClinicListBySearch(@Param("search") String search, @Param("offset") int offset, @Param("limit") int limit) throws Exception;
    // 제목으로 검색된 게시글 수 조회
    int getTotalClinicCountBySearch(@Param("search") String search) throws Exception;

}
