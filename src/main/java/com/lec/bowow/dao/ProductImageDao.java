package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.ProductImage;

@Mapper
public interface ProductImageDao {
	public List<ProductImage> productImageList(ProductImage productImage);
	public int totCntProductImage();
	public int addProductImage(ProductImage productImage);
	public ProductImage productImageDetail(int imageNum);
	public int modifyProductImage(ProductImage productImage);
	public int deleteProductImage(int imageNum);
}
