package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Cart;
import com.lec.bowow.model.Order;

@Mapper
public interface OrderDao {
	// 주문코드 뽑기
	public void createOrderCode();
	public String getOrderCode();
	// 주문입력
	public int insertOrder(Order order);
	// 주문상세입력
	public int insertOrderDetail(Cart cart);
	// 상품재고 업데이트
	public int stockUpdate(Cart cart);
	// 멤버 등급 업데이트
	public int updateMember(Order order);
	// 쿠폰사용후 삭제
	public int deleteCoupon(int couponNum);
	
	public List<Order> orderList(Order order);
	public int totCntOrder(String memberId);
	public int contentOrder(String orderCode);
	public int contentOrderDetail(String orderCode);
}
