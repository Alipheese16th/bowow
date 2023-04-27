package com.lec.bowow.service;

import java.util.List;
import com.lec.bowow.model.Color;
import com.lec.bowow.model.Product;
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
	// 질문게시판 상품선택
	public List<Product> allProductList();
	
	public int registerProduct(Product product);
	public int registerSize(Sizes sizes);
	public int registerColor(Color color);
	public int registerProductImage(Image productImage);
	public int modifyProduct(Product product);
	public int deleteProduct(String productCode);
	
	
}
