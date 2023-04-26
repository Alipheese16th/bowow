package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lec.bowow.model.Cart;

public interface CartService {
	public int confirmCart(String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty);
	public List<Cart> cartList(HttpSession httpSession);
	public int totCntCart(HttpSession httpSession);
	
}
