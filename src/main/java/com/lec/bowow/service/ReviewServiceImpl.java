package com.lec.bowow.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.bowow.dao.ReviewDao;
import com.lec.bowow.model.Member;
import com.lec.bowow.model.Review;
import com.lec.bowow.util.Paging;
@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao reviewDao;
	//String backupPath = "/Users/gimsoyeon/sykim/source/10_2nd_teamProject/bowow/src/main/webapp/reviewImage/";
	//String backupPath = "C:/webPro/source/10_2ndTeamProject/bowow/src/main/webapp/reviewImage/"; //소연씨꺼
	String backupPath = "D:/webPro/source/10_2ndTeamProject/bowow/src/main/webapp/reviewImage/"; // 멤버공용
	
	@Override
	public List<Review> reviewList(Review review, String pageNum) {
		Paging paging = new Paging(reviewDao.totCntReview(review), pageNum, 16, 5);
		review.setStartRow(paging.getStartRow());
		review.setEndRow(paging.getEndRow());		
		return reviewDao.reviewList(review);
	}
	@Override
	public int totCntReview(Review review) {
		return reviewDao.totCntReview(review);
	}
	@Override
	public Review reviewProduct(String productCode) {
		return reviewDao.reviewProduct(productCode);
	}
	@Override
	public int writeReview(Review review, MultipartHttpServletRequest mRequest, HttpServletRequest request, String reviewRating) {
		String uploadPath = mRequest.getRealPath("reviewImage/");
		Iterator<String> params = mRequest.getFileNames();
		String reviewImage = "";
		if(params.hasNext()) {
			String param = params.next();
			System.out.println(param);
			MultipartFile mFile = mRequest.getFile(param);
			reviewImage = mFile.getOriginalFilename();
			System.out.println("파일이름 : " + (reviewImage.equals("")? "빈스트링" : reviewImage));
			if(reviewImage!=null && !reviewImage.equals("")) {
				// 파일 첨부함
				if(new File(uploadPath+reviewImage).exists()) {
					// 중복된 파일은 파일명 변경
					reviewImage = System.currentTimeMillis()+"_"+reviewImage;
				}
				try {
					mFile.transferTo(new File(uploadPath+reviewImage));
					System.out.println("서버파일 : " + uploadPath+reviewImage);
					System.out.println("백업파일 : " + backupPath+reviewImage);
					int result = fileCopy(uploadPath+reviewImage, backupPath+reviewImage);
					System.out.println(result == 1 ? "파일 복사 성공": "파일 복사 실패 ");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
		}else {
			System.out.println("파일첨부안함");
		}
		System.out.println(reviewImage);
		if(!reviewRating.equals("")) {
			review.setReviewScore(Integer.parseInt(reviewRating));
		}
		System.out.println(review.getReviewScore());
		review.setReviewImage(reviewImage);
		review.setReviewIp(request.getRemoteAddr());
		return reviewDao.writeReview(review);
	}
	@Override
	public Review getDetailReview(int reviewNum) {
		reviewDao.reviewHitUp(reviewNum);
		return reviewDao.getDetailReview(reviewNum);
	}
	@Override
	public int modifyReview(Review review, MultipartHttpServletRequest mRequest, HttpServletRequest request, String reviewRating, HttpSession session) {
		String uploadPath = mRequest.getRealPath("reviewImage/");
		Iterator<String> params = mRequest.getFileNames();
		String reviewImage = "";
		if(params.hasNext()) {
			String param = params.next();
			System.out.println(param);
			MultipartFile mFile = mRequest.getFile(param);
			reviewImage = mFile.getOriginalFilename();
			System.out.println("파일이름 : " + (reviewImage.equals("")? "빈스트링" : reviewImage));
			if(reviewImage!=null && !reviewImage.equals("")) {
				// 파일 첨부함
				if(new File(uploadPath+reviewImage).exists()) {
					// 중복된 파일은 파일명 변경
					reviewImage = System.currentTimeMillis()+"_"+reviewImage;
				}
				try {
					mFile.transferTo(new File(uploadPath+reviewImage));
					System.out.println("서버파일 : " + uploadPath+reviewImage);
					System.out.println("백업파일 : " + backupPath+reviewImage);
					int result = fileCopy(uploadPath+reviewImage, backupPath+reviewImage);
					System.out.println(result == 1 ? "파일 복사 성공": "파일 복사 실패 ");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
		}else {
			System.out.println("파일첨부안함");
		}
		System.out.println(reviewImage);
		if(!reviewRating.equals("")) {
			review.setReviewScore(Integer.parseInt(reviewRating));
		}
		Member member = (Member) session.getAttribute("member");
		if(member==null) {
			return 0;
		}
		review.setMemberId(member.getMemberId());
		System.out.println(member.getMemberId());
		System.out.println(review.getReviewScore());
		review.setReviewImage(reviewImage);
		review.setReviewIp(request.getRemoteAddr());
		return reviewDao.modifyReview(review);
	}
	//이미지파일 복사
	private int fileCopy(String serverFile, String backupFile) {
		int isCopy = 0;
		InputStream is = null;
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nRead = is.read(buff);
				if(nRead==-1) {
					break;
				}
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
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
	public int deleteReview(int reviewNum) {
		return reviewDao.deleteReview(reviewNum);
	}
}

