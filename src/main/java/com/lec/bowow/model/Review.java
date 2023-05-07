package com.lec.bowow.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private int reviewNum;
	private String memberId;
	private String memberName;
	private String productCode;
	private String productName;
	private int productPrice;
	private String reviewTitle;
	private String reviewContent;
	private int reviewScore;
	private String reviewImage;
	private Date reviewDate;
	private String reviewIp;
	private int reviewHit;
	private String image;
	//페이징
	private int startRow;
	private int endRow;
	private String reviews;
	private String category;
	private String schWord;
}
