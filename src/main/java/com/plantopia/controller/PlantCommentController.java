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
import com.plantopia.dto.PlantCommentDto;
import com.plantopia.service.PlantCommentService;

@Controller
public class PlantCommentController {
	@Autowired
    private PlantCommentService plantCommentService;
	
	@RequestMapping("/Plant/plantList/detail")
    public String detail(@RequestParam("pla_idx") int pla_idx, Model model) throws Exception {
        List<PlantCommentDto> commentList = plantCommentService.selectComments(pla_idx);
        model.addAttribute("commentList", commentList);
        return "Plant/plantDetail";
    }
	
	@RequestMapping("/Plant/plantList/comment")
    public String insertComment(PlantCommentDto dto,
                                @RequestParam("placom_contents") String placom_contents,
                                @RequestParam("pla_idx") int pla_idx,
                                @RequestParam(value = "parentId",required = false) Integer parentId,
                                @AuthenticationPrincipal CustomUserDetails user,
                                Model model) throws Exception {
        
		
		dto.setPla_idx(pla_idx);
        dto.setPlacom_contents(placom_contents);
        dto.setUser_num(user.getUser_num());
        
        if (parentId != null) { // 대댓글
            PlantCommentDto parentComment = plantCommentService.selectCommentDetail(parentId);
            dto.setPlacom_root(parentComment.getPlacom_idx()); // 부모 댓글의 ID를 root로 설정
            dto.setPlacom_step(parentComment.getPlacom_step() + 1); // 부모 댓글보다 한 단계 뒤로 설정
            dto.setPlacom_indent(parentComment.getPlacom_indent() + 1); // 부모 댓글보다 들여쓰기 한 단계 추가
        }
        
        plantCommentService.insertComment(dto);
        return "redirect:/Plant/plantDetail?pla_idx=" + pla_idx;
    }

    @RequestMapping("/Plant/plantList/comment/update")
    public String updateComment(@RequestParam("placom_idx") int placom_idx, 
					    		@RequestParam("pla_idx") int pla_idx,
					    		@AuthenticationPrincipal CustomUserDetails user,
					    		Model model) throws Exception {
        PlantCommentDto dto = plantCommentService.selectCommentDetail(placom_idx);
        
        // 권한 확인
        boolean isAdmin = "admin".equals(user.getUser_authority());
        if (!isAdmin && dto.getUser_num() != user.getUser_num()) {
            throw new AccessDeniedException("댓글 수정 권한이 없습니다.");
        }
        
        model.addAttribute("dto", dto);
        model.addAttribute("pla_idx", pla_idx);
        model.addAttribute("nickname", user.getUser_nickname()); // 로그인된 사용자 닉네임 전달
        
        return "Plant/plantCommentUpdate";
        
    }

    // 댓글 수정 처리
    @RequestMapping("/Plant/plantList/comment/updateProc")
    public String updateCommentProc(@RequestParam("placom_idx") int placom_idx,
                                    @RequestParam("placom_contents") String placom_contents,
                                    @AuthenticationPrincipal CustomUserDetails user,
                                    @RequestParam("pla_idx") int pla_idx) throws Exception {
    	// 권한 확인
    	PlantCommentDto dto = plantCommentService.selectCommentDetail(placom_idx);

        boolean isAdmin = "admin".equals(user.getUser_authority());
        if (!isAdmin && dto.getUser_num() != user.getUser_num()) {
            throw new AccessDeniedException("댓글 수정 권한이 없습니다.");
        }
    	
        plantCommentService.updateComment(placom_idx, placom_contents);
        return "redirect:/Plant/plantDetail?pla_idx=" + pla_idx;
    }
    
    @RequestMapping("/Plant/plantList/comment/delete")
    public String deleteComment(@RequestParam("placom_idx") int placom_idx, 
					    		@RequestParam("pla_idx") int pla_idx, 
					    		@AuthenticationPrincipal CustomUserDetails user,
					    		Model model) throws Exception {
    	// 권한 확인
    	PlantCommentDto dto = plantCommentService.selectCommentDetail(placom_idx);

        boolean isAdmin = "admin".equals(user.getUser_authority());
        if (!isAdmin && dto.getUser_num() != user.getUser_num()) {
            throw new AccessDeniedException("댓글 삭제 권한이 없습니다.");
        }
    	
        plantCommentService.deleteComment(placom_idx);
        
        return "redirect:/Plant/plantDetail?pla_idx=" + pla_idx;
        
    }

    
}
