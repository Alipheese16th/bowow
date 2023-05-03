package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.CartDao;
import com.lec.bowow.dao.OrderDao;
import com.lec.bowow.model.Cart;
import com.lec.bowow.model.Member;
import com.lec.bowow.model.Order;
import com.lec.bowow.util.Paging;
import com.lec.bowow.model.OrderDetail;

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
	
	// 주문처리
	@Override
	public int insertOrder(HttpSession httpSession, Order order, int[] cartNum, int coupon) {
		Member member = (Member) httpSession.getAttribute("member");
		if(member == null) {
			return 0;
		}
		order.setMemberId(member.getMemberId());
		System.out.println("주문 총 가격은 : "+order.getTotalPrice());
		System.out.println("쿠폰Num은 : "+coupon);
		// 1. 주문입력
		int result = orderDao.insertOrder(order);
		System.out.println(result==1?"주문 입력 성공":"주문 입력 실패");
		// cartNum 배열 (상품이 여러개일수있으니 반복문처리)
		for (int i = 0; i < cartNum.length; i++) {
			// cartNum으로 해당 카트정보 가져오기
			Cart cart = cartDao.getCart(cartNum[i]);
			cart.setOrderCode(order.getOrderCode());
			// 2. 주문상세 입력
			orderDao.insertOrderDetail(cart);
			System.out.println("주문디테일 입력중 : "+cartNum[i]);
			// 3. 상품재고 업데이트
			orderDao.stockUpdate(cart);
			System.out.println("재고업데이트완료");
			// 4. 주문끝난 상품 장바구니 비우기
			cartDao.deleteCart(cartNum[i]);
			System.out.println("장바구니비우기완료");
		}//for
		// 5. 멤버등급 업데이트
		orderDao.updateMember(order);
		System.out.println("멤버등급조정완료");
		// 6. 쿠폰 사용했으면 삭제
		System.out.println("현재 쿠폰번호 : "+coupon);
		if(coupon != 0) {
			orderDao.deleteCoupon(coupon);
			System.out.println("쿠폰삭제완료");
		}
		return result;
	}

	/*마이페이지 주문내역*/
	@Override
	public List<Order> getOrderList(String pageNum, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		Paging paging = new Paging(orderDao.totCntOrder(member.getMemberId()), pageNum, 10, 5);
		Order order = new Order();
		order.setStartRow(paging.getStartRow());
		order.setEndRow(paging.getEndRow());
		order.setMemberId(member.getMemberId());
		return orderDao.orderList(order);
	}
  
  @Override
	public int totCntOrder(HttpSession session) {
	  Member member = (Member) session.getAttribute("member");
		return orderDao.totCntOrder(member.getMemberId());
	}


	// 주문상세보기
	@Override
	public Order contentOrder(String orderCode) {
		System.out.println("주문상세 서비스");
		return orderDao.contentOrder(orderCode);
	}
	@Override
	public List<OrderDetail> contentOrderDetail(String orderCode) {
		System.out.println("주문상세디테일 서비스");
		return orderDao.contentOrderDetail(orderCode);
	}
	

	
}
