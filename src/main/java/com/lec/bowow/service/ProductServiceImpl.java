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
import com.lec.bowow.dao.QnaDao;
import com.lec.bowow.dao.ReviewDao;
import com.lec.bowow.model.Color;
import com.lec.bowow.model.Product;
import com.lec.bowow.model.Qna;
import com.lec.bowow.model.Review;
import com.lec.bowow.model.Image;
import com.lec.bowow.model.Sizes;
import com.lec.bowow.util.Paging;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;
	@Autowired
	private QnaDao qnaDao;
	@Autowired
	private ReviewDao reviewDao;
	
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
	
	///////////////////////// 관리자 상품등록
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
			// 파일첨부안함   originalName = "";
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
	// 옵션 사이즈 등록
	@Override
	public int registerSize(Sizes sizes) {
		return productDao.registerSize(sizes);
	}
	// 옵션 색상 등록
	@Override
	public int registerColor(Color color) {
		return productDao.registerColor(color);
	}
	
	// 관리자 상품검색
	@Override
	public List<Product> adminSearchProduct(Product product, String pageNum) {
		if(product.getSearchName() == null) {
			System.out.println("관리자 modify 첫방문시 searchName 은 null이니까 빈문자열로 초기화");
			product.setSearchName("");
		}
		Paging paging = new Paging(adminTotCntSearch(product), pageNum, 10, 10);
		product.setStartRow(paging.getStartRow());
		product.setEndRow(paging.getEndRow());
		return productDao.adminSearchProduct(product);
	}
	@Override
	public int adminTotCntSearch(Product product) {
		return productDao.adminTotCntSearch(product);
	}
	
	// 상품 판매 정지 or 재판매 전환
	@Override
	public int changeProduct(String productCode) {
		int result = 0;
		String used = productDao.getUsed(productCode);
		if(used.equals("Y")) {
			result = productDao.deleteProduct(productCode);
		}else if(used.equals("N")) {
			result = productDao.activeProduct(productCode);
		}
		return result;
	}
	
	@Override
	public String modifyProduct(Product product) {
		int result = productDao.modifyProduct(product);
		if(result==0) {
			return "상품 수정 실패 오류 - "+product;
		}else {
			return "상품 수정 성공";
		}
	}
	@Override
	public List<Product> mainHotList() {
		return productDao.mainHotList();
	}
	@Override
	public List<Product> mainNewList() {
		return productDao.mainNewList();
	}
	
	// 상품상세에서 해당상품코드의 qna리스트
	@Override
	public List<Qna> productQnaList(String productCode, String pageNum) {
		Paging paging = new Paging(productQnaTotCnt(productCode), pageNum, 5, 3);
		Qna qna = new Qna();
		qna.setProductCode(productCode);
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		return qnaDao.productQnaList(qna);
	}
	@Override
	public int productQnaTotCnt(String productCode) {
		return qnaDao.productQnaTotCnt(productCode);
	}
	
	@Override
	public List<Review> productReviewList(String productCode, String pageNum) {
		Paging paging = new Paging(productReviewTotCnt(productCode), pageNum, 5, 3);
		Review review = new Review();
		review.setProductCode(productCode);
		review.setStartRow(paging.getStartRow());
		review.setEndRow(paging.getEndRow());
		return reviewDao.productReviewList(review);
	}
	@Override
	public int productReviewTotCnt(String productCode) {
		return reviewDao.productReviewTotCnt(productCode);
	}
	
	
	
	
	
	
	
	
	
	
	

}
