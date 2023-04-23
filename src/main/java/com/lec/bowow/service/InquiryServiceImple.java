package com.lec.bowow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.InquiryDao;
import com.lec.bowow.model.Inquiry;
import com.lec.bowow.util.Paging;
@Service
public class InquiryServiceImple implements InquiryService {
	@Autowired
	private InquiryDao inquiryDao;
	@Override
	public List<Inquiry> inquiryList(String pageNum) {
		Paging paging = new Paging(inquiryDao.totCntInquiry(), pageNum);
		Inquiry inquiry = new Inquiry();
		return inquiryDao.inquiryList(inquiry);
	}
	@Override
	public int totCntInquiry() {
		return inquiryDao.totCntInquiry();
	}
	@Override
	public int writeInquiry(Inquiry inquiry) {
		return inquiryDao.writeInquiry(inquiry);
	}
	@Override
	public Inquiry contentInquiry(int inquiryNum) {
		return inquiryDao.contentInquiry(inquiryNum);
	}
	@Override
	public int modifyInquiry(Inquiry inquiry) {
		return inquiryDao.modifyInquiry(inquiry);
	}
	@Override
	public int deleteInquiry(int inquiryNum) {
		return inquiryDao.deleteInquiry(inquiryNum);
	}
}
