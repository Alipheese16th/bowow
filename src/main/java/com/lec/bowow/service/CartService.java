package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lec.bowow.model.Cart;
import com.lec.bowow.model.Color;
import com.lec.bowow.model.Sizes;

public interface CartService {
	public int confirmCart(String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty);
	public List<Cart> cartList(HttpSession httpSession);
	public int totCntCart(HttpSession httpSession);
	public List<Sizes> sizeList();
	public List<Color> colorList();
	public int insertCart(String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty);
	public int updateCart(Cart cart);
	public void deleteCart(int[] cartNum);
	public void deleteAll(String memberId);
}
