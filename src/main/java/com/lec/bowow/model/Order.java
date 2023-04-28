package com.lec.bowow.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Order {
	private String orderCode;
	private String memberId;
	private Date orderDate;
	private String orderName;
	private String orderPost;
	private String orderAddr1;
	private String orderAddr2;
	private String orderTel;
}
