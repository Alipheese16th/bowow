package com.lec.bowow.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Cart;

@Mapper
public interface CartDao {
	public int confirmCart(Cart cart);
}
