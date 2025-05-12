package com.plantopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantopia.dto.CustomUserDetails;
import com.plantopia.service.PostLikeService;

@Controller
public class PostLikeController {
	@Autowired
	PostLikeService postLikeService;

	@RequestMapping("/Plant/plantList/detail/like")
	public String toggleLike(@RequestParam int pla_idx,
                             @AuthenticationPrincipal CustomUserDetails user) 
                             throws Exception {
	if (user == null) {
		return "redirect:/login";
	}
	
	int user_num = user.getUser_num();
	postLikeService.toggleLike(pla_idx, user_num);
	
	return "redirect:/Plant/plantDetail?pla_idx=" + pla_idx;
	}
}
