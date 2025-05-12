package com.plantopia.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.plantopia.dto.StoreCommentDto;
import com.plantopia.dto.StoreDto;
import com.plantopia.service.StoreCommentService;
import com.plantopia.service.StoreService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class StoreController {
	@Autowired
    private StoreService storeService;
	
	@Autowired
	StoreCommentService commentService;
	
	// 1. 스토어 게시판 전체 조회
	@RequestMapping("/StoreMain")
	public String StoreMain(@RequestParam(defaultValue="1",name = "page") int page, Model model) throws Exception {
		
		int pageSize = 8; 
		
		List<StoreDto> storeList = storeService.getStorePaging(page, pageSize);
		
		int totalPage = storeService.getToalStoreCount(pageSize);
		
		model.addAttribute("lists", storeList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		return "Store/StoreMain";
	}
	
	// 2. 스토어 후기 보기
	//  + 스토어 게시판 상세 조회	
		@RequestMapping("/StoreDetail")
		public String StoreDetail(@RequestParam("p_idx") int p_idx,Model model) throws Exception {
			// 상품 정보
			StoreDto store = storeService.getStore(p_idx);
			model.addAttribute("store", store);
			// 후기 리스트
			List<StoreCommentDto> commentList = commentService.getCommentByProduct(p_idx);
			model.addAttribute("commentList", commentList);
			
			return "Store/StoreDetail";
		}
	
	// 3. 스토어 게시판 제품 추가	
	@RequestMapping("/addStore")
	public String addStore() throws Exception {
		
		return "Store/addStoreForm";
	}
	
	@RequestMapping("/addProcess")
	public String addProcess(@RequestParam("p_name") String p_name,
							@RequestParam("imgFile") MultipartFile imgFile,
							@RequestParam("p_price") int p_price,
							@RequestParam("p_description") String p_description,
							@RequestParam("p_stockQuantity") int p_stockQuantity,
							HttpServletRequest request
			) throws Exception {
		
		
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
		
		StoreDto store = StoreDto.builder()
						.p_name(p_name)
						.p_img(fileName)
						.p_price(p_price)
						.p_description(p_description)
						.p_stockQuantity(p_stockQuantity)
						.build();
		
		storeService.insertStore(store);
		
		return "redirect:StoreMain";
		
	}
	
	// 4. 스토어 게시판 제품 수정	
	@RequestMapping("/StoreUpdate")
	public String StoreUpdate(@RequestParam("p_idx") int p_idx,Model model) throws Exception{
		StoreDto store = storeService.getStore(p_idx);
		model.addAttribute("store", store);
		return "Store/updateStore";
	}
	
	@RequestMapping("/StoreUpdateProcess")
	public String StoreUpdateProcess(
									@RequestParam("p_idx") int p_idx,
									@RequestParam("p_name") String p_name,
									@RequestParam("imgFile") MultipartFile imgFile,
									@RequestParam("p_price") int p_price,
									@RequestParam("p_description") String p_description,
									@RequestParam("p_stockQuantity") int p_stockQuantity,
									@RequestParam("original_img") String original_img,
									HttpServletRequest request) throws Exception{		
		
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
		
		StoreDto store = StoreDto.builder()
				.p_idx(p_idx)
				.p_name(p_name)
				.p_img(fileName)
				.p_price(p_price)
				.p_description(p_description)
				.p_stockQuantity(p_stockQuantity)
				.build();
		
		storeService.updateStore(store);
		
		return "redirect:StoreMain";
	}
	
	// 5. 스토어 게시판 제품 삭제	
	@RequestMapping("/StoreDelete")
	public String StoreDelete(@RequestParam("p_idx") int p_idx) throws Exception   {
		storeService.deleteStore(p_idx);
		
		return "redirect:StoreMain";
		
	}
	
	// 6. 스토어 게시판 제품명으로 검색	
	@RequestMapping("/StoreSearch")
	public String StoreSearch(@RequestParam("keyword") String keyword,Model model ) throws Exception {
		keyword = "%" + keyword + "%";
		List<StoreDto> searchList = storeService.searchStore(keyword);
		model.addAttribute("lists", searchList);
		return "Store/StoreMain";
	}

}
