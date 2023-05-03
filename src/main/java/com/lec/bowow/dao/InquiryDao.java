package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Inquiry;
import com.lec.bowow.model.Qna;

@Mapper
public interface InquiryDao {
	public List<Inquiry> inquiryList(Inquiry inquiry);
	public int totCntInquiry();
	public int writeInquiry(Inquiry inquiry);
	public Inquiry contentInquiry(int inquiryNum);
	public int modifyInquiry(Inquiry inquiry);
	public int deleteInquiry(int inquiryNum);
	public List<Inquiry> replyInquiryList(int inquiryNum);
	public void preReplyInquiry(Inquiry inquiry);
	public int replyInquiry(Inquiry inquiry);
}
