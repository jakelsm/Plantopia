package com.plantopia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.CommentRatingsMapper;

@Service
public class CommentRatingsService {
	@Autowired
    CommentRatingsMapper commentRatingsMapper;

    // 별점 등록 또는 수정 처리
    public void rateComment(int plccom_idx, int user_num, int rating) throws Exception {
        if (commentRatingsMapper.getRatingByUser(plccom_idx, user_num) == null) {
            commentRatingsMapper.insertRating(plccom_idx, user_num, rating);
        } else {
            commentRatingsMapper.updateRating(plccom_idx, user_num, rating);
        }
    }

    // 별점 삭제
    public int deleteRating(int plccom_idx, int user_num) throws Exception {
        return commentRatingsMapper.deleteRating(plccom_idx, user_num);
    }

    // 특정 댓글의 별점 평균 조회
    public Double getAverageRating(int plccom_idx) throws Exception {
        return commentRatingsMapper.getAverageRating(plccom_idx);
    }

    // 사용자 별점 조회 (있으면 반환, 없으면 null)
    public Integer getUserRating(int plccom_idx, int user_num) throws Exception {
        return commentRatingsMapper.getRatingByUser(plccom_idx, user_num);
    }
}
