package com.lec.bowow.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.ReviewDao;
import com.lec.bowow.model.Review;
import com.lec.bowow.util.Paging;
@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao reviewDao;
	@Override
	public List<Review> reviewList(Review review, String pageNum) {
		Paging paging = new Paging(reviewDao.totCntReview(review), pageNum, 10, 5);
		review.setStartRow(paging.getStartRow());
		review.setEndRow(paging.getEndRow());		
		return reviewDao.reviewList(review);
	}

	@Override
	public int totCntReview(Review review) {
		return reviewDao.totCntReview(review);
	}
}
