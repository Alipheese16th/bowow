package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Cart;
import com.lec.bowow.model.Color;
import com.lec.bowow.model.Sizes;

@Mapper
public interface CartDao {
	// 카트 중복조회
	public int confirmCart(Cart cart);
	// 카트 리스트
	public List<Cart> cartList(String memberId);
	public List<Sizes> sizeList();
	public List<Color> colorList();
	// 카트 새로등록
	public int insertCart(Cart cart);
	// 카트 중복추가
	public int plusCart(Cart cart);
	// 카트 수량변경
	public int updateCart(Cart cart);
	// 카트 제거
	public int deleteCart(int cartNum);
	// 카트 전부제거
	public int deleteAll(String memberId);
	// aop 장바구니 수량 상시체크
	public int totCntCart(String memberId);
	
	// 카트추가 후 cartNum 확보 (상품상세 -> 주문하기)
	public int getCartNum(Cart cart);
	
	// 주문처리시 상품정보필요할때
	public Cart getCart(int cartNum);
	
}
