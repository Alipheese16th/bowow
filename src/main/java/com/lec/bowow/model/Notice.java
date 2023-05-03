package com.lec.bowow.model;

import java.sql.Timestamp;
import lombok.Data;

@Data
public class Notice {
	private int noticeNum;
	private String adminId;
	private String noticeTitle;
	private String noticeContent;
	private Timestamp noticeDate;
	private Timestamp noticeUpdate;
	private int noticeHit;
	// 페이징
	private int startRow;
	private int endRow;
	// 검색
	private String search;
}
