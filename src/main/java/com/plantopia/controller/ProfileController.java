package com.plantopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantopia.dto.CustomUserDetails;
import com.plantopia.dto.PlantClinicDto;
import com.plantopia.dto.PlantDto;
import com.plantopia.dto.ProfileDto;
import com.plantopia.service.PlantClinicService;
import com.plantopia.service.PlantService;
import com.plantopia.service.ProfileService;

@Controller
public class ProfileController {
	private static final int PAGE_SIZE = 8;
	
    @Autowired
    private ProfileService profileService;
    
    @Autowired
    private PlantService plantService;
    
    @Autowired
    private PlantClinicService plantClinicService;
    
    /**
     * GET /profile
     * 로그인된 사용자(user_num)로 프로필 정보 조회 후 전달
     */
    @RequestMapping("/profile")
    public String profile(@AuthenticationPrincipal CustomUserDetails user,
    					  @RequestParam(defaultValue="1") int plantPage,
    					  @RequestParam(defaultValue="1") int clinicPage,
                          Model model) throws Exception {
        int userNum = user.getUser_num();
        
        // 1) Profile 기본 정보
        ProfileDto profile = profileService.getByUserNum(userNum);
        model.addAttribute("profile", profile);

        // 2) 평균 별점
        Double avgRating = profileService.getAverageRatingByUserNum(userNum);
        model.addAttribute("avgRating", avgRating);

        // 3) Plant 게시판 페이징
        int plantOffset = (plantPage - 1) * PAGE_SIZE;
        List<PlantDto> myPosts = plantService.selectPlantByUserPaging(userNum, plantOffset, PAGE_SIZE);
        int plantTotal = plantService.countByUser(userNum);
        int plantTotalPage = (int)Math.ceil((double)plantTotal / PAGE_SIZE);
        model.addAttribute("myPosts", myPosts);
        model.addAttribute("currentPlantPage", plantPage);
        model.addAttribute("totalPlantPage", plantTotalPage);

        // 4) Clinic 게시판 페이징
        int clinicOffset = (clinicPage - 1) * PAGE_SIZE;
        List<PlantClinicDto> myClinics = plantClinicService.selectClinicByUserPaging(userNum, clinicOffset, PAGE_SIZE);
        int clinicTotal = plantClinicService.countByUser(userNum);
        int clinicTotalPage = (int)Math.ceil((double)clinicTotal / PAGE_SIZE);
        model.addAttribute("clinicList", myClinics);
        model.addAttribute("currentClinicPage", clinicPage);
        model.addAttribute("totalClinicPage", clinicTotalPage);

        // 로그인 정보도 넘겨주면 JSP 권한 제어 등에 편합니다
        model.addAttribute("loginInfo", user);
        return "Profile/profile";  // /WEB-INF/views/Profile/profile.jsp
    }
}
