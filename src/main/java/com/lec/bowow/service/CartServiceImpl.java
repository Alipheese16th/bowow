package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.CartDao;
import com.lec.bowow.model.Cart;
import com.lec.bowow.model.Color;
import com.lec.bowow.model.Member;
import com.lec.bowow.model.Sizes;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;
	// 장바구니 중복확인
	@Override
	public int confirmCart(String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty) {
		int result = 0;
		for (int i = 0; i < qty.length; i++) {
			Cart cart = new Cart();
			cart.setProductCode(productCode);
			cart.setMemberId(memberId);
			if(sizeNum != null) {
				cart.setSizeNum(sizeNum[i]);
			}
			if(colorNum != null) {
				cart.setColorNum(colorNum[i]);
			}
			cart.setQty(qty[i]);
			System.out.println("confirmCart 로직 실행중");
			System.out.println(cart.getProductCode());
			System.out.println(cart.getMemberId());
			System.out.println(cart.getSizeNum());
			System.out.println(cart.getColorNum());
			System.out.println(cart.getQty());
			result += cartDao.confirmCart(cart);
		}
		return result;
	}
	// 헤더에 장바구니 갯수 확인하는거
	@Override
	public int totCntCart(HttpSession httpSession) {
		Member member = (Member)httpSession.getAttribute("member");
		return cartDao.totCntCart(member.getMemberId());
	}
	// 장바구니 리스트
	@Override
	public List<Cart> cartList(HttpSession httpSession) {
		
		Member member = (Member)httpSession.getAttribute("member");
		if(member == null) {
			return null;
		}else {
			return cartDao.cartList(member.getMemberId());
		}
		
		
	}
	@Override
	public List<Sizes> sizeList() {
		return cartDao.sizeList();
	}
	@Override
	public List<Color> colorList() {
		return cartDao.colorList();
	}
	// 상품상세에서 장바구니에 상품추가
	@Override
	public int insertCart(String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty) {
		int result = 0;
		for (int i = 0; i < qty.length; i++) {
			Cart cart = new Cart();
			cart.setProductCode(productCode);
			cart.setMemberId(memberId);
			if(sizeNum != null) {
				cart.setSizeNum(sizeNum[i]);
			}
			if(colorNum != null) {
				cart.setColorNum(colorNum[i]);
			}
			cart.setQty(qty[i]);
			System.out.println("inserCart 서비스로직 실행중");
			System.out.println(cart.getProductCode());
			System.out.println(cart.getMemberId());
			System.out.println(cart.getSizeNum());
			System.out.println(cart.getColorNum());
			System.out.println(cart.getQty());
			
			if(cartDao.confirmCart(cart) == 0) { // 해당 상품이 존재하지 않는다면
				// 상품등록
				cartDao.insertCart(cart);
			}else { // 만약 해당 상품이 이미 존재한다면?
				// 상품 수량 추가
				cartDao.plusCart(cart);
			}
		}
		return result;
	}
	// 장바구니에서 상품수량 변경
	@Override
	public int updateCart(Cart cart) {
		return cartDao.updateCart(cart);
	}
	// 장바구니에서 상품삭제
	@Override
	public void deleteCart(int[] cartNum) {
		for (int i = 0; i < cartNum.length; i++) {
			cartDao.deleteCart(cartNum[i]);
		}
	}
	// 장바구니에서 상품 전체삭제
	@Override
	public void deleteAll(String memberId) {
		cartDao.deleteAll(memberId);
	}
	
	@Override
	public int[] orderProduct(String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty) {
		
		int[] cartNumList = new int[qty.length];
		
		for (int i = 0; i < qty.length; i++) {
			Cart cart = new Cart();
			cart.setProductCode(productCode);
			cart.setMemberId(memberId);
			if(sizeNum != null) {
				cart.setSizeNum(sizeNum[i]);
			}
			if(colorNum != null) {
				cart.setColorNum(colorNum[i]);
			}
			cart.setQty(qty[i]);
			System.out.println("orderProduct 서비스로직 실행중");
			System.out.println(cart.getProductCode());
			System.out.println(cart.getMemberId());
			System.out.println(cart.getSizeNum());
			System.out.println(cart.getColorNum());
			System.out.println(cart.getQty());
			
			if(cartDao.confirmCart(cart) == 0) { // 해당 상품이 존재하지 않는다면
				cartDao.insertCart(cart);
			}else { // 만약 해당 상품이 이미 존재한다면?
				cartDao.plusCart(cart);
			}
			cartNumList[i] = cartDao.getCartNum(cart);
		}
		
		return cartNumList;
	}
	
	
	
	

}
