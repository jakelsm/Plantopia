package com.plantopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantopia.dto.PlantCommentDto;
import com.plantopia.service.PlantCommentService;

@Controller
public class PlantCommentController {
	@Autowired
    private PlantCommentService plantCommentService;
	
	@RequestMapping("/Plant/plantList/detail")
    public String detail(@RequestParam int pla_idx, Model model) throws Exception {
        List<PlantCommentDto> commentList = plantCommentService.selectComments(pla_idx);
        model.addAttribute("commentList", commentList);
        return "Plant/plantDetail";
    }
	
	@RequestMapping("/Plant/plantList/comment")
    public String insertComment(PlantCommentDto dto,
                                @RequestParam String placom_contents,
                                @RequestParam int pla_idx,
                                Model model) throws Exception {
        dto.setPla_idx(pla_idx);
        dto.setPlacom_contents(placom_contents);
        plantCommentService.insertComment(dto);
        return "redirect:/Plant/plantList/detail?pla_idx=" + pla_idx;
    }

    @RequestMapping("/Plant/plantList/comment/update")
    public String updateComment(@RequestParam int placom_idx, 
					    		@RequestParam String placom_contents, 
					    		@RequestParam int pla_idx,
					    		Model model) throws Exception {
        plantCommentService.updateComment(placom_idx, placom_contents);
        
        return "redirect:/Plant/plantList/detail?pla_idx=" + pla_idx;
        
    }

    @RequestMapping("/Plant/plantList/comment/delete")
    public String deleteComment(@RequestParam int placom_idx, 
					    		@RequestParam int pla_idx, 
					    		Model model) throws Exception {
        plantCommentService.deleteComment(placom_idx);
        
        return "redirect:/Plant/plantList/detail?pla_idx=" + pla_idx;
        
    }

    
}
