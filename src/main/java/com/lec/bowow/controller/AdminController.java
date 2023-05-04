package com.lec.bowow.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.dao.OrderDao;
import com.lec.bowow.model.Faq;
import com.lec.bowow.model.Inquiry;
import com.lec.bowow.model.Qna;
import com.lec.bowow.service.AdminService;
import com.lec.bowow.service.FaqService;
import com.lec.bowow.service.InquiryService;
import com.lec.bowow.service.NoticeService;
import com.lec.bowow.service.QnaService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private FaqService faqService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private OrderDao orderDao;
	@RequestMapping(value="main", method= {RequestMethod.GET, RequestMethod.POST})
	public String main(Qna qna, Faq faq, Inquiry inquiry, String type, String search, Model model, String pageNum) {
		//model.addAttribute("mainList", adminService.mainList());
		model.addAttribute("qnaList", qnaService.qnaList(qna, pageNum));
		model.addAttribute("faqList", faqService.faqList(faq, pageNum));
		model.addAttribute("noticeList", noticeService.getNoticeList(pageNum, type, search));
		model.addAttribute("inquiryList", inquiryService.inquiryList(inquiry, pageNum));
		model.addAttribute("dateSales", orderDao.salesOfDate());
//		List<String> temp1 = new ArrayList<String>(); temp1.add("fashion"); temp1.add("abcc");temp1.add("zzzz");temp1.add("yyy");temp1.add("hello");
//		List<Integer> temp2 = new ArrayList<Integer>();temp2.add(1200); temp2.add(3600);temp2.add(1200); temp2.add(3600);temp2.add(1200); 
//		model.addAttribute("categorySales", temp1);
//		model.addAttribute("sumTotalSales", temp2);
		model.addAttribute("categorySales", orderDao.salesOfCategory());
		model.addAttribute("categorySumTotal", orderDao.sumTotalOfCategory());
		return "admin/main";
	}
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "admin/login";
	}
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(String adminId, String adminPw, HttpSession httpSession, Model model) {
		String adminLoginResult = adminService.adminLogin(adminId, adminPw, httpSession);
		if(adminLoginResult.equals("관리자 로그인 성공")) {
			model.addAttribute("adminLoginResult", adminLoginResult);
			return "forward:main.do";
		} else {
			model.addAttribute("adminLoginResult", adminLoginResult);
			model.addAttribute("adminId", adminId);
			model.addAttribute("adminPw", adminPw);
			return "admin/login";
		}
	}
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession httpsession) {
		httpsession.invalidate();
		return "main/main";
	}
}
