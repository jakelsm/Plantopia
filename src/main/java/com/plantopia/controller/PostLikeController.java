package com.plantopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantopia.service.PostLikeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PostLikeController {
	@Autowired
	PostLikeService postLikeService;

	@RequestMapping("/Plant/plantList/detail/like")
	public String toggleLike(@RequestParam int pla_idx, HttpSession session) throws Exception {
	   int user_num = (int) session.getAttribute("user_num");
	   postLikeService.toggleLike(pla_idx, user_num);
	   
	   return "redirect:/Plant/plantList/detail?pla_idx=" + pla_idx;
	}
}
