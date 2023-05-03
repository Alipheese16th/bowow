package com.lec.bowow.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private int reviewNum;
	private String memberId;
	private String productCode;
	private String reviewTitle;
	private String reviewContent;
	private int reviewScore;
	private String reviewImage;
	private Date reviewDate;
	private String reviewIp;
	private int reviewHit;
}
