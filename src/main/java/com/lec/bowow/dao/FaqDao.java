package com.lec.bowow.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lec.bowow.model.Faq;

@Mapper
public interface FaqDao {
	public List<Faq> faqList(Faq faq);
	public int totCntFaq();
	public int writeFaq(Faq faq);
	public Faq contentFaq(String faqTitle);
	public int modifyFaq(Faq faq);
	public int deleteFaq(String faqTitle);
}
