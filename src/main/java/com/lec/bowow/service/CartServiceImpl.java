package com.lec.bowow.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.CartDao;
import com.lec.bowow.model.Cart;

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
			
			System.out.println("cart뿌려본다");
			System.out.println(cart.getProductCode());
			System.out.println(cart.getMemberId());
			System.out.println(cart.getSizeNum());
			System.out.println(cart.getColorNum());
			System.out.println(cart.getQty());
			
			result += cartDao.confirmCart(cart);
			
		}
		
		return result;
	}

}
