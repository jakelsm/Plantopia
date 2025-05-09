package com.plantopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantopia.dto.StoreCommentDto;
import com.plantopia.service.StoreCommentService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class StoreCommentController {
	@Autowired
	StoreCommentService commentService;
	
	// 1. 스토어 후기 작성 
	
	@RequestMapping("/addComment")
	public String addComment() throws Exception {
		return "Store/StoreDetail";
	}
	
	@RequestMapping("/addCommentProcess")	
	public String addCommentProcess(@RequestParam("scom_contents") String scom_contents,
									@RequestParam("p_idx") int p_idx
									) throws Exception {
		
		//int user_num = 1;
		// @RequestParam("user_num") int user_num 추가 
		StoreCommentDto commentDto = StoreCommentDto.builder()
									.scom_contents(scom_contents)
									.p_idx(p_idx)
									//.user_num(user_num)
									.build();
		
		commentService.insertStoreComment(commentDto);
		
		return "redirect:StoreDetail?p_idx=" + p_idx;
	}
	
	 // 3. 스토어 후기 수정
	@RequestMapping("/CommentUpdate")
	public String CommentUpdate(@RequestParam("scom_idx") int scom_idx,
								@RequestParam("p_idx") int p_idx,
								Model model) throws Exception {
		// user_num 추가
		StoreCommentDto commentDto = commentService.getCommentByIdx(scom_idx);
		model.addAttribute("comment", commentDto);
		model.addAttribute("p_idx", p_idx);
		
		return "Store/CommentUpdateForm";
	}
	
	@RequestMapping("/CommentUpdateProcess")
	public String CommentUpdateProcess(@RequestParam("scom_idx") int scom_idx,
										@RequestParam("scom_contents") String scom_contents,
										@RequestParam("p_idx") int p_idx
										) throws Exception {
		StoreCommentDto commentDto = StoreCommentDto.builder()
									.scom_contents(scom_contents)
									.p_idx(p_idx)
									.scom_idx(scom_idx)
									.build();
		
		commentService.updateStoreComment(commentDto);
		
		return "redirect:StoreDetail?p_idx=" + p_idx;
	}
	
	// 4. 스토어 후기 삭제
	@RequestMapping("/CommentDelete")
	public String CommentDelete(@RequestParam("scom_idx") int scom_idx,
								@RequestParam("p_idx") int p_idx) throws Exception {
		commentService.deleteStoreComment(scom_idx);
		
		
		return "redirect:StoreDetail?p_idx=" + p_idx;
	}

}
