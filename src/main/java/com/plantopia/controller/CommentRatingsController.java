package com.plantopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantopia.dto.CustomUserDetails;
import com.plantopia.service.CommentRatingsService;

@Controller
public class CommentRatingsController {
	 @Autowired
	 CommentRatingsService commentRatingsService;

	// 별점 등록 또는 수정 처리
	 @RequestMapping("/Clinic/comment/rate")
	 public String rateComment(@RequestParam int plccom_idx,
	                           @RequestParam int rating,
	                           @RequestParam int plc_idx,
	                           @AuthenticationPrincipal CustomUserDetails user,
	                           Model model) throws Exception {

	     if (user == null) {
	         model.addAttribute("error", "로그인 후 별점을 남길 수 있습니다.");
	         return "redirect:/login";
	     }

	     commentRatingsService.rateComment(plccom_idx, user.getUser_num(), rating);

	     // 별점 정보 다시 model에 담기
	     Double avgRating = commentRatingsService.getAverageRating(plccom_idx);
	     Integer myRating = commentRatingsService.getUserRating(plccom_idx, user.getUser_num());
	     model.addAttribute("avgRating", avgRating);
	     model.addAttribute("myRating", myRating);

	     return "redirect:/Clinic/clinicDetail?plc_idx=" + plc_idx;
	 }

	 // 별점 삭제 처리
	 @RequestMapping("/Clinic/comment/rating/delete")
	 public String deleteRating(@RequestParam int plccom_idx,
	                            @RequestParam int plc_idx,
	                            @AuthenticationPrincipal CustomUserDetails user,
	                            Model model) throws Exception {

	     if (user != null) {
	         commentRatingsService.deleteRating(plccom_idx, user.getUser_num());
	         model.addAttribute("myRating", null);
	     }

	     return "redirect:/Clinic/clinicDetail?plc_idx=" + plc_idx;
	}
}
