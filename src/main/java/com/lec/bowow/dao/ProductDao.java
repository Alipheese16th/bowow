package com.lec.bowow.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lec.bowow.model.Color;
import com.lec.bowow.model.Product;
import com.lec.bowow.model.Image;
import com.lec.bowow.model.Sizes;

@Mapper
public interface ProductDao {
	
	// 상품목록
	public List<Product> productList(Product product);
	public int totCntProduct(Product product);
	// 상품상세보기
	public Product productDetail(String productCode);
	public List<Image> imageList(String productCode);
	public List<Sizes> sizeList(String productCode);
	public List<Color> colorList(String productCode);
	// 조회수 업
	public void productHitUp(String productCode);
	// 상품 검색
	public List<Product> searchProduct(Product product);
	public int totCntSearch(Product product);
	// 질문게시판 상품선택
	public List<Product> allProductList();
	
	//////////////////// 관리자 상품 관리
	// 상품 등록
	public int registerProduct(Product product);
	// 방금등록한 상품의 코드
	public String getProductCode();
	// 상품 이미지 등록
	public int registerImage(Image image);
	// 상품 사이즈 등록
	public int registerSize(Sizes sizes);
	// 상품 색상 등록
	public int registerColor(Color color);
	
	// 관리자
	public List<Product> adminSearchProduct(Product product);
	public int adminTotCntSearch(Product product);
	public String getUsed(String productCode);
	public int deleteProduct(String productCode);
	public int activeProduct(String productCode);
	public int modifyProduct(Product product);
	
	// 메인페이지
	public List<Product> mainHotList();
	public List<Product> mainNewList();
	
}
