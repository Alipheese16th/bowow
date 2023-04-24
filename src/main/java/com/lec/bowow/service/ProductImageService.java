package com.lec.bowow.service;

import java.util.List;

import com.lec.bowow.model.ProductImage;

public interface ProductImageService {
	public List<ProductImage> productImageList(String pageNum);
	public int totCntProductImage();
	public int addProductImage(ProductImage productImage);
	public ProductImage productImageDetail(int imageNum);
	public int modifyProductImage(ProductImage productImage);
	public int deleteProductImage(int imageNum);
}
