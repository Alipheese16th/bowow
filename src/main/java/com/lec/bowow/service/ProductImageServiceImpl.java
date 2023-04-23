package com.lec.bowow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.ProductImageDao;
import com.lec.bowow.model.ProductImage;
import com.lec.bowow.util.Paging;
@Service
public class ProductImageServiceImpl implements ProductImageService {
	@Autowired
	private ProductImageDao productImageDao;
	@Override
	public List<ProductImage> productImageList(String pageNum) {
		Paging paging = new Paging(productImageDao.totCntProductImage(), pageNum);
		ProductImage productImage = new ProductImage();
		productImage.setStartRow(paging.getStartRow());
		productImage.setEndRow(paging.getEndRow());
		return null;
	}
	@Override
	public int totCntProductImage() {
		return productImageDao.totCntProductImage();
	}
	@Override
	public int registerProductImage(ProductImage productImage) {
		return productImageDao.registerProductImage(productImage);
	}
	@Override
	public ProductImage productImageDetail(int imageNum) {
		return productImageDao.productImageDetail(imageNum);
	}
	@Override
	public int modifyProductImage(ProductImage productImage) {
		return productImageDao.modifyProductImage(productImage);
	}
	@Override
	public int deleteProductImage(int imageNum) {
		return productImageDao.deleteProductImage(imageNum);
	}
}
