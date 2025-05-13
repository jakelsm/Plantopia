package com.plantopia.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.plantopia.dto.NoticeDto;
import com.plantopia.service.NoticeService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	// 1. 공지 게시판 전체 조회(+페이징기능)
	@RequestMapping("/NoticeMain")
	public String NoticeMain(@RequestParam(defaultValue="1",name = "page") int page, Model model) throws Exception {
		
		int pageSize = 8; // 한 페이지에 보여줄 공지사항 수
		
		List<NoticeDto> noticeList = noticeService.getNoticePaging(page, pageSize);  // 공지사항 목록 중 현재 페이지에 해당하는 8개만 가져옴 
		
		int totalPage = noticeService.getTotalNoticeCount(pageSize); // 전체 공지 수를 기반으로 총 페이지 수를 계산
		
		model.addAttribute("noticeLists", noticeList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage); 
		
		return "Notice/NoticeMain";
	}
	
	// 2. 공지 게시판 리스트 상세보기
	@RequestMapping("/NoticeDetail")
	public String NoticeDetail(@RequestParam("n_idx") int n_idx, Model model) throws Exception {
		NoticeDto notice = noticeService.getNoticeByIdx(n_idx);
		model.addAttribute("notice", notice);
		return "Notice/NoticeDetail";
	}
	
	
	// 3. 공지 게시판 작성	
	@RequestMapping("/addNotice")
	public String addNotice() throws Exception {
		return "Notice/addNoticeForm";
	}
	
	@RequestMapping("/addNoticeProcess")
	public String addNoticeProcess(@RequestParam("n_title") String n_title,
									@RequestParam("n_contents") String n_contents,
									@RequestParam("imgFile") MultipartFile imgFile,
									HttpServletRequest request) throws Exception {
		
		String fileName = null;
		String original_img = null;
		
		if(!imgFile.isEmpty()) {			
			fileName = imgFile.getOriginalFilename();			
			String uploadPath = "C:/upload/img/store/";
			File file = new File(uploadPath + fileName);
			imgFile.transferTo(file);
		} else {
			// 새로 업로드 안 하면 기존 이미지 유지
			fileName = original_img;
		}			
		
		NoticeDto noticeDto = NoticeDto.builder()
							.n_title(n_title)
							.n_contents(n_contents)
							.n_img(fileName)
							.build();
		
		noticeService.insertNotice(noticeDto);
		
		return "redirect:NoticeMain";
	}
		
	// 4. 공지 게시판 수정
	@RequestMapping("/updateNotice")
	public String updateNotice(@RequestParam("n_idx") int n_idx, Model model) throws Exception {
		NoticeDto noticeDto = noticeService.getNoticeByIdx(n_idx);
		model.addAttribute("notice", noticeDto);
		
		return "Notice/updateNoticeForm";		
	}
	
	@RequestMapping("/updateNoticeProcess")
	public String updateNoticeProcess(@RequestParam("n_idx") int n_idx,
										@RequestParam("n_title") String n_title,
										@RequestParam("n_contents") String n_contents,
										@RequestParam("imgFile") MultipartFile imgFile,
										@RequestParam("original_img") String original_img) throws Exception {
		
		String fileName;		
		
		if(!imgFile.isEmpty()) {			
			fileName = imgFile.getOriginalFilename();			
			String uploadPath = "C:/upload/img/store/";
			File file = new File(uploadPath + fileName);
			imgFile.transferTo(file);
		} else {
			// 새로 업로드 안 하면 기존 이미지 유지
			fileName = original_img;
		}
		
		NoticeDto noticeDto = NoticeDto.builder()
								.n_idx(n_idx)
								.n_title(n_title)
								.n_contents(n_contents)
								.n_img(fileName)
								.build();
		
		noticeService.updateNotice(noticeDto);
		
		return "redirect:NoticeMain";
	}
			
	// 5. 공지 게시판 삭제
	@RequestMapping("/deleteNotice")
	public String deleteNotice(@RequestParam("n_idx") int n_idx) throws Exception{
		noticeService.deleteNotice(n_idx);
		
		return "redirect:NoticeMain";
	}
	
	
	
}
