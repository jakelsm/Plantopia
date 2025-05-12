package com.plantopia.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.plantopia.dto.CustomUserDetails;
import com.plantopia.dto.PlantCommentDto;
import com.plantopia.dto.PlantDto;
import com.plantopia.service.PlantCommentService;
import com.plantopia.service.PlantService;
import com.plantopia.service.PostLikeService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PlantController {
	@Autowired
	private PlantService plantService;
	
	@Autowired
    PlantCommentService plantCommentService;

    @Autowired
    PostLikeService postLikeService;
	
	@RequestMapping("/Plant/plantList")
	public String plantList(Model model) throws Exception {
		List<PlantDto> plantList = plantService.selectPlantList();
		model.addAttribute("plantList", plantList);
		return "Plant/plantList";
	}
	
	@RequestMapping("/Plant/plantWrite")
	public String plantWrite(@AuthenticationPrincipal CustomUserDetails user, Model model) throws Exception {
		if (user != null) {
	        model.addAttribute("nickname", user.getUser_nickname()); // 작성자 닉네임 출력용
	    }

		return "Plant/plantWrite";
	}
	
	@RequestMapping("/plantWriteProc")
	public String plantWriteProc(@RequestParam("pla_title") String pla_title,
								 @RequestParam("pla_contents") String pla_contents,
								 @RequestParam("imgFile") MultipartFile imgFile,
								 @AuthenticationPrincipal CustomUserDetails user,
								 HttpServletRequest request) throws Exception {
		
		String fileName = null;
		String original_img=null;
		
		if(!imgFile.isEmpty()) {
			fileName = imgFile.getOriginalFilename();
			String uploadPath = "C:/upload/img/plant/";
			File file = new File(uploadPath+fileName);
			imgFile.transferTo(file);
		} else {
			fileName = original_img;
		}
		
		PlantDto plant = new PlantDto();
		plant.setPla_title(pla_title);
	    plant.setPla_contents(pla_contents);
	    plant.setPla_img(fileName);
	    plant.setUser_num(user.getUser_num());
		
		plantService.insertPlant(plant);
		return "redirect:/Plant/plantList";
	}
	
	@RequestMapping("/Plant/plantDetail") // 게시글 상세보기
	public String plantDetail(@RequestParam("pla_idx") int pla_idx,
							  @AuthenticationPrincipal CustomUserDetails user
							  ,Model model) throws Exception {
		
		// user가 null인지 확인
	    if (user == null) {
	        throw new IllegalStateException("User is not authenticated.");
	    }
		
		int user_num = (user != null) ? user.getUser_num() : 0;
		
		// 게시글 정보 가져오기
	    PlantDto plant = plantService.selectPlantDetail(pla_idx); // 게시글 정보
	    if (plant == null) {
	        throw new IllegalStateException("The plant with id " + pla_idx + " doesn't exist.");
	    }
	    
	    // 댓글 목록
	    List<PlantCommentDto> commentList = plantCommentService.selectComments(pla_idx); // 댓글 목록
	    if (commentList == null) {
	        commentList = new ArrayList<>(); // 빈 리스트로 초기화
	    }
	    
	    
	    // 좋아요 관련 데이터
	    int likeCount = postLikeService.countLike(pla_idx); // 좋아요 수
	    boolean userLiked = postLikeService.hasUserLiked(pla_idx, user_num); // 현재 사용자가 좋아요 눌렀는지

	    // 디버깅용 출력
	    System.out.println("Plant Details: " + plant);
	    System.out.println("Comments: " + commentList);
	    
	    // 댓글 계층 정렬
	    commentList = commentList.stream()
	        .sorted(Comparator.comparingInt(PlantCommentDto::getPlacom_root)
	                          .thenComparingInt(PlantCommentDto::getPlacom_step)
	                          .thenComparingInt(PlantCommentDto::getPlacom_indent))
	        .collect(Collectors.toList());
	    
	    
	    model.addAttribute("plant", plant);
	    model.addAttribute("commentList", commentList);
	    model.addAttribute("likeCount", likeCount);
	    model.addAttribute("userLiked", userLiked);
		
		return "Plant/plantDetail";
	}
	
	@RequestMapping("/Plant/plantUpdate")
	public String plantUpdate(@RequestParam("pla_idx") int pla_idx,Model model) throws Exception {
		PlantDto plant = plantService.selectPlantDetail(pla_idx);
		model.addAttribute("plant", plant);
		return "Plant/plantUpdate";
	}
	
	@RequestMapping("/Plant/plantUpdateProc")
	public String plantUpdateProc(
					 @RequestParam("pla_idx") int pla_idx,
					 @RequestParam("pla_title") String pla_title,
					 @RequestParam("pla_contents") String pla_contents,
					 @RequestParam("imgFile") MultipartFile imgFile,
					 @RequestParam("original_img") String original_img,
					 HttpServletRequest request) throws Exception {

		String fileName = null;
	
		if(!imgFile.isEmpty()) {
			fileName = imgFile.getOriginalFilename();
			String uploadPath = "C:/upload/img/plant/";
			File file = new File(uploadPath+fileName);
			imgFile.transferTo(file);
		} else {
			fileName = original_img;
		}
		
		PlantDto plant = new PlantDto();
	    plant.setPla_idx(pla_idx);
	    plant.setPla_title(pla_title);
	    plant.setPla_contents(pla_contents);
	    plant.setPla_img(fileName);
		
		plantService.updatePlant(plant);
		return "redirect:/Plant/plantList";
	}
	
	@RequestMapping("/Plant/plantdelete")
	public String Plantdelete(@RequestParam("pla_idx") int pla_idx) throws Exception {
		plantService.deletePlant(pla_idx);
		return "redirect:/Plant/plantList";
	}
	
		
	
}
