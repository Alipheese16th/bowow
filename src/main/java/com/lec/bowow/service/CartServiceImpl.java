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

	@Override
	public List<Cart> cartList(HttpSession httpSession) {
		Member member = (Member)httpSession.getAttribute("member");
		return cartDao.cartList(member.getMemberId());
	}
	@Override
	public int totCntCart(HttpSession httpSession) {
		Member member = (Member)httpSession.getAttribute("member");
		return cartDao.totCntCart(member.getMemberId());
	}
	@Override
	public List<Sizes> sizeList() {
		return cartDao.sizeList();
	}

	@Override
	public List<Color> colorList() {
		return cartDao.colorList();
	}

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
			result += cartDao.insertCart(cart);
		}
		return result;
	}
	
	
	
	

}
