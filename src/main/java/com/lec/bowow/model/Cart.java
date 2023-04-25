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
}
