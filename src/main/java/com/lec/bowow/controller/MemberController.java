package com.lec.bowow.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping(value="memberEmailConfrim", method=RequestMethod.GET)
	public String memberEmailConfrim(String memberEmail, Model model) {
		model.addAttribute("mEmailConfirmResult", memberService.memberMailConfirm(memberEmail));
		return "member/memberEmailConfrim";
	}
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String joinMember(@ModelAttribute("mDto") Member member, String memberBirthTemp ,Model model, HttpSession session) {
		model.addAttribute("joinResult", memberService.joinMember(member, memberBirthTemp, session));
		return "member/login";
	}
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginView() {
		return "member/login";
	}
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(String memberId, String memberPw, String after, String productCode, Model model, HttpSession session) {
		String loginResult = memberService.loginCheck(memberId, memberPw, session);
		if(loginResult.equals("로그인 성공")) {
			return "redirect:"+after+"?productCode="+productCode;
		}else {
			model.addAttribute("loginResult", loginResult);
			model.addAttribute("memberId", memberId);
			model.addAttribute("memberPw", memberPw);
			return "member/login";
		}
	}
	@RequestMapping(value="findId", method=RequestMethod.GET)
	public String findIdView() {
		return "member/findId";
	}
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String findId(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail, Model model) {
		String idResult = memberService.searchIdMember(memberName, memberEmail);
		model.addAttribute("idResult",idResult);
//		if(idResult.equals("가입 시 입력하신 회원 정보가 맞는지 다시 한번 확인해 주세요.")) {
//			model.addAttribute("idResult", idResult);
//			model.addAttribute("memberName", memberName);
//			model.addAttribute("memberEmail", memberEmail);
//			return "redirect:member/findId.jsp";
//		}else {
//			model.addAttribute("idResult", idResult);
//			return "member/findIdSuccess";
//		}
		if(idResult==null) {
			return "redirect:findId.do?asdf="+"asdf";
		}else {
			return "member/findIdSuccess";
		}
		// 학원에서 실행했을 때 되던거
//		if(idResult==null) {
//			return "redirect:member/findId.jsp?asdf="+"asdf";
//		}else {
//			return "member/findIdSuccess";
//		}
	}
	@RequestMapping(value="findPw",method=RequestMethod.GET)
	public String findPwView() {
		return "member/findPw";
	}
	@RequestMapping(value="findPw", method=RequestMethod.POST)
	public String findPw(String memberId, String memberEmail, Model model) {
		String pwResult = memberService.searchPwMember(memberId, memberEmail);
		model.addAttribute("pwResult", pwResult);
		if(pwResult==null) {
			return "redirect:findPw.do?asdf="+"asdf";
		}else {
			model.addAttribute("memberEmail", memberEmail);
			return "member/findPwSuccess";			
		}
	}
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
}
