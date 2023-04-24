package com.lec.bowow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.model.ProductImage;
import com.lec.bowow.service.ProductImageService;
import com.lec.bowow.util.Paging;

@Controller
@RequestMapping("productImage")
public class ProductImageController {
	@Autowired
	private ProductImageService productImageService;
	@RequestMapping(value="list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Model model) {
		model.addAttribute("productImageList", productImageService.productImageList(pageNum));
		model.addAttribute("paging", new Paging(productImageService.totCntProductImage(), pageNum));
		return "productImage/list";
	}
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register() {
		return "productImage/write";
	}
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(ProductImage productImage, Model model) {
		model.addAttribute("writePIResult", productImageService.registerProductImage(productImage));
		return "forward:list.do";
	}
	@RequestMapping(value="detail", method= {RequestMethod.GET, RequestMethod.POST})
	public String detail(int imageNum, Model model) {
		model.addAttribute("productImageDetail", productImageService.productImageDetail(imageNum));
		return "productImage/detail";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modify() {
		return "productImage/modify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify(ProductImage productImage, Model model) {
		model.addAttribute("modifyPIResult", productImageService.modifyProductImage(productImage));
		return "forward:content.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int imageNum, Model model) {
		model.addAttribute("deletePIResult", productImageService.deleteProductImage(imageNum));
		return "forward:list.do";
	}
}
