package com.lec.bowow.controller;

import javax.servlet.http.HttpSession;

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
	public String list(Faq faq, String pageNum, Model model) {
		model.addAttribute("faqList", faqService.faqList(faq, pageNum));
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
		model.addAttribute("faq", faqService.contentFaq(faqTitle));
		return "faq/modify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify(Faq faq, HttpSession httpSession, Model model) {
		try {
			model.addAttribute("modifyFResult", faqService.modifyFaq(faq, httpSession));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("modifyFResult", "수정 실패");
		}
		return "forward:list.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(String faqTitle, Model model) {
		model.addAttribute("deleteFResult", faqService.deleteFaq(faqTitle));
		return "forward:list.do";
	}
}
