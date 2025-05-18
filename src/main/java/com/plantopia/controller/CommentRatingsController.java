package com.plantopia.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plantopia.dto.CustomUserDetails;
import com.plantopia.service.CommentRatingsService;

@Controller
public class CommentRatingsController {

    @Autowired
    private CommentRatingsService commentRatingsService;

    // 별점 등록 또는 수정 처리
    @RequestMapping("/Clinic/comment/rate")
    @ResponseBody
    public Map<String, Object> rateComment(@RequestParam("plccom_idx") int plccom_idx,
                              @RequestParam("rating") int rating,
                              @RequestParam("plc_idx") int plc_idx,
                              @AuthenticationPrincipal CustomUserDetails user) throws Exception {
    	
    	Map<String, Object> response = new HashMap<>();
    	
    	if (user == null) {
            response.put("error", "로그인 후 별점을 남길 수 있습니다.");
            return response;
        }

        // 별점 등록 또는 수정
    	commentRatingsService.rateComment(plccom_idx, user.getUser_num(), rating);

        // 평균 별점 계산
    	Double avgRating = commentRatingsService.getAverageRating(plccom_idx);
    	Integer myRating = commentRatingsService.getUserRating(plccom_idx, user.getUser_num());

        // JSON 응답으로 평균 별점과 사용자 별점 반환
    	response.put("newRating", avgRating);
        response.put("myRating", myRating);
        return response;
    }
}

