package com.lec.bowow.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.model.Order;
import com.lec.bowow.service.CartService;
import com.lec.bowow.service.OrderService;
import com.lec.bowow.util.Paging;

@Controller
@RequestMapping(value="mypage")
public class MyPageController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;
	@RequestMapping(value="orderList", method=RequestMethod.GET)
	public String mypage(HttpSession session, String pageNum, Model model) {
		List<Order> orderList = orderService.getOrderList(pageNum, session);
		if(orderList==null) {
			return "redirect:../login.do?after=mypage/orderList.do";
		}else {
			model.addAttribute("orderList", orderList);
			model.addAttribute("paging", new Paging(orderService.totCntOrder(session), pageNum, 10, 5));
			return "mypage/orderList";
		}
	}
	@RequestMapping(value="orderDetail", method= {RequestMethod.GET,RequestMethod.POST})
	public String orderListContent(String orderCode, Model model) {
		model.addAttribute("contentorder",orderService.contentOrder(orderCode));
		model.addAttribute("orderDetail", orderService.contentOrderDetail(orderCode));
		model.addAttribute("totaldiscount", orderService.getorderdetailDiscount(orderCode));
		model.addAttribute("sizeList",cartService.sizeList());
		model.addAttribute("colorList",cartService.colorList());
		model.addAttribute("sumPrice", orderService.getorderSumCost(orderCode));
		return "mypage/orderDetail";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modifyView() {
		return "mypage/modify";
	}
}
