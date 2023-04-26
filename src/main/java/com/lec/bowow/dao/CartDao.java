package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Cart;

@Mapper
public interface CartDao {
	public int confirmCart(Cart cart);
	public List<Cart> cartList(String memberId);
	public int totCntCart(String memberId);
}
