package com.lec.bowow.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	// 상품 검색
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
	// 질문게시판 상품 선택용
	@Override
	public List<Product> allProductList() {
		return productDao.allProductList();
	}
	
	
	// 상품등록
	@Override
	public String registerProduct(Product product) {
		productDao.registerProduct(product);
		return productDao.getProductCode();
	}
	// 상품 이미지 등록
	@Override
	public int registerImage(Image image, MultipartHttpServletRequest mRequest) {
		System.out.println("파일첨부시작");
		String uploadPath = mRequest.getSession().getServletContext().getRealPath("productImage/");
		String backupPath = "D:/webPro/source/10_2ndTeamProject/bowow/src/main/webapp/productImage/";
		MultipartFile mFile = mRequest.getFile("imageTemp");
		String originalName = mFile.getOriginalFilename();
		
		if(originalName != null && !originalName.equals("")) {
			// 파일 첨부함
			if(new File(uploadPath+originalName).exists()) {
				// 서버에 중복이름 파일이 있을경우
				originalName = System.currentTimeMillis() + "_" + originalName;
			}
			try {
				mFile.transferTo(new File(uploadPath+originalName)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + originalName);
				System.out.println("백업파일 : " + backupPath + originalName);
				boolean result = fileCopy(uploadPath + originalName, backupPath + originalName);
				System.out.println(result ? "백업성공":"백업실패");
			}catch (IOException e) {
				System.out.println(e.getMessage());
			} 
		}else {
			// 파일첨부안함
			//originalName = "";
		}
		image.setImage(originalName);
		return productDao.registerImage(image);
	}
	
	// 파일 백업 로직
	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null; 
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
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
