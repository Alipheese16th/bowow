package com.lec.bowow.service;

public interface CartService {
	public int confirmCart(String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty);
}
