package com.lec.bowow.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.model.Order;
import com.lec.bowow.service.CartService;
import com.lec.bowow.service.MemberService;
import com.lec.bowow.service.OrderService;

@Controller
@RequestMapping(value="order")
public class OrderController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="write", method = RequestMethod.GET)
	public String write(Model model, HttpSession httpSession) {
		model.addAttribute("cartList",cartService.cartList(httpSession));
		model.addAttribute("sizeList",cartService.sizeList());
		model.addAttribute("colorList",cartService.colorList());
		model.addAttribute("orderCode",orderService.getOrderCode());
		model.addAttribute("couponList",memberService.couponList(httpSession));
		return "order/write";
	}
	
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String write(Model model, HttpSession httpSession, Order order, int[] cartNum, int[] chkNum, String submit, int coupon) {
		System.out.println("컨트롤러왔음");
		orderService.insertOrder(httpSession, order, cartNum, coupon);
		model.addAttribute("order",order);
		return "order/result";
	}
	
	// 상품상세에서 장바구니추가후 바로 주문form
	@RequestMapping(value = "orderProduct", method = RequestMethod.GET)
	public String orderProduct(Model model, String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty) {
		model.addAttribute("cartNumList",cartService.orderProduct(productCode, memberId, sizeNum, colorNum, qty));
		return "forward:write.do";
	}
	// 장바구니에서 상품 하나 주문버튼
	@RequestMapping(value = "orderCart", method = RequestMethod.GET)
	public String orderCart(Model model, int[] cartNum) {
		model.addAttribute("cartNumList",cartNum);
		return "forward:write.do";
	}
	
	/*
	 * @RequestMapping(value ="orderDelete", method= RequestMethod.GET) public
	 * String orderDelete(int[] cartNum) { cartService.deleteCart(cartNum); return
	 * "forward:write.do"; }
	 */
	

}
