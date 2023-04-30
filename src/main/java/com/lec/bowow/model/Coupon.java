package com.lec.bowow.model;

import lombok.Data;

@Data
public class Coupon {
	private int couponNum;
	private String memberId;
	private String couponName;
	private int couponDiscount;
}
