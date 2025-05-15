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
        Integer existingRating = commentRatingsMapper.getRatingByUser(plccom_idx, user_num);

        if (existingRating == null) {
            // 별점이 없으면 등록
            commentRatingsMapper.insertRating(plccom_idx, user_num, rating);
        } else {
            // 별점이 있으면 수정
            commentRatingsMapper.updateRating(plccom_idx, user_num, rating);
        }

        // 별점 등록 또는 수정 후 평균 별점 갱신
        updateAverageRating(plccom_idx);
    }

    // 별점 삭제 처리
    public int deleteRating(int plccom_idx, int user_num) throws Exception {
        int result = commentRatingsMapper.deleteRating(plccom_idx, user_num);

        // 별점 삭제 후 평균 별점 갱신
        updateAverageRating(plccom_idx);

        return result;
    }

    // 댓글의 평균 별점 조회
    public Double getAverageRating(int plccom_idx) throws Exception {
        return commentRatingsMapper.getAverageRating(plccom_idx);
    }

    // 사용자의 별점 조회
    public Integer getUserRating(int plccom_idx, int user_num) throws Exception {
        return commentRatingsMapper.getRatingByUser(plccom_idx, user_num);
    }

    // 평균 별점 갱신 처리
    private void updateAverageRating(int plccom_idx) throws Exception {
        // 평균 별점 계산
        Double averageRating = commentRatingsMapper.getAverageRating(plccom_idx);

        if (averageRating == null) {
            averageRating = 0.0; // 기본값을 0으로 설정
        }

        // 댓글의 평균 별점이 변경되었을 때 해당 댓글의 평균 별점 갱신
        commentRatingsMapper.updateCommentAverageRating(plccom_idx, averageRating);
    }
}
