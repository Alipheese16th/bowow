package com.lec.bowow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.service.OrderService;
import com.lec.bowow.util.Paging;

@Controller
@RequestMapping(value="mypage")
public class MyPageController {
	@Autowired
	private OrderService orderService;
	@RequestMapping(value="order", method={RequestMethod.GET, RequestMethod.POST})
	public String mypage(String memberId, String pageNum, Model model) {
		model.addAttribute("orderList", orderService.getOrderList(pageNum, memberId));
		model.addAttribute("paging", new Paging(orderService.totCntOrder(memberId), pageNum, 10, 5));
		return "mypage/mypage_orderList";
	}
}
