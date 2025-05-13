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
import com.plantopia.dto.PlantClinicCommentDto;
import com.plantopia.dto.PlantClinicDto;
import com.plantopia.service.CommentRatingsService;
import com.plantopia.service.PlantClinicCommentService;
import com.plantopia.service.PlantClinicService;

@Controller
public class PlantClinicController {
	@Autowired
    PlantClinicService plantClinicService;

    @Autowired
    PlantClinicCommentService commentService;
    
    @Autowired
    CommentRatingsService commentRatingsService;

    // 클리닉 게시글 목록
    @RequestMapping("/Clinic/clinicList")
    public String clinicList(Model model) throws Exception {
        List<PlantClinicDto> list = plantClinicService.selectClinicList();
        model.addAttribute("clinicList", list);
        return "PlantClinic/clinicList";
    }

    // 글쓰기 폼으로 이동
    @RequestMapping("/Clinic/clinicWrite")
    public String clinicWrite(@AuthenticationPrincipal CustomUserDetails user, Model model) {
    	if (user != null) {
	        model.addAttribute("nickname", user.getUser_nickname()); // 작성자 닉네임 출력용
	    }
        return "PlantClinic/clinicWrite";
    }

    // 글 등록 처리 (파일 업로드 포함)
    @RequestMapping("/Clinic/clinicWriteProc")
    public String writeProc(@RequestParam("plc_title") String plc_title,
				            @RequestParam("growing_loc") String growing_loc,
				            @RequestParam("growth_con") String growth_con,
				            @RequestParam("watering") String watering,
				            @RequestParam("last_rep") String last_rep,
				            @RequestParam("last_fert") String last_fert,
				            @RequestParam("last_pruned") String last_pruned,
				            @RequestParam("plant_pos") String plant_pos,
				            @RequestParam("pest_dmg") String pest_dmg,
				            @RequestParam("discolored") String discolored,
				            @RequestParam("plc_contents") String plc_contents,
				            @RequestParam("imgFile") MultipartFile imgFile,
                            @AuthenticationPrincipal CustomUserDetails user) throws Exception {

        String fileName = null;
        String original_img=null;
        
        if (!imgFile.isEmpty()) {
            fileName = imgFile.getOriginalFilename();
            String uploadPath = "C:/Springboot/Plantopia/src/main/resources/static/img/plantClinic/";
            File file = new File(uploadPath + fileName);
            imgFile.transferTo(file);
        } else {
			fileName = original_img;
		}

        PlantClinicDto dto = new PlantClinicDto();
        dto.setPlc_title(plc_title);
        dto.setGrowing_loc(growing_loc);
        dto.setGrowth_con(growth_con);
        dto.setWatering(watering);
        dto.setLast_rep(last_rep);
        dto.setLast_fert(last_fert);
        dto.setLast_pruned(last_pruned);
        dto.setPlant_pos(plant_pos);
        dto.setPest_dmg(pest_dmg);
        dto.setDiscolored(discolored);
        dto.setPlc_contents(plc_contents);
        dto.setPlc_img(fileName);
        dto.setUser_num(user.getUser_num());

        plantClinicService.insertClinic(dto);
        return "redirect:/Clinic/clinicList";
    }

    // 상세보기
    @RequestMapping("/Clinic/clinicDetail")
    public String clinicDetail(@RequestParam("plc_idx") int plc_idx,
                                @AuthenticationPrincipal CustomUserDetails user,
                                Model model) throws Exception {

    	// user가 null인지 확인
	    if (user == null) {
	        throw new IllegalStateException("User is not authenticated.");
	    }
		
	    // 클리닉 게시글 정보 가져오기
        PlantClinicDto clinic = plantClinicService.selectClinicDetail(plc_idx);
        if (clinic == null) {
	        throw new IllegalStateException("The clinic with id " + plc_idx + " doesn't exist.");
	    }
        
        // 댓글 목록
        List<PlantClinicCommentDto> comments = commentService.selectComments(plc_idx);
        if (comments == null) {
        	comments = new ArrayList<>(); // 빈 리스트로 초기화
	    }

        // 디버깅용 출력
	    System.out.println("clinic Details: " + clinic);
	    System.out.println("Comments: " + comments);
	    
	    // 댓글별 별점 정보 세팅
        for (PlantClinicCommentDto comment : comments) {
            Double avgRating = commentRatingsService.getAverageRating(comment.getPlccom_idx());
            Integer myRating = commentRatingsService.getUserRating(comment.getPlccom_idx(), user.getUser_num());
            comment.setAvgRating(avgRating);
            comment.setMyRating(myRating);
        }
	    
	    // 댓글 계층 정렬
	    comments = comments.stream()
	        .sorted(Comparator.comparingInt(PlantClinicCommentDto::getPlccom_root)
	                          .thenComparingInt(PlantClinicCommentDto::getPlccom_step)
	                          .thenComparingInt(PlantClinicCommentDto::getPlccom_indent))
	        .collect(Collectors.toList());
        
        model.addAttribute("clinic", clinic);
        model.addAttribute("commentList", comments);
        model.addAttribute("nickname", user.getUser_nickname());

        return "PlantClinic/clinicDetail";
    }
    
    // 글 수정 폼
    @RequestMapping("/Clinic/clinicUpdate")
    public String clinicUpdate(@RequestParam("plc_idx") int plc_idx, Model model) throws Exception {
        PlantClinicDto clinic = plantClinicService.selectClinicDetail(plc_idx);
        model.addAttribute("clinic", clinic);
        return "PlantClinic/clinicUpdate";
    }

    // 글 수정 
    @RequestMapping("/Clinic/clinicUpdateProc")
    public String clinicUpdateProc(@RequestParam("plc_idx") int plc_idx,
                                   @RequestParam("plc_title") String plc_title,
                                   @RequestParam("growing_loc") String growing_loc,
                                   @RequestParam("growth_con") String growth_con,
                                   @RequestParam("watering") String watering,
                                   @RequestParam("last_rep") String last_rep,
                                   @RequestParam("last_fert") String last_fert,
                                   @RequestParam("last_pruned") String last_pruned,
                                   @RequestParam("plant_pos") String plant_pos,
                                   @RequestParam("pest_dmg") String pest_dmg,
                                   @RequestParam("discolored") String discolored,
                                   @RequestParam("plc_contents") String plc_contents,
                                   @RequestParam("imgFile") MultipartFile imgFile,
                                   @RequestParam("original_img") String original_img) throws Exception {

        String fileName = null;
        if (!imgFile.isEmpty()) {
            fileName = imgFile.getOriginalFilename();
            String uploadPath = "C:/Springboot/Plantopia/src/main/resources/static/img/plantClinic/";
            File file = new File(uploadPath + fileName);
            imgFile.transferTo(file);
        } else {
            fileName = original_img;
        }

        PlantClinicDto clinic = new PlantClinicDto();
        clinic.setPlc_idx(plc_idx);
        clinic.setPlc_title(plc_title);
        clinic.setGrowing_loc(growing_loc);
        clinic.setGrowth_con(growth_con);
        clinic.setWatering(watering);
        clinic.setLast_rep(last_rep);
        clinic.setLast_fert(last_fert);
        clinic.setLast_pruned(last_pruned);
        clinic.setPlant_pos(plant_pos);
        clinic.setPest_dmg(pest_dmg);
        clinic.setDiscolored(discolored);
        clinic.setPlc_contents(plc_contents);
        clinic.setPlc_img(fileName);

        plantClinicService.updateClinic(clinic);
        return "redirect:/Clinic/clinicList";
    }

    // 글 삭제 
    @RequestMapping("/Clinic/clinicDelete")
    public String clinicDelete(@RequestParam("plc_idx") int plc_idx) throws Exception {
        plantClinicService.deleteClinic(plc_idx);
        return "redirect:/Clinic/clinicList";
    }
}
