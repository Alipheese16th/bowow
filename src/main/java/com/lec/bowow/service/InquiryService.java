package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lec.bowow.model.Inquiry;

public interface InquiryService {
	public List<Inquiry> inquiryList(Inquiry inquiry, String pageNum);
	public int totCntInquiry();
	public int writeInquiry(Inquiry inquiry, HttpSession httpSession);
	public Inquiry contentInquiry(int inquiryNum);
	public int modifyInquiry(Inquiry inquiry);
	public int deleteInquiry(int inquiryNum);
	public int replyInquiry(Inquiry inquiry, HttpSession httpSession);
}
