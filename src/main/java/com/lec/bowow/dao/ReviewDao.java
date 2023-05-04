package com.lec.bowow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.bowow.model.Review;

@Mapper
public interface ReviewDao {
	public List<Review>reviewList(Review review);
	public int totCntReview(Review review);
}
