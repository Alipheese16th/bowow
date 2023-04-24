package com.lec.bowow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.model.Faq;
import com.lec.bowow.service.FaqService;
import com.lec.bowow.util.Paging;

@Controller
@RequestMapping("faq")
public class FaqController {
	@Autowired
	private FaqService faqService;
	@RequestMapping(value="list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Model model) {
		model.addAttribute("faqList", faqService.faqList(pageNum));
		model.addAttribute("paging", new Paging(faqService.totCntFaq(), pageNum));
		return "faq/list";
	}
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write() {
		return "faq/write";
	}
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(Faq faq, Model model) {
		model.addAttribute("writeFResult", faqService.writeFaq(faq));
		return "forward:list.do";
	}
	@RequestMapping(value="content", method= {RequestMethod.GET, RequestMethod.POST})
	public String content(String faqTitle, Model model) {
		model.addAttribute("contentFaq", faqService.contentFaq(faqTitle));
		return "faq/content";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modify(String faqTitle, Model model) {
		return "faq/content";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify(Faq faq, Model model) {
		model.addAttribute("modifyFResult", faqService.modifyFaq(faq));
		return "forward:content.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(String faqTitle, Model model) {
		model.addAttribute("deleteFResult", faqService.deleteFaq(faqTitle));
		return "forward:list.do";
	}
}
