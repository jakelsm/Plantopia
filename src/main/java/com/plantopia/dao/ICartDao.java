package com.plantopia.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.plantopia.dto.CartDto;

@Mapper
public interface ICartDao {
	
	// 1. 장바구니 리스트 보기(특정 사용자)
	public List<CartDto> getCartbyUser(@Param("user_num") int user_num) throws Exception;
	
	// 장바구니 목록 하나 가져오기(제품고유번호로)
	public CartDto getCartbyIdx(int c_idx) throws Exception;
	
	// 2. 장바구니 담기 기능
	public int insertCart(CartDto cartDto) throws Exception;
	
	// 3. 장바구니 물품 수정 
	public int updateCart(CartDto cartDto) throws Exception;
	
	// 4. 장바구니 물품 삭제
	public int deleteCart(@Param("c_idx") int c_idx) throws Exception;
	
	// 5. 결제 - 토스페이 연동
}
