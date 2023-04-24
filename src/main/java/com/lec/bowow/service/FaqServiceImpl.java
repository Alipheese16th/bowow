package com.lec.bowow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.FaqDao;
import com.lec.bowow.model.Faq;
import com.lec.bowow.util.Paging;
@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDao faqDao;
	@Override
	public List<Faq> faqList(String pageNum) {
		Paging paging = new Paging(faqDao.totCntFaq(), pageNum);
		Faq faq = new Faq();
		faq.setStartRow(paging.getStartRow());
		faq.setEndRow(paging.getEndRow());
		return faqDao.faqList(faq);
	}
	@Override
	public int totCntFaq() {
		return faqDao.totCntFaq();
	}
	@Override
	public int writeFaq(Faq faq) {
		return faqDao.writeFaq(faq);
	}
	@Override
	public Faq contentFaq(String faqTitle) {
		return faqDao.contentFaq(faqTitle);
	}
	@Override
	public int modifyFaq(Faq faq) {
		return faqDao.modifyFaq(faq);
	}
	@Override
	public int deleteFaq(String faqTitle) {
		return faqDao.deleteFaq(faqTitle);
	}
}
