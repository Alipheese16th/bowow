package com.lec.bowow.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Order;

@Mapper
public interface OrderDao {
	public int insertOrder(Order order);
	
}
