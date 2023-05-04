package com.lec.bowow.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Qna {
	private int qnaNum;
	private String memberId;
	private String adminId;
	private String productCode;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private int qnaGroup;
	private int qnaStep;
	private int qnaIndent;
	private String qnaIp;
	private int qnaHit;
	// 회원이름
	private String memberName;
	// 페이징
	private int startRow;
	private int endRow;
	// 검색
	private String schItem;
	private String schWord;
	// 상품
	private String image;
}
