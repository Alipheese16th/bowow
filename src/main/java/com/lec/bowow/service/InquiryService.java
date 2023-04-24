package com.lec.bowow.service;

import java.util.List;

import com.lec.bowow.model.Inquiry;

public interface InquiryService {
	public List<Inquiry> inquiryList(String pageNum);
	public int totCntInquiry();
	public int writeInquiry(Inquiry inquiry);
	public Inquiry contentInquiry(int inquiryNum);
	public int modifyInquiry(Inquiry inquiry);
	public int deleteInquiry(int inquiryNum);
}
