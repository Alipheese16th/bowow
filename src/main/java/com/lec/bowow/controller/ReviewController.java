package com.lec.bowow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.bowow.model.Review;
import com.lec.bowow.service.ReviewService;
import com.lec.bowow.util.Paging;

@Controller
@RequestMapping(value="review")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(Review review, String pageNum, Model model) {
		model.addAttribute("reviewList", reviewService.reviewList(review, pageNum));
		model.addAttribute("paging", new Paging(reviewService.totCntReview(review), pageNum, 10, 5));
		return "review/list";
	}
}
