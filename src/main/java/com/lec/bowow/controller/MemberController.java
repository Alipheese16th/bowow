package com.lec.bowow.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.model.Member;
import com.lec.bowow.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@RequestMapping(value="join", method=RequestMethod.GET) 
	  public String join(){
		  return "member/join";
	}
	@RequestMapping(value="memberIdConfirm", method=RequestMethod.GET)
	public String memberIdConfirm(String memberId, Model model) {
		model.addAttribute("midConfirmResult", memberService.memberIdConfirm(memberId));
		return "member/memberIdConfirm";
	}
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String joinSuccess(@ModelAttribute("mDto") Member member, Model model) {
		model.addAttribute("joinResult", memberService.joinMember(member));
		return "member/login";
	}
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginView() {
		return "member/login";
	}
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(String memberId, String memberPw, String after, Model model, HttpSession session) {
		String loginResult = memberService.loginCheck(memberId, memberPw, session);
		if(loginResult.equals("로그인 성공")) {
			return "redirect:"+after;
		}else {
			model.addAttribute("loginResult", loginResult);
			model.addAttribute("memberId", memberId);
			model.addAttribute("memberPw", memberPw);
			return "member/login";
		}
	}
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
}
