package com.lec.bowow.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.bowow.model.Review;

public interface ReviewService {
	public List<Review>reviewList(Review review, String pageNum);
	public int totCntReview(Review review);
	public Review reviewProduct(String productCode);
	public int writeReview(Review review, MultipartHttpServletRequest mRequest, HttpServletRequest request, String reviewRating);
	public Review getDetailReview(int reviewNum);
	public int modifyReview(Review review, MultipartHttpServletRequest mRequest, HttpServletRequest request, String reviewRating, HttpSession session);
	public int deleteReview(int reviewNum);
}
