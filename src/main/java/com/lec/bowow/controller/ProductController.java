package com.lec.bowow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.bowow.model.Color;
import com.lec.bowow.model.Image;
import com.lec.bowow.model.Product;
import com.lec.bowow.model.Sizes;
import com.lec.bowow.service.ProductService;
import com.lec.bowow.service.QnaService;
import com.lec.bowow.util.Paging;

@Controller
@RequestMapping(value="product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private QnaService qnaService;
	
	// 상품 리스트
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(Model model, Product product, String pageNum) {
		model.addAttribute("productList",productService.productList(product, pageNum));
		model.addAttribute("paging",new Paging(productService.totCntProduct(product), pageNum, 16, 5));
		return "product/list";
	}
	// 상품 상세보기
	@RequestMapping(value="content", method=RequestMethod.GET)
	public String content(Model model, String productCode) {
		model.addAttribute("product",productService.productDetail(productCode));
		model.addAttribute("imageList",productService.imageList(productCode));
		model.addAttribute("sizeList",productService.sizeList(productCode));
		model.addAttribute("colorList",productService.colorList(productCode));
		model.addAttribute("qnaList",qnaService.productQnaList(productCode));
		return "product/content";
	}
	// 상품 검색
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(Model model, Product product, String pageNum) {
		model.addAttribute("productList",productService.searchProduct(product, pageNum));
		model.addAttribute("paging",new Paging(productService.totCntSearch(product), pageNum, 16, 5));
		return "product/search";
	}
	
	//////////////////// 관리자 상품관리
	// 관리자 상품 등록form
	@RequestMapping(value="insert", method= {RequestMethod.GET,RequestMethod.POST})
	public String insert(Model model) {
		// 상품리스트 가져와야함 (옵션에서 상품골랴아됨)
		model.addAttribute("productList",productService.allProductList());
		return "admin/insert";
	}
	// 관리자 상품 등록처리
	@RequestMapping(value="insertProduct", method=RequestMethod.POST)
	public String insertProduct(Model model, Product product) {
		model.addAttribute("productCode",productService.registerProduct(product));
		return "forward:insert.do";
	}
	// 관리자 상품이미지 등록처리
	@RequestMapping(value="insertImage", method=RequestMethod.POST)
	public String insertImage(Model model, Image image, String productCode, MultipartHttpServletRequest mRequest) {
		productService.registerImage(image, mRequest);
		model.addAttribute("productCode",productCode);
		return "forward:insert.do";
	}
	// 관리자 옵션 사이즈 등록처리
	@RequestMapping(value="insertSize", method=RequestMethod.POST)
	public String insertSize(Model model, Sizes sizes, String productCode) {
		productService.registerSize(sizes);
		model.addAttribute("productCode",productCode);
		return "forward:insert.do";
	}
	// 관리자 옵션 사이즈 등록처리
	@RequestMapping(value="insertColor", method=RequestMethod.POST)
	public String insertColor(Model model, Color color, String productCode) {
		productService.registerColor(color);
		model.addAttribute("productCode",productCode);
		return "forward:insert.do";
	}
	
	// 관리자 상품 검색 및 수정
	@RequestMapping(value="manage", method= {RequestMethod.GET,RequestMethod.POST})
	public String manage(Model model, Product product, String pageNum) {
		model.addAttribute("productList",productService.adminSearchProduct(product, pageNum));
		model.addAttribute("paging",new Paging(productService.adminTotCntSearch(product), pageNum, 10, 10));
		return "admin/productManage";
	}
	// 상품 판매정지 혹은 재판매 전환
	@RequestMapping(value="change", method=RequestMethod.GET)
	public String delete(String productCode) {
		productService.changeProduct(productCode);
		return "forward:manage.do";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modify(Model model, String productCode) {
		model.addAttribute("product",productService.productDetail(productCode));
		return "admin/productModify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify(Model model, Product product) {
		model.addAttribute("modifyResult",productService.modifyProduct(product));
		return "forward:manage.do";
	}
	
	
	
	
	
	
	
	
}
