package com.lec.bowow.dao;

import java.util.List;

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
}
