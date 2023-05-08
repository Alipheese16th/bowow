package com.lec.bowow.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.lec.bowow.model.Review;
import com.lec.bowow.model.ReviewComment;
import com.lec.bowow.service.CartService;
import com.lec.bowow.service.OrderService;
import com.lec.bowow.service.ReviewCommentService;
import com.lec.bowow.service.ReviewService;
import com.lec.bowow.util.Paging;

@Controller
@RequestMapping(value="review")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;
	@Autowired
	private ReviewCommentService reviewCommentService;
	@RequestMapping(value="list", method= {RequestMethod.GET,RequestMethod.POST})
	public String list(Review review, String pageNum, Model model) {
		model.addAttribute("reviewList", reviewService.reviewList(review, pageNum));
		model.addAttribute("paging", new Paging(reviewService.totCntReview(review), pageNum, 16, 5));
		return "review/list";
	}
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String writeView(String productCode, String orderCode, Model model) {
		model.addAttribute("reviewProduct", reviewService.reviewProduct(productCode));
		model.addAttribute("orderDetail", orderService.contentOrderDetail(orderCode));
		model.addAttribute("sizeList",cartService.sizeList());
		model.addAttribute("colorList",cartService.colorList());
		return "review/write";
	}
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(@ModelAttribute("rDto") Review review, Model model, MultipartHttpServletRequest mRequest, HttpServletRequest request, String reviewRating) {
		model.addAttribute("reviewWriteResult", reviewService.writeReview(review, mRequest, request,reviewRating));
		return "forward:list.do";
	}
	@RequestMapping(value="content", method= {RequestMethod.GET,RequestMethod.POST})
	public String content(String commentPageNum, int reviewNum, Model model) {
		model.addAttribute("contentReview", reviewService.getDetailReview(reviewNum));
		// 리뷰글 댓글리스트 출력
		model.addAttribute("rcommentList", reviewCommentService.rcommentList(reviewNum, commentPageNum, model));
		return "review/content";
	}
	@RequestMapping(value="modify",method=RequestMethod.GET)
	public String modifyView(String pageNum, int reviewNum, String productCode, Model model) {
		model.addAttribute("contentReview", reviewService.getDetailReview(reviewNum));
		model.addAttribute("reviewProduct", reviewService.reviewProduct(productCode));
		model.addAttribute("sizeList",cartService.sizeList());
		model.addAttribute("colorList",cartService.colorList());
		return "review/modify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify(@ModelAttribute("rDto") Review review, Model model, MultipartHttpServletRequest mRequest, HttpServletRequest request, String reviewRating, String pageNum, HttpSession session) {
		int modifyResult = reviewService.modifyReview(review, mRequest, request, reviewRating, session);
		if(modifyResult==0) {
			return "redirect:../login.do?after=main.do";
		}
		return "redirect:list.do?pageNum="+pageNum+"&modifyResult="+modifyResult+"category="+review.getCategory()+"&schWord="+review.getSchWord();
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int reviewNum, Model model) {
		model.addAttribute("deleteReivewResult", reviewService.deleteReview(reviewNum));
		return "forward:list.do";
	}
	// 리뷰글 댓글 작성
	@RequestMapping(value="rcommentWrite",method=RequestMethod.POST)
	public String rcommentWrite(ReviewComment reviewComment, HttpServletRequest request, Model model) {
		reviewCommentService.rcommentWrite(reviewComment, request, model);
		return "forward:content.do";
	}
	// 리뷰글 댓글 수정
	@RequestMapping(value="rcommentModify", method=RequestMethod.GET)
	public String rcommentModifyView(int commentNum, Model model) {
		model.addAttribute("comment", reviewCommentService.getRcomment(commentNum));
		return "review/rcommentModify";
	}
	@RequestMapping(value="rcommentModify", method=RequestMethod.POST)
	public String rcommentModify(ReviewComment reviewComment, Model model, HttpServletRequest request) {
		reviewCommentService.rcommentModify(reviewComment, request);
		return "forward:content.do";
	}
	@RequestMapping(value="rcommentDelete", method=RequestMethod.GET)
	public String rcommentDelete(int commentNum) {
		reviewCommentService.rcommentDelete(commentNum);
		return "forward:content.do";
	}
}
