package com.lec.bowow.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.lec.bowow.model.Cart;
import com.lec.bowow.service.CartService;

@Controller
@RequestMapping(value="cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	// 장바구니 리스트
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model, HttpSession httpSession) {
		model.addAttribute("cartList",cartService.cartList(httpSession));
		model.addAttribute("sizeList",cartService.sizeList());
		model.addAttribute("colorList",cartService.colorList());
		return "cart/list";
	};
	// 상품상세에서 중복확인
	@RequestMapping(value = "confirmCart", method = {RequestMethod.GET,RequestMethod.POST})
	public String confirmCart(Model model, String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty) {
		model.addAttribute("result",cartService.confirmCart(productCode, memberId, sizeNum, colorNum, qty));
		return "cart/confirmCart";
	}
	// 상품상세에서 장바구니에 추가
	@RequestMapping(value = "insertCart", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertCart(String productCode, String memberId, int[] sizeNum, int[] colorNum, int[] qty) {
		cartService.insertCart(productCode, memberId, sizeNum, colorNum, qty);
		return "cart/confirmCart";
	}
	// 장바구니에서 수량 변경
	@RequestMapping(value = "updateCart", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateCart(Cart cart) {
		cartService.updateCart(cart);
		return "forward:list.do";
	}
	// 장바구니에서 전체삭제
	@RequestMapping(value = "deleteAll", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteAll(String memberId) {
		cartService.deleteAll(memberId);
		return "forward:list.do";
	}
	
	
	// 장바구니에서 선택삭제
	@RequestMapping(value = "select", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteCart(String submit, int[] cartNum) {
		
		System.out.println(submit);
		
		if(submit.equals("선택삭제")) {
			System.out.println("삭제하시죠");
			cartService.deleteCart(cartNum);
		}else {
			System.out.println("주문하시죠");
			return "";
		}
		
		return "forward:list.do";
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
