package com.lec.bowow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.model.Notice;
import com.lec.bowow.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(Model model, String pageNum, String type, String search) {
		model.addAttribute("noticeList", noticeService.getNoticeList(pageNum, type, search));
		model.addAttribute("paging", noticeService.getPaging(pageNum, type, search));
		return "notice/noticeList";
	}
	
	@RequestMapping(value="content", method = RequestMethod.GET)
	public String content(Model model, int noticeNum, String pageNum, String type, String search) {
		model.addAttribute("noticeList", noticeService.getNoticeList(pageNum, type, search));
		model.addAttribute("paging", noticeService.getPaging(pageNum, type, search));
		model.addAttribute("notice",noticeService.contentNotice(noticeNum));
		return "notice/content";
	}
	
	@RequestMapping(value="write", method = RequestMethod.GET)
	public String write() {
		return "notice/write";
	}
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String write(Model model, Notice notice) {
		model.addAttribute("noticeWriteResult",noticeService.writeNotice(notice));
		return "forward:list.do";
	}
	
	
	
	
}
