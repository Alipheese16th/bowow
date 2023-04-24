package com.lec.bowow.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "admin/login";
	}
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(String adminId, String adminPw, HttpSession httpSession, Model model) {
		System.out.println("dd");
		String adminLoginResult = adminService.adminLogin(adminId, adminPw, httpSession);
		if(adminLoginResult.equals("관리자 로그인 성공")) {
			model.addAttribute("adminLoginResult", adminLoginResult);
			System.out.println("dd");
			return "forward:admin/main.do";
		} else {
			System.out.println("ss");
			model.addAttribute("adminLoginResult", adminLoginResult);
			model.addAttribute("adminId", adminId);
			model.addAttribute("adminPw", adminPw);
			System.out.println("ss");
			return "admin/login";
		}
	}
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession httpsession) {
		httpsession.invalidate();
		return "forward:main.do";
	}
}
