package com.lec.bowow.model;

import lombok.Data;

@Data
public class Inquiry {
	private int inquiryNum;
	private String memberId;
	private String adminId;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryEmail;
	private int inquiryGroup;
	private int inquiryStep;
}
