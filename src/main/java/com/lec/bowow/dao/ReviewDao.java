package com.lec.bowow.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Review;

@Mapper
public interface ReviewDao {
	public List<Review>reviewList(Review review);
	public int totCntReview(Review review);
	public Review reviewProduct(String productCode);
	public int writeReview(Review review);
	public void reviewHitUp(int reviewNum);
	public Review getDetailReview(int reviewNum);
	public int modifyReview(Review review);
	public int deleteReview(int reviewNum);
	
	// 상품상세에서 리뷰리스트
	public List<Review> productReviewList(Review review);
	public int productReviewTotCnt(String productCode);
	
	// 마이페이지에서 리뷰리스트
	public List<Review> memberWriteList(Review review);
	public int memberWriteCnt(String memberId);
	
}
