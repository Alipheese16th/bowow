package com.lec.bowow.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.service.CartService;

@Controller
@RequestMapping(value="cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model, HttpSession httpSession) {
		model.addAttribute("cartList",cartService.cartList(httpSession));
		model.addAttribute("sizeList",cartService.sizeList());
		model.addAttribute("colorList",cartService.colorList());
		return "cart/list";
	};
	
	@RequestMapping(value = "confirmCart", method = {RequestMethod.GET,RequestMethod.POST})
	public String confirmCart(Model model, String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty) {
		model.addAttribute("result",cartService.confirmCart(productCode, memberId, sizeNum, colorNum, qty));
		return "cart/confirmCart";
	}
	
	@RequestMapping(value = "insertCart", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertCart() {
		return "";
	}
	
	
//	@RequestMapping(value="confirmCart", method=RequestMethod.GET)
//	public String confirmCart(Model model, String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty) {
//		
//		model.addAttribute("result",cartService.confirmCart(productCode, memberId, sizeNum, colorNum, qty));
//		
//		
//		model.addAttribute("productCode",productCode);
//		model.addAttribute("memberId",memberId);
//		model.addAttribute("sizeNum",sizeNum);
//		model.addAttribute("colorNum",colorNum);
//		model.addAttribute("qty",qty);
//		return "cart/confirmCart";
//	}
	
	
	
}
