package com.plantopia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.PostLikeMapper;

@Service
public class PostLikeService {
	@Autowired
    PostLikeMapper postLikeMapper;

    // 좋아요 추가
	public int addLike(int pla_idx, int user_num) throws Exception {
        return postLikeMapper.insertLike(pla_idx, user_num);
    }

    // 좋아요 취소
	public int removeLike(int pla_idx, int user_num) throws Exception {
        return postLikeMapper.deleteLike(pla_idx, user_num);
    }

    // 게시글 좋아요 개수 확인
    public int countLike(int pla_idx) throws Exception {
        return postLikeMapper.countLike(pla_idx);
    }

    // 유저가 좋아요 눌렀는지 체크
    public boolean hasUserLiked(int pla_idx, int user_num) throws Exception {
        return postLikeMapper.checkIfLiked(pla_idx, user_num) > 0;
    }
    
    // 눌렀으면 취소, 안 눌렀으면 등록 (toggle)
    public void toggleLike(int pla_idx, int user_num) throws Exception {
        if (hasUserLiked(pla_idx, user_num)) {
            removeLike(pla_idx, user_num);
        } else {
            addLike(pla_idx, user_num);
        }
    }
}
