package com.lec.bowow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.model.Inquiry;
import com.lec.bowow.service.InquiryService;

@Controller
@RequestMapping("inquiry")
public class InquiryController {
	@Autowired
	private InquiryService inquiryService;
	@RequestMapping(value="list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Model model) {
		model.addAttribute("inquiryList", inquiryService.inquiryList(pageNum));
		return "inquiry/list";
	}
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write() {
		return "inquiry/write";
	}
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(Inquiry inquiry, Model model) {
		model.addAttribute("writeIResult", inquiryService.writeInquiry(inquiry));
		return "forward:list.do";
	}
	@RequestMapping(value="content", method= {RequestMethod.GET, RequestMethod.POST})
	public String content(int inquiryNum, Model model) {
		model.addAttribute("contentInquiry", inquiryService.contentInquiry(inquiryNum));
		return "inquiry/content";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modify(int inquiryNum, Model model) {
		return "inquiry/modify";
	}
	@RequestMapping(value="moidfy", method=RequestMethod.POST)
	public String modify(Inquiry inquiry, Model model) {
		model.addAttribute("modifyIResult", inquiryService.modifyInquiry(inquiry));
		return "forward:content.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int inquiryNum, Model model) {
		model.addAttribute("deleteIResult", inquiryService.deleteInquiry(inquiryNum));
		return "forward:list.do";
	}
}
