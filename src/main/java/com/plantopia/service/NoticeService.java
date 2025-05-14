package com.plantopia.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.INoticeDao;
import com.plantopia.dto.NoticeDto;

@Service
public class NoticeService {
	@Autowired
	INoticeDao noticeDao;
	
	// 1. 공지 게시판 리스트 보기 
	public List<NoticeDto> getAllNotice() throws Exception {
		return noticeDao.getAllNotice();
	}
		
	// 2. 공지 게시판 리스트 상세보기
	public NoticeDto getNoticeByIdx(@Param("n_idx") int n_idx) throws Exception {
		return noticeDao.getNoticeByIdx(n_idx);
	}
	
	// 3. 공지 게시판 작성
	public int insertNotice(NoticeDto noticeDto) throws Exception {
		return noticeDao.insertNotice(noticeDto);
	}
	
	// 4. 공지 게시판 수정
	public int updateNotice(NoticeDto noticeDto) throws Exception {
		return noticeDao.updateNotice(noticeDto);
	}
	
	// 5. 공지 게시판 삭제
	public int deleteNotice(int n_idx) throws Exception {
		return noticeDao.deleteNotice(n_idx);
	}
	
	// 6. 공지 게시판 페이징 기능
	public List<NoticeDto> getNoticePaging(int page, int pageSize) {
		int offset = (page-1) * pageSize;
		return noticeDao.getNoticePaging(offset, pageSize);
	}
		
	public int getTotalNoticeCount(int pageSize) {
		int total = noticeDao.getTotalNoticeCount();
		return (int) Math.ceil((double) total / pageSize);
	}
	
	// 메인 페이지용 공지사항 5개 미리보기
	public List<NoticeDto> getRecentNotices() {
	    return noticeDao.getRecentNotices();
	}

}
