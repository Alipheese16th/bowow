package com.lec.bowow.service;

import java.util.List;
import com.lec.bowow.model.Faq;

public interface FaqService {
	public List<Faq> faqList(Faq faq, String pageNum);
	public int totCntFaq();
	public int writeFaq(Faq faq);
	public Faq contentFaq(String faqTitle);
	public int modifyFaq(Faq faq);
	public int deleteFaq(String faqTitle);
}
