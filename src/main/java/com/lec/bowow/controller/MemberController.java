package com.lec.bowow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="member")
public class MemberController {
	// member/join.do?->
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join() {
		return "member/join";
	}
}
