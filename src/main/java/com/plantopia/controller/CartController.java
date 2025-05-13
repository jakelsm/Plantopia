package com.plantopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantopia.dto.CartDto;
import com.plantopia.service.CartService;
import com.plantopia.service.StoreService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	StoreService storeService;
	
	// 1. 장바구니 리스트 보기(특정 사용자)
	@RequestMapping("/getCartList")
	public String getCartList(@RequestParam("user_num") int user_num, Model model) throws Exception {
		model.addAttribute("cartList", cartService.getCartbyUser(user_num));
		return "Store/CartList";
	}
	
	// 2. 장바구니 담기 기능
	@RequestMapping("/addCart")
	public String addCart(@RequestParam("p_idx") int p_idx,						 
						 @RequestParam("c_img") String c_img,
						 @RequestParam("c_amount") int c_amount,						 
						 HttpSession session,
						 Model model) throws Exception {
		
		Integer user_num = (Integer) session.getAttribute("user_num");
		
		
		if(user_num == null) {
			return "redirect:login";
		}		
		
		int unitPrice = storeService.getStore(p_idx).getP_price();
		int totalPrice = unitPrice * c_amount;
		//int stock = storeService.getStore(p_idx).getP_stockQuantity();
		
		//if (c_amount < 1 || c_amount > stock) {
		       //throw new IllegalArgumentException("잘못된 수량입니다.");
		  //}
		
		//Integer user_num = (Integer) session.getAttribute("user_num");
		
		
		CartDto cartDto = new CartDto();
		cartDto.setP_idx(p_idx);
		cartDto.setUser_num(user_num);
		cartDto.setC_img(c_img);
		cartDto.setC_amount(c_amount);
		cartDto.setC_price(totalPrice);
		cartDto.setUser_num(user_num);
		
		cartService.insertCart(cartDto);
									
		return "redirect:/getCartList?user_num=" + user_num;
	}
	
	// 3. 장바구니 물품 수정 
	@RequestMapping("/CartUpdate")
	public String CartUpdate(@RequestParam("c_idx") int c_idx,Model model) throws Exception{
		CartDto cartDto = cartService.getCartbyIdx(c_idx);
		model.addAttribute("cart", cartDto);
		return "Store/CartUpdateForm";
		
	}
	
	@RequestMapping("/CartUpdateProcess")
	public String CartUpdateProcess(@RequestParam("c_idx") int c_idx,
									@RequestParam("c_amount") int c_amount,
									@RequestParam("user_num") int user_num
									) throws Exception {
				
		CartDto originCart = cartService.getCartbyIdx(c_idx); // 현재 장바구니 항목 조회
		
		
		int unitPrice = storeService.getStore(originCart.getP_idx()).getP_price(); // 상품 테이블에서 단가 조회
		
		CartDto cartDto = new CartDto();
		cartDto.setC_idx(c_idx);
		cartDto.setC_amount(c_amount);
		cartDto.setC_price(unitPrice * c_amount);
			
		cartService.updateCart(cartDto);
		
		return "redirect:/getCartList?user_num=" + user_num;	
	}
		
	
	// 4. 장바구니 물품 삭제
	@RequestMapping("/CartDelete")
	public String CartDelete(@RequestParam("c_idx") int c_idx,
							@RequestParam("user_num") int user_num
							) throws Exception {		
		cartService.deleteCart(c_idx);		
		return "redirect:/getCartList?user_num=" + user_num;
	}
	
}
