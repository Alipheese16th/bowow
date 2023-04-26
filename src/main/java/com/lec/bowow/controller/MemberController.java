package com.lec.bowow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.service.MemberService;

@Controller
@RequestMapping(value="member")
public class MemberController {
	@Autowired
	private MemberService memberService;

	/*
	 * // member/join.do?->
	 * 
	 * @RequestMapping(value="join", method=RequestMethod.GET) public String join()
	 * { return "member/join"; }
	 */
	@RequestMapping(value="memberIdConfirm", method=RequestMethod.GET)
	public String memberIdConfirm(String memberId, Model model) {
		model.addAttribute("midConfirmResult", memberService.memberIdConfirm(memberId));
		return "member/memberIdConfirm";
	}
}
