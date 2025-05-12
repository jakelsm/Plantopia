package com.plantopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.plantopia.dto.CustomUserDetails;
import com.plantopia.dto.ProfileDto;
import com.plantopia.service.ProfileService;

@Controller
public class ProfileController {

    @Autowired
    private ProfileService profileService;

    /**
     * GET /profile
     * 로그인된 사용자(user_num)로 프로필 정보 조회 후 전달
     */
    @RequestMapping("/profile")
    public String profile(@AuthenticationPrincipal CustomUserDetails user,
                          Model model) {
        int userNum = user.getUser_num();
        ProfileDto profile = profileService.getByUserNum(userNum);
        model.addAttribute("profile", profile);
        return "Profile/profile";  // /WEB-INF/views/Profile/profile.jsp
    }
}
