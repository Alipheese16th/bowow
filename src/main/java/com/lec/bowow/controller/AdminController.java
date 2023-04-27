package com.lec.bowow.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.model.Qna;
import com.lec.bowow.service.AdminService;
import com.lec.bowow.service.QnaService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private QnaService qnaService;
	@RequestMapping(value="main", method= {RequestMethod.GET, RequestMethod.POST})
	public String main(Model model, String pageNum) {
		//model.addAttribute("mainList", adminService.mainList());
		model.addAttribute("qnaList", qnaService.qnaList());
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
