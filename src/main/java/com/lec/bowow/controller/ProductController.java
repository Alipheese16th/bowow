package com.lec.bowow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.model.Product;
import com.lec.bowow.service.ProductService;
import com.lec.bowow.util.Paging;

@Controller
@RequestMapping(value="product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(Model model, Product product, String pageNum) {
		model.addAttribute("productList",productService.productList(product, pageNum));
		model.addAttribute("paging",new Paging(productService.totCntProduct(product), pageNum, 20, 5));
		return "product/list";
	}
	
	
	
	
	
	
	
	
}
