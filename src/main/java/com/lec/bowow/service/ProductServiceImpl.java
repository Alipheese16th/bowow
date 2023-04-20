package com.lec.bowow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.ProductDao;
import com.lec.bowow.model.Color;
import com.lec.bowow.model.Product;
import com.lec.bowow.model.ProductImage;
import com.lec.bowow.model.Sizes;
import com.lec.bowow.util.Paging;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public List<Product> productList(Product product, String pageNum) {
		Paging paging = new Paging(totCntProduct(product), pageNum, 20, 5);
		product.setStartRow(paging.getStartRow());
		product.setEndRow(paging.getEndRow());
		return productDao.productList(product);
	}

	@Override
	public int totCntProduct(Product product) {
		return productDao.totCntProduct(product);
	}

	@Override
	public Product productDetail(String productCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> searchProduct(String searchName) {
		// TODO Auto-generated method stub
		return null;
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
	public int registerProductImage(ProductImage productImage) {
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