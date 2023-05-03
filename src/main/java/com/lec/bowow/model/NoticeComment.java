package com.lec.bowow.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeComment {
	private int ncNum;
	private String memberId;
	private int noticeNum;
	private String ncContent;
	private Timestamp ncDate;
	private String ncIp;
	private String memberName;
	private int startRow;
	private int endRow;
}
