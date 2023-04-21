package com.lec.bowow.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Product {
	private String productCode;
	private String category;
	private String productName;
	private String productContent;
	private int productPrice;
	private int productDiscount;
	private Date productDate;
	private int productStock;
	private String prooductUsed;
	private String image;
	// 페이징을 위한 필드
	private int startRow;
	private int endRow;
}
