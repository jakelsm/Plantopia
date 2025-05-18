package com.plantopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantopia.dto.CustomUserDetails;
import com.plantopia.dto.PlantClinicCommentDto;
import com.plantopia.service.PlantClinicCommentService;

@Controller
public class PlantClinicCommentController {
	 @Autowired
	 PlantClinicCommentService commentService;

	// 댓글 목록 조회 (별도 경로로 필요 시 사용 가능)
	    @RequestMapping("/Clinic/comment/list")
	    public String commentList(@RequestParam("plc_idx") int plc_idx, Model model) throws Exception {
	        List<PlantClinicCommentDto> commentList = commentService.selectComments(plc_idx);
	        model.addAttribute("commentList", commentList);
	        return "PlantClinic/clinicDetail"; 
	    }

	    // 댓글 작성 처리
	    @RequestMapping("/Clinic/comment/write")
	    public String writeComment(PlantClinicCommentDto dto,
	                                @RequestParam("plccom_contents") String plccom_contents,
	                                @RequestParam("plc_idx") int plc_idx,
	                                @AuthenticationPrincipal CustomUserDetails user,
	                                @RequestParam(value = "parentId",required = false) Integer parentId) throws Exception {

	        dto.setPlc_idx(plc_idx);
	        dto.setPlccom_contents(plccom_contents);
	        dto.setUser_num(user.getUser_num());

	        if (parentId != null) { // 대댓글일 경우
	            PlantClinicCommentDto parent = commentService.selectCommentDetail(parentId);
	            dto.setPlccom_root(parent.getPlccom_idx());
	            dto.setPlccom_step(parent.getPlccom_step() + 1);
	            dto.setPlccom_indent(parent.getPlccom_indent() + 1);
	        }

	        commentService.insertComment(dto);
	        return "redirect:/Clinic/clinicDetail?plc_idx=" + plc_idx;
	    }

	    // 댓글 수정 폼
	    @RequestMapping("/Clinic/comment/update")
	    public String updateCommentForm(@RequestParam("plccom_idx") int plccom_idx,
	                                    @RequestParam("plc_idx") int plc_idx,
	                                    @AuthenticationPrincipal CustomUserDetails user,
	                                    Model model) throws Exception {

	        PlantClinicCommentDto dto = commentService.selectCommentDetail(plccom_idx);
	        
	        boolean isAdmin = "admin".equals(user.getUser_authority());
	        if (!isAdmin && dto.getUser_num() != user.getUser_num()) {
	            throw new AccessDeniedException("댓글 수정 권한이 없습니다.");
	        }
	        
	        model.addAttribute("dto", dto);
	        model.addAttribute("plc_idx", plc_idx);
	        model.addAttribute("nickname", user.getUser_nickname());

	        return "PlantClinic/clinicCommentUpdate";
	    }

	    // 댓글 수정 처리
	    @RequestMapping("/Clinic/comment/updateProc")
	    public String updateCommentProc(@RequestParam("plccom_idx") int plccom_idx,
	                                    @RequestParam("plccom_contents") String plccom_contents,
	                                    @RequestParam("plc_idx") int plc_idx,
	                                    @AuthenticationPrincipal CustomUserDetails user) throws Exception {
	    	PlantClinicCommentDto comment = commentService.selectCommentDetail(plccom_idx);
	        boolean isAdmin = "admin".equals(user.getUser_authority());
	        if (!isAdmin && comment.getUser_num() != user.getUser_num()) {
	            throw new AccessDeniedException("댓글 수정 권한이 없습니다.");
	        }
	    	
	        commentService.updateComment(plccom_idx, plccom_contents);
	        return "redirect:/Clinic/clinicDetail?plc_idx=" + plc_idx;
	    }

	    // 댓글 삭제 처리
	    @RequestMapping("/Clinic/comment/delete")
	    public String deleteComment(@RequestParam("plccom_idx") int plccom_idx,
	                                @RequestParam("plc_idx") int plc_idx,
	                                @AuthenticationPrincipal CustomUserDetails user) throws Exception {
	    	PlantClinicCommentDto comment = commentService.selectCommentDetail(plccom_idx);
	        boolean isAdmin = "admin".equals(user.getUser_authority());
	        if (!isAdmin && comment.getUser_num() != user.getUser_num()) {
	            throw new AccessDeniedException("댓글 삭제 권한이 없습니다.");
	        }
	        
	        commentService.deleteComment(plccom_idx);
	        return "redirect:/Clinic/clinicDetail?plc_idx=" + plc_idx;
	    }
}
