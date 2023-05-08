package com.lec.bowow.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.service.ProductService;
@Controller
public class mainController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main(Model model) {
		model.addAttribute("hotList",productService.mainHotList());
		model.addAttribute("newList",productService.mainNewList());
		return "main/main";
	}
	
	@RequestMapping(value="ourStory", method=RequestMethod.GET)
	public String ourStory() {
		return "main/ourStory";
	}
	@RequestMapping(value="contact", method=RequestMethod.GET)
	public String contact() {
		return "main/contact";
	}
	@RequestMapping(value="magazine", method=RequestMethod.GET)
	public String magazine() {
		return "main/magazine";
	}
	
	@RequestMapping(value="eventClose", method=RequestMethod.GET)
	public String eventClose(HttpSession session) {
		session.setAttribute("eventClose", "eventClose");
		return "main/eventClose";
	}
	
}
