package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lec.bowow.model.Order;
import com.lec.bowow.model.OrderDetail;

public interface OrderService {
	public String getOrderCode();
	public int insertOrder(HttpSession httpSession, Order order, int[] cartNum, int coupon);

	public List<Order> getOrderList(String pageNum, String memberId);
	public int totCntOrder(String memberId);
  
	// 주문 상세보기
	public Order contentOrder(String orderCode);
	public List<OrderDetail> contentOrderDetail(String orderCode);
	
}
