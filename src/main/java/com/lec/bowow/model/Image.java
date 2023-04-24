package com.lec.bowow.model;

import lombok.Data;

@Data
public class Image {
	private int imageNum;
	private String productCode;
	private String type;
	private String image;
	private int startRow;
	private int endRow;
}
