package com.lec.bowow.model;

import lombok.Data;

@Data
public class Admin {
	private String adminId;
	private String adminPw;
	private String adminName;
	private int sumTotal;
	private int cost;
}
