package com.lec.bowow.service;

import java.util.List;

import com.lec.bowow.model.Review;

public interface ReviewService {
	public List<Review>reviewList(Review review, String pageNum);
	public int totCntReview(Review review);
}
