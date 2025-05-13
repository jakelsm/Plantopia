package com.plantopia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.plantopia.dto.NoticeDto;

@Mapper
public interface INoticeDao {
	// 1. 공지 게시판 리스트 보기 
	public List<NoticeDto> getAllNotice() throws Exception;
	
	// 2. 공지 게시판 리스트 상세보기
	public NoticeDto getNoticeByIdx(@Param("n_idx") int n_idx) throws Exception;
	
	// 3. 공지 게시판 작성
	public int insertNotice(NoticeDto noticeDto) throws Exception;
	
	// 4. 공지 게시판 수정
	public int updateNotice(NoticeDto noticeDto) throws Exception;
	
	// 5. 공지 게시판 삭제
	public int deleteNotice(@Param("n_idx") int n_idx) throws Exception;
	
	// 6. 공지 게시판 페이징 기능
	public List<NoticeDto> getNoticePaging(@Param("offset") int offset, @Param("limit") int limit);
	
	public int getTotalNoticeCount(); // 공지 게시판 페이징 총 카운트
}
