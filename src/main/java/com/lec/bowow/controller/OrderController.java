package com.lec.bowow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="order")
public class OrderController {
	
	@RequestMapping(value="write", method = RequestMethod.GET)
	public String write(Model model) {
		return "order/write";
	}

}
