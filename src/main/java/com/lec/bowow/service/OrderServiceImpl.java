package com.lec.bowow.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.CartDao;
import com.lec.bowow.dao.OrderDao;
import com.lec.bowow.model.Cart;
import com.lec.bowow.model.Member;
import com.lec.bowow.model.Order;
@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private CartDao cartDao;

	@Override
	public String getOrderCode() {
		orderDao.createOrderCode();
		return orderDao.getOrderCode();
	}

	@Override
	public int insertOrder(HttpSession httpSession, Order order, int[] cartNum, int coupon) {
		
		System.out.println("서비스왔음");
		
		Member member = (Member) httpSession.getAttribute("member");
		order.setMemberId(member.getMemberId());
		
		System.out.println("주문 총 가격은 : "+order.getTotalPrice());
		System.out.println("쿠폰Num은 : "+coupon);
		// 주문입력
		int result = orderDao.insertOrder(order);
		System.out.println(result==1?"주문 입력 성공":"주문 입력 실패");
		
		// cartNum 배열 (상품이 여러개일수있으니 반복문처리)
		for (int i = 0; i < cartNum.length; i++) {
			
			// cartNum으로 해당 카트정보 가져오기
			Cart cart = cartDao.getCart(cartNum[i]);
			cart.setOrderCode(order.getOrderCode());
			
			// 주문상세 입력
			orderDao.insertOrderDetail(cart);
			System.out.println("주문디테일 입력중 : "+cartNum[i]);
			
			// 상품재고 업데이트
			orderDao.stockUpdate(cart);
			// 주문끝난 상품 장바구니 비우기
			cartDao.deleteCart(cartNum[i]);
			
		}//for
		
		// 멤버등급 업데이트
		orderDao.updateMember(order);
		
		// 쿠폰 사용했으면 삭제
		if(coupon != 0) {
			orderDao.deleteCoupon(coupon);
		}
		
		return result;
	}
	
	

}
