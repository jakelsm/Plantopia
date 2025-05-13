package com.plantopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.ICartDao;
import com.plantopia.dto.CartDto;

@Service
public class CartService {
	
	@Autowired
	ICartDao cartDao;
	
	// 1. 장바구니 리스트 보기(특정 사용자)
	public List<CartDto> getCartbyUser(int user_num) throws Exception{
		return cartDao.getCartbyUser(user_num);
	}
	
	public CartDto getCartbyIdx(int c_idx) throws Exception{
		return cartDao.getCartbyIdx(c_idx);
	}
	
	// 2. 장바구니 담기 기능
	public int insertCart(CartDto cartDto) throws Exception {
		return cartDao.insertCart(cartDto);
		
	}
		
	// 3. 장바구니 물품 수정 
	public int updateCart(CartDto cartDto) throws Exception {
		return cartDao.updateCart(cartDto);
	}
		
	// 4. 장바구니 물품 삭제
	public int deleteCart(int c_idx) throws Exception {
		return cartDao.deleteCart(c_idx);
	}
}
