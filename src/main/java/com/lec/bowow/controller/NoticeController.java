package com.lec.bowow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.service.NoticeService;
import com.lec.bowow.util.Paging;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Model model) {
		model.addAttribute("list", noticeService.noticeList(pageNum));
		model.addAttribute("paging", new Paging(noticeService.totCntNotice(), pageNum));
		return "notice/list";
	}
}
