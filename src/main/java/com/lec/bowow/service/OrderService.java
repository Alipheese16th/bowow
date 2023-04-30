package com.lec.bowow.service;

import javax.servlet.http.HttpSession;

import com.lec.bowow.model.Order;

public interface OrderService {
	public String getOrderCode();
	public int insertOrder(HttpSession httpSession, Order order, int[] cartNum, int coupon);
}
