package com.lec.bowow.model;

import lombok.Data;

@Data
public class Cart {
	private int cartNum;
	private String memberId;
	private String productCode;
	private int sizeNum;
	private int colorNum;
	private int qty;
	private int cost;
	// 장바구니 리스트에 보일 상품 관련 컬럼
	private String productName;
	private int productPrice;
	private int productDiscount;
	private int productStock;
	private String image;
	// 주문입력할때 필요한 주문코드
	private String orderCode;
}
