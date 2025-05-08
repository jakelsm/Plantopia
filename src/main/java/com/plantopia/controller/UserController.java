package com.plantopia.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.plantopia.dao.IUserDao;
import com.plantopia.dto.UserDto;

@Controller
public class UserController {
	@Autowired
	IUserDao iuserdao;
	
	@RequestMapping("/")
	public String root() {
		return "User/security/accountForm";
	}
	
	@RequestMapping("popup")
	public String popup() {
		return "User/security/jusoPopup";
	}
	
	@RequestMapping("accountWrite")
	public String accountWrite(UserDto dto) {
		iuserdao.insertUser(dto);
		return "redirect:accountList";
	}
	
	@RequestMapping("accountList")
	public ModelAndView memberList() throws Exception {
		ModelAndView mv = new ModelAndView("User/admin/accountList");
		
		List<UserDto> list = iuserdao.selectUser();
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping("accountUpdate")
	public String memberUpdate(@Param("user_num") int user_num, Model model) throws Exception {
		UserDto dto = iuserdao.selectUserDetail(user_num);
		model.addAttribute("dto", dto);
		return "User/security/accountUpdate";
	}
	
	@RequestMapping("accountUpdateOk")
	public String memberUpdateOk(UserDto dto) throws Exception {
		iuserdao.updateUser(dto);
		return "redirect:accountList";
	}
	
	@RequestMapping("accountDelete")
	public String memberDelete(@Param("user_num") int user_num) throws Exception {
		iuserdao.deleteUser(user_num);
		return "redirect:accountList";
	}
}
