package com.lec.bowow.model;

import lombok.Data;

@Data
public class OrderDetail {
	private int odno;
	private String orderCode;
	private String productCode;
	private int sizeNum;
	private int colorNum;
	private int qty;
	private int cost;
	// 상품 정보 조인
	private String productName;
	private int productPrice;
	private int productDiscount;
	// 이미지 조인
	private String image;
}
