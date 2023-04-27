package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Cart;
import com.lec.bowow.model.Color;
import com.lec.bowow.model.Sizes;

@Mapper
public interface CartDao {
	public int confirmCart(Cart cart);
	public List<Cart> cartList(String memberId);
	public int totCntCart(String memberId);
	public List<Sizes> sizeList();
	public List<Color> colorList();
	public int insertCart(Cart cart);
	public int plusCart(Cart cart);
	public int updateCart(Cart cart);
	public int deleteCart(int cartNum);
	public int deleteAll(String memberId);
	
}
