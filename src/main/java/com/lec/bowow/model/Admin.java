package com.lec.bowow.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Admin {
	private String adminId;
	private String adminPw;
	private String adminName;
	private Date orderDate;
	private int sumTotal;
	private String category;
}
