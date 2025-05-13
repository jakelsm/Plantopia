package com.plantopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.plantopia.dto.CustomUserDetails;
import com.plantopia.dto.PlantClinicDto;
import com.plantopia.dto.PlantDto;
import com.plantopia.dto.ProfileDto;
import com.plantopia.service.PlantClinicService;
import com.plantopia.service.PlantService;
import com.plantopia.service.ProfileService;

@Controller
public class ProfileController {

    @Autowired
    private ProfileService profileService;
    
    @Autowired
    private PlantService plantService;
    
    @Autowired
    private PlantClinicService plantClinicService;       // ← 추가
    
    /**
     * GET /profile
     * 로그인된 사용자(user_num)로 프로필 정보 조회 후 전달
     */
    @RequestMapping("/profile")
    public String profile(@AuthenticationPrincipal CustomUserDetails user,
                          Model model) throws Exception {
        int userNum = user.getUser_num();
        
        // Profile 정보
        ProfileDto profile = profileService.getByUserNum(userNum);
        model.addAttribute("profile", profile);

        // 내가 쓴 Plant 게시판 글 목록
        List<PlantDto> myPosts = plantService.selectPlantByUser(userNum);
        model.addAttribute("myPosts", myPosts);
        
        // 내가 쓴 Clinic 글
        List<PlantClinicDto> myClinics = plantClinicService.getClinicsByUser(userNum);
        model.addAttribute("clinicList", myClinics);
		
        // 로그인 정보도 그대로 전달하면, JSP에서 권한별 버튼 제어 등에 쓰기 편합니다.
        model.addAttribute("myPosts", myPosts);
        return "Profile/profile";  // /WEB-INF/views/Profile/profile.jsp
    }
}
