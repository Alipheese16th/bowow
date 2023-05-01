package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lec.bowow.model.Order;

public interface OrderService {
	public String getOrderCode();
	public int insertOrder(HttpSession httpSession, Order order, int[] cartNum, int coupon);
	public List<Order> getOrderList(String pageNum, String memberId);
	public int totCntOrder(String memberId);
}
