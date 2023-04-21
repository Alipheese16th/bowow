package com.lec.bowow.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {
	private int noticeNum;
	private String adminId;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	// 페이징
	private int startRow;
	private int endRow;
}
