package com.plantopia.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.plantopia.dao.IUserDao;
import com.plantopia.dto.CustomUserDetails;
import com.plantopia.dto.NoticeDto;
import com.plantopia.dto.PlantDto;
import com.plantopia.dto.StoreDto;
import com.plantopia.dto.UserDto;
import com.plantopia.service.NoticeService;
import com.plantopia.service.PlantService;
import com.plantopia.service.PostLikeService;
import com.plantopia.service.ProfileService;
import com.plantopia.service.StoreService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	IUserDao iuserdao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
    private ProfileService profileService;
	
	@Autowired
	private PlantService plantService;
	
	@Autowired
	private PostLikeService postLikeService;
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/")
	public String root() {
		return "User/security/login";
	}
	
	@RequestMapping("popup")
	public String popup() {
		return "User/security/jusoPopup";
	}
	
	@RequestMapping("/accountForm")
	public String accountForm() {
	    return "User/security/accountForm";
	}
	
	@RequestMapping("accountWrite")
	public String accountWrite(UserDto dto, Model model) {
		UserDto existingUser = iuserdao.findByUserId(dto.getUser_id());
		
		if (existingUser != null) {
	        model.addAttribute("errorMsg", "이미 사용 중인 아이디입니다.");
	        return "User/security/accountForm"; // 다시 회원가입 폼으로 이동
	    }
		
		dto.setUser_authority("user");
		
		// 비밀번호 암호화 후 저장
		dto.setUser_passwd(passwordEncoder.encode(dto.getUser_passwd()));
		iuserdao.insertUser(dto);
		
		// User insert 후 반환된 dto.getUser_num()으로 Profile 생성
        profileService.createProfile(dto.getUser_num());
		
		return "redirect:accountList";
	}
	
	@RequestMapping("checkUserId")
	@ResponseBody
	public String checkUserId(@RequestParam("user_id") String user_id) {
	    UserDto existingUser = iuserdao.findByUserId(user_id);
	    return (existingUser != null) ? "EXISTS" : "AVAILABLE";
	}
	
	@RequestMapping("checkNickname")
	@ResponseBody
	public String checkNickname(@RequestParam("user_nickname") String nickname) {
	    UserDto user = iuserdao.findByUserNickname(nickname);
	    return (user != null) ? "EXISTS" : "AVAILABLE";
	}
	
	@RequestMapping("checkEmail")
	@ResponseBody
	public String checkEmail(@RequestParam("user_email") String email) {
	    UserDto user = iuserdao.findByUserEmail(email);
	    return (user != null) ? "EXISTS" : "AVAILABLE";
	}
	
	// 1) 로그인 화면
	@RequestMapping("/login")
    public String loginPage() {
        return "User/security/login";
    }
	
	// 2) 로그인 성공 확인용 (필요 없으면 삭제 가능)
	@RequestMapping("/Main")
	public String mainPage(@AuthenticationPrincipal CustomUserDetails user, Model model, HttpSession session) throws Exception {
	    if (user != null) {	    	
	    	session.setAttribute("user_num", user.getUser_num());
	        session.setAttribute("user_nickname", user.getUser_nickname());
	        
	        model.addAttribute("loginInfo", user);
	        
	        // 2) Plant 전체 리스트 가져오기
	        List<PlantDto> allPlants = plantService.selectPlantList();

	        // 3) 각 글별 (조회수 + 좋아요) 합산 → 정렬 → 상위 8개 추출
	        List<Map<String,Object>> popularList = allPlants.stream()
	            .map(p -> {
	                Map<String,Object> m = new HashMap<>();
	                m.put("pla_idx",    p.getPla_idx());
	                m.put("pla_title",  p.getPla_title());
	                m.put("hit_cnt",    p.getPla_hit_cnt());
	                try {
	                    int likeCount = postLikeService.countLike(p.getPla_idx());
	                    m.put("likeCount", likeCount);
	                } catch(Exception e) {
	                    m.put("likeCount", 0);
	                }
	                // 순위 기준 점수
	                m.put("score", ((Integer)m.get("hit_cnt")) + ((Integer)m.get("likeCount")));
	                return m;
	            })
	            .sorted((m1, m2) -> ((Integer)m2.get("score")).compareTo((Integer)m1.get("score")))
	            .limit(8)
	            .collect(Collectors.toList());

	        model.addAttribute("popularList", popularList);
	        
	        // 스토어 게시글 5개 가져오기 (최신순 or 인기순)
	        List<StoreDto> storeList = storeService.getTop5();
	        model.addAttribute("storeList", storeList);
	        
	        // 최근 공지사항 5개 가져오기
			List<NoticeDto> noticeList = noticeService.getRecentNotices();
			model.addAttribute("noticeList", noticeList);
	        
	        return "Main/main"; // 로그인 성공 후 확인용 JSP
	    } else {
	    	return "redirect:/login?error=fail"; // 로그인되지 않은 상태일 경우
	    }
	}
	
	@RequestMapping("adminpage")
	public String adminPage() {
	    return "User/admin/adminpage"; // 실제 JSP 위치
	}
	
	@RequestMapping("accountList")
	public ModelAndView memberList() throws Exception {
		ModelAndView mv = new ModelAndView("User/admin/accountList");
		
		List<UserDto> list = iuserdao.selectUser();
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping("accountUpdate")
	public String memberUpdate(@Param("user_num") Integer user_num, Model model) throws Exception {
		UserDto dto = iuserdao.selectUserDetail(user_num);
		model.addAttribute("dto", dto);
		return "User/security/accountUpdate";
	}
	
	@RequestMapping("accountUpdateOk")
	public String memberUpdateOk(UserDto dto, @AuthenticationPrincipal CustomUserDetails principal) throws Exception {
		iuserdao.updateUser(dto);
		
		// ① 비밀번호를 새로 입력했으면 암호화
        if (dto.getUser_passwd() != null && !dto.getUser_passwd().isEmpty()) {
            String raw = dto.getUser_passwd();
            dto.setUser_passwd(passwordEncoder.encode(raw));
        }

        // ② DB 업데이트
        iuserdao.updateUser(dto);
		
        // ③ 본인이 수정한 경우 프로필로, 아니라면 리스트로
		if (dto.getUser_num() == principal.getUser_num()) {
            return "redirect:/profile";
        }
		return "redirect:accountList";
	}
	
	@RequestMapping("accountDelete")
	public String memberDelete(@Param("user_num") Integer user_num, @AuthenticationPrincipal CustomUserDetails principal) throws Exception {
		iuserdao.deleteUser(user_num);
		
		// ② 자신이 탈퇴한 거라면 로그아웃 후 로그인 화면으로,
        //    관리자가 삭제한 거라면 /accountList 로
        if (user_num.equals(principal.getUser_num())) {
            // (선택) 세션 클리어
            SecurityContextHolder.clearContext();
            return "redirect:/login";
        }
        // 관리자가 삭제한 경우 리스트로
		return "redirect:accountList";
	}
}
