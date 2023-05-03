package com.lec.bowow.controller;

import javax.servlet.http.HttpSession;

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
	@RequestMapping(value="orderList", method=RequestMethod.GET)
	public String mypage(HttpSession session, String pageNum, Model model) {
		model.addAttribute("orderList", orderService.getOrderList(pageNum, session));
		model.addAttribute("paging", new Paging(orderService.totCntOrder(session), pageNum, 10, 5));
		return "mypage/orderList";
	}
	@RequestMapping(value="orderDetail", method=RequestMethod.GET)
	public String orderListContent(String orderCode, Model model) {
		model.addAttribute("contentorder",orderService.contentOrder(orderCode));
		model.addAttribute("orderDetail", orderService.contentOrderDetail(orderCode));
		return "mypage/orderDetail";
	}
}
