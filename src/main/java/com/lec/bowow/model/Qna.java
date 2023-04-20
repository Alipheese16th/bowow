package com.lec.bowow.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Qna {
	private int qnaNum;
	private String memberId;
	private String productCode;
	private String qnaTitle;
	private String qnaContent;
	private String qnaImage;
	private Date qnaDate;
	private int qnaGroup;
	private int qnaStep;
	private int qnaIndent;
	private String qnaIP;
}