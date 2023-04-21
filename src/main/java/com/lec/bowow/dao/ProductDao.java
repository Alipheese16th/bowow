package com.lec.bowow.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lec.bowow.model.Color;
import com.lec.bowow.model.Product;
import com.lec.bowow.model.Image;
import com.lec.bowow.model.Sizes;

@Mapper
public interface ProductDao {
	
	public List<Product> productList(Product product);
	public int totCntProduct(Product product);
	
	public Product productDetail(String productCode);
	public List<Image> imageList(String productCode);
	
	public List<Product> searchProduct(String searchName);
	public int registerProduct(Product product);
	public int registerSize(Sizes sizes);
	public int registerColor(Color color);
	public int registerProductImage(Image productImage);
	public int modifyProduct(Product product);
	public int deleteProduct(String productCode);
	
}
