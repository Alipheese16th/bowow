package com.lec.bowow.model;

import lombok.Data;

@Data
public class Faq {
	private String faqTitle;
	private String faqContent;
	private int startRow;
	private int endRow;
	private String oldFaqTitle;
}
