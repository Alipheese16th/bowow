package com.lec.bowow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.ProductDao;
import com.lec.bowow.model.Color;
import com.lec.bowow.model.Product;
import com.lec.bowow.model.Image;
import com.lec.bowow.model.Sizes;
import com.lec.bowow.util.Paging;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;
	
	// 상품리스트
	@Override
	public List<Product> productList(Product product, String pageNum) {
		Paging paging = new Paging(totCntProduct(product), pageNum, 16, 5);
		product.setStartRow(paging.getStartRow());
		product.setEndRow(paging.getEndRow());
		return productDao.productList(product);
	}
	@Override
	public int totCntProduct(Product product) {
		return productDao.totCntProduct(product);
	}
	// 상품상세보기
	@Override
	public Product productDetail(String productCode) {
		// 조회수업
		productDao.productHitUp(productCode);
		return productDao.productDetail(productCode);
	}
	@Override
	public List<Image> imageList(String productCode) {
		return productDao.imageList(productCode);
	}
	@Override
	public List<Sizes> sizeList(String productCode) {
		return productDao.sizeList(productCode);
	}
	@Override
	public List<Color> colorList(String productCode) {
		return productDao.colorList(productCode);
	}
	
	@Override
	public List<Product> searchProduct(Product product, String pageNum) {
		Paging paging = new Paging(totCntSearch(product), pageNum, 16, 5);
		product.setStartRow(paging.getStartRow());
		product.setEndRow(paging.getEndRow());
		return productDao.searchProduct(product);
	}
	@Override
	public int totCntSearch(Product product) {
		return productDao.totCntSearch(product);
	}
	
	@Override
	public List<Product> allProductList() {
		return productDao.allProductList();
	}
	
	
	

	@Override
	public int registerProduct(Product product) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerSize(Sizes sizes) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerColor(Color color) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerProductImage(Image productImage) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyProduct(Product product) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProduct(String productCode) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	

}
