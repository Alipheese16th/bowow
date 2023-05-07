package com.lec.bowow.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.bowow.model.Color;
import com.lec.bowow.model.Product;
import com.lec.bowow.model.Qna;
import com.lec.bowow.model.Image;
import com.lec.bowow.model.Sizes;

public interface ProductService {
	// 상품목록
	public List<Product> productList(Product product, String pageNum);
	public int totCntProduct(Product product);
	// 상품상세보기
	public Product productDetail(String productCode);
	public List<Image> imageList(String productCode);
	public List<Sizes> sizeList(String productCode);
	public List<Color> colorList(String productCode);
	// 상품검색
	public List<Product> searchProduct(Product product, String pageNum);
	public int totCntSearch(Product product);
	// 모든 상품 리스트 (질문게시판작성 or 상품등록)
	public List<Product> allProductList();
	
	// 상품등록하고 상품코드 가져오기
	public String registerProduct(Product product);
	public int registerImage(Image image, MultipartHttpServletRequest mRequest);
	public int registerSize(Sizes sizes);
	public int registerColor(Color color);
	// 관리자 상품검색
	public List<Product> adminSearchProduct(Product product, String pageNum);
	public int adminTotCntSearch(Product product);
	// productUsed 전환
	public int changeProduct(String productCode);
	// 상품 수정
	public String modifyProduct(Product product);
	
	// 메인페이지
	public List<Product> mainHotList();
	public List<Product> mainNewList();
	
	// 상품상세에서 게시판
	public List<Qna> productQnaList(String productCode, String pageNum);
	public int productQnaTotCnt(String productCode);
}
