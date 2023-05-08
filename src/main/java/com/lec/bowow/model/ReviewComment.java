package com.lec.bowow.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewComment {
	private int commentNum;
	private String memberId;
	private int reviewNum;
	private String commentContent;
	private Date commentDate;
	private String commentIp;
	private int startRow;
	private int endRow;
}
