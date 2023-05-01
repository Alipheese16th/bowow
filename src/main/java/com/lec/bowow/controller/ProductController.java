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
		model.addAttribute("paging",new Paging(productService.totCntProduct(product), pageNum, 16, 5));
		return "product/list";
	}
	
	@RequestMapping(value="content", method=RequestMethod.GET)
	public String content(Model model, String productCode) {
		model.addAttribute("product",productService.productDetail(productCode));
		model.addAttribute("imageList",productService.imageList(productCode));
		model.addAttribute("sizeList",productService.sizeList(productCode));
		model.addAttribute("colorList",productService.colorList(productCode));
		return "product/content";
	}
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(Model model, Product product, String pageNum) {
		model.addAttribute("productList",productService.searchProduct(product, pageNum));
		model.addAttribute("paging",new Paging(productService.totCntSearch(product), pageNum, 16, 5));
		return "product/search";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insert() {
		return "admin/productInsert";
	}
	
	
	
}
